enum Status {
  initial,
  loading,
  success,
  error,
  paginate;

  bool get isLoading => this == Status.loading;

  bool get isInitial => this == Status.initial;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;

  bool get isPaginate => this == Status.paginate;
}

enum NfcStatus {
  unsupported, // > support qilmaydi
  disabled, // > nfc o'chik holatda
  tagLost,// > karta telefondan tez uzilsa
  readFailed, // > kartani o'qishda xatolik bo'lsa
  unknown, // > nomalum xatolik
}
