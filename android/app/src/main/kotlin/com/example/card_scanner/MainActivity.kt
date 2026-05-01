package com.example.card_scanner

import android.app.PendingIntent
import android.content.Intent
import android.nfc.NfcAdapter
import android.nfc.Tag
import android.nfc.tech.IsoDep
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.Locale

class MainActivity : FlutterActivity() {
    private val channelName = "native_nfc_card"
    private var channel: MethodChannel? = null
    private var nfcAdapter: NfcAdapter? = null
    private var pendingResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)

        channel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "startNfc" -> {
                    pendingResult = result
                    enableNfc()
                }
                "stopNfc" -> {
                    disableNfc()
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        nfcAdapter = NfcAdapter.getDefaultAdapter(this)
    }

    override fun onPause() {
        super.onPause()
        disableNfc()
    }

    private fun enableNfc() {
        val adapter = nfcAdapter

        if (adapter == null) {
            pendingResult?.error("NFC_UNSUPPORTED", "NFC qo‘llab-quvvatlanmaydi", null)
            pendingResult = null
            return
        }

        if (!adapter.isEnabled) {
            pendingResult?.error("NFC_DISABLED", "NFC o‘chiq", null)
            pendingResult = null
            return
        }

        val intent = Intent(this, javaClass).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)

        val pendingIntent = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_MUTABLE)

        adapter.enableForegroundDispatch(this, pendingIntent, null, null)
    }

    private fun disableNfc() {
        try {
            nfcAdapter?.disableForegroundDispatch(this)
        } catch (_: Exception) {}
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)

        val tag = intent.getParcelableExtra<Tag>(NfcAdapter.EXTRA_TAG) ?: return

        try {
            val card = readBankCard(tag)

            disableNfc()

            if (card == null) {
                pendingResult?.error("READ_FAILED", "Karta ma’lumotlari o‘qilmadi", null)
            } else {
                pendingResult?.success(card)
            }

            pendingResult = null
        } catch (e: Exception) {
            disableNfc()
            pendingResult?.error("NFC_ERROR", e.message, null)
            pendingResult = null
        }
    }

    private fun readBankCard(tag: Tag): Map<String, String>? {
        val isoDep = IsoDep.get(tag) ?: return null

        isoDep.connect()
        isoDep.timeout = 7000

        try {
            val ppse = isoDep.transceive(hexToBytes("00A404000E325041592E5359532E444446303100"))

            val aid = findTag(ppse, "4F") ?: return null

            val selectApp =
                    isoDep.transceive(
                            hexToBytes("00A40400") +
                                    byteArrayOf((aid.length / 2).toByte()) +
                                    hexToBytes(aid) +
                                    byteArrayOf(0x00)
                    )

            var pan = findTag(selectApp, "5A")
            var expiry = findTag(selectApp, "5F24")

            if (pan == null || expiry == null) {
                for (sfi in 1..10) {
                    for (record in 1..10) {
                        val p2 = ((sfi shl 3) or 4).toByte()
                        val command = byteArrayOf(0x00, 0xB2.toByte(), record.toByte(), p2, 0x00)

                        val response = isoDep.transceive(command)

                        if (!isSuccess(response)) continue

                        if (pan == null) pan = findTag(response, "5A")
                        if (expiry == null) expiry = findTag(response, "5F24")

                        val track2 = findTag(response, "57")
                        if (track2 != null) {
                            val parsed = parseTrack2(track2)

                            if (pan == null) pan = parsed["pan"]
                            if (expiry == null) expiry = parsed["expiry"]
                        }

                        if (pan != null && expiry != null) break
                    }

                    if (pan != null && expiry != null) break
                }
            }

            if (pan == null || expiry == null) return null

            return mapOf("pan" to cleanPan(pan), "expiry" to formatExpiry(expiry))
        } finally {
            isoDep.close()
        }
    }

    private fun parseTrack2(track2: String): Map<String, String> {
        val clean = track2.uppercase(Locale.US).replace("F", "")
        val separatorIndex = clean.indexOf('D')

        if (separatorIndex == -1) return emptyMap()

        val pan = clean.substring(0, separatorIndex)
        val expiry = clean.substring(separatorIndex + 1, separatorIndex + 5)

        return mapOf("pan" to pan, "expiry" to expiry)
    }

    private fun cleanPan(value: String): String {
        return value.replace("F", "")
    }

    private fun formatExpiry(value: String): String {
        val clean = value.replace("F", "")

        return if (clean.length >= 4) {
            val yy = clean.substring(0, 2)
            val mm = clean.substring(2, 4)
            "$mm/$yy"
        } else {
            clean
        }
    }

    private fun isSuccess(bytes: ByteArray): Boolean {
        if (bytes.size < 2) return false
        return bytes[bytes.size - 2] == 0x90.toByte() && bytes[bytes.size - 1] == 0x00.toByte()
    }

    private fun findTag(bytes: ByteArray, tag: String): String? {
        val hex = bytesToHex(bytes)
        val index = hex.indexOf(tag)

        if (index == -1) return null

        val lengthIndex = index + tag.length
        if (lengthIndex + 2 > hex.length) return null

        val length = hex.substring(lengthIndex, lengthIndex + 2).toInt(16)
        val valueStart = lengthIndex + 2
        val valueEnd = valueStart + length * 2

        if (valueEnd > hex.length) return null

        return hex.substring(valueStart, valueEnd)
    }

    private fun hexToBytes(hex: String): ByteArray {
        val result = ByteArray(hex.length / 2)

        for (i in result.indices) {
            val index = i * 2
            result[i] = hex.substring(index, index + 2).toInt(16).toByte()
        }

        return result
    }

    private fun bytesToHex(bytes: ByteArray): String {
        return bytes.joinToString("") { "%02X".format(it) }
    }
}
