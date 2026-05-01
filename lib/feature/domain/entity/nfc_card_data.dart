import 'package:equatable/equatable.dart';

class NfcCardData extends Equatable {
  const NfcCardData({required this.pan, required this.expiry});

  final String pan;
  final String expiry;

  @override
  List<Object?> get props => [pan, expiry];
}
