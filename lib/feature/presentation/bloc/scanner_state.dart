part of 'scanner_bloc.dart';

class ScannerState extends Equatable {
  final CardDetails? cardDetails;
  final Status status;
  final String? errorMessage;

  const ScannerState({
    this.cardDetails,
    this.status = Status.initial,
    this.errorMessage,
  });

  ScannerState copyWith({
    CardDetails? cardDetails,
    Status? status,
    String? errorMessage,
  }) {
    return ScannerState(
      cardDetails: cardDetails ?? this.cardDetails,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [cardDetails, status, errorMessage];
}