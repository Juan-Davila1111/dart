import 'AppException.dart';
export 'SafeTryCatch.dart';

T execute<T>(T Function() action, String operation) {
  try {
    return action();
  } on AppException {
    rethrow;
  } catch (e) {
    throw AppException('Error al $operation: $e');
  }
}
