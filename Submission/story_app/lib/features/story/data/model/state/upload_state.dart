import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_state.freezed.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState.loading(bool isLoading) = UploadStateLoading;
  const factory UploadState.success(String response) = UploadStateSuccess;
  const factory UploadState.error(String message) = UploadStateError;
}
