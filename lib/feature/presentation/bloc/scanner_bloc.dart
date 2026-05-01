import 'package:bloc/bloc.dart';
import 'package:card_scan_app/core/constants/app_strings.dart';
import 'package:card_scan_app/core/enums/enums.dart';
import 'package:card_scanner/card_scanner.dart';
import 'package:equatable/equatable.dart';
part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super(const ScannerState()) {
    on<ScanEvent>(_onScanEvent);
  }

  Future<void> _onScanEvent(ScanEvent event, Emitter<ScannerState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final options = CardScanOptions(
        scanExpiryDate: true,
        scanCardHolderName: false,
      );

      final details = await CardScanner.scanCard(scanOptions: options);

      if (details != null) {
        emit(state.copyWith(cardDetails: details, status: Status.success));
      } else {
        emit(state.copyWith(status: Status.initial));
      }
    } catch (e) {
      emit(
        state.copyWith(status: Status.error, errorMessage: AppStrings.unknown),
      );
    }
  }
}
