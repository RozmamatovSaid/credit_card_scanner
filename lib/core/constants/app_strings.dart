class AppStrings {
  AppStrings._();
  static const String unknown = 'Nomalum xatolik';
  static const String appTitle = 'Card Scanner';
  static const String addCardTitle = "Karta qo'shish";
  static const String addCardDescription =
      "Kartangizni qo'lda kiriting yoki kamera va NFC orqali tezkor skaner qiling.";
  static const String panLabel = 'Plastik karta raqami (PAN)';
  static const String panHint = '8600 1234 5678 9012';
  static const String expiryLabel = 'Amal qilish muddati (Expiry)';
  static const String expiryHint = 'MM/YY';
  static const String scanMethodsTitle = 'Skanerlash usullari';
  static const String cameraScanTitle = 'Kamera orqali scanner qilish';
  static const String cameraScanSubtitle =
      "Kartani ramkaga olib keling va ma'lumotlarni avtomatik o'qing.";
  static const String nfcScanTitle = "NFC orqali ma'lumotlarni o'qish";
  static const String nfcScanSubtitle =
      "Kartani qurilmaga yaqinlashtirib chipdagi ma'lumotlarni o'qing.";
  static const String digitalCard = 'Digital Card';
  static const String maskedCardNumber = '****  ****  ****  9012';
  static const String cardHolder = 'Karta egasi';
  static const String cardHolderName = 'YOUR NAME';
  static const String expiry = 'Expiry';
  static const String nfcHoldCardNearPhone =
      'Kartani telefonga yaqinlashtiring';
  static const String nfcNoDataReturned = 'NFC ma’lumot qaytarmadi';
  static const String nfcUnsupported =
      'Bu qurilma NFC’ni qo‘llab-quvvatlamaydi';
  static const String nfcDisabled =
      'Telefoningizda NFC o‘chiq. Iltimos, NFC’ni yoqing';
  static const String nfcTagLost =
      'Karta telefondan uzoqlashdi. Iltimos, kartani qimirlatmasdan ushlab turing';
  static const String nfcReadFailed =
      'Karta ma’lumotlarini o‘qib bo‘lmadi. Boshqa karta bilan urinib ko‘ring';
  static const String nfcUnknownError =
      'NFC orqali o‘qishda noma’lum xatolik yuz berdi';
  static const String defaultInputHint = '000.00';
}
