import 'package:dio/dio.dart';

/// Local compatibility `ParseErrorLogger` with the older 3-arg signature
/// used by the currently-generated code. Keep this internal so we don't
/// conflict with `package:retrofit`'s type if you later upgrade.
abstract class ParseErrorLogger {
  void logError(Object error, StackTrace stackTrace, RequestOptions options);
}
