import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../constants.dart';
import 'api_result.dart';
import 'app_exception.dart';

@singleton
class ApiManager {
  Future<Result<T>> execute<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return SuccessResult<T>(response);
    } on SocketException {
      return FailureResult<T>(
        InternetConnectionException(message: Constants.noInternetConnection),
      );
    } on DioException catch (e) {
      return _handleDioException<T>(e);
    } on FirebaseAuthException catch (e) {
      return FailureResult<T>(
        FirebaseAuthCustomException(
          message: e.message ?? Constants.authenticationError,
        ),
      );
    } on FirebaseException catch (e) {
      return FailureResult<T>(
        FirebaseGeneralException(message: e.message ?? Constants.firebaseError),
      );
    } on FormatException {
      return FailureResult<T>(
        DataParsingException(message: Constants.dataParsingError),
      );
    } catch (e) {
      return FailureResult<T>(
        UnknownApiException(message: Constants.unexpectedError),
      );
    }
  }

  Result<T> _handleDioException<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return FailureResult<T>(
          ApiTimeoutException(message: _getTimeoutMessage(e.type)),
        );
      case DioExceptionType.badCertificate:
        return FailureResult<T>(
          CertificateException(message: Constants.invalidCertificate),
        );
      case DioExceptionType.badResponse:
        if (e.response == null) {
          return FailureResult<T>(
            UnknownApiException(message: Constants.unexpectedServerError),
          );
        }
        return _handleBadResponse<T>(e.response!);
      case DioExceptionType.cancel:
        return FailureResult<T>(
          RequestCancelledException(message: Constants.requestCancelled),
        );
      case DioExceptionType.connectionError:
        return FailureResult<T>(
          InternetConnectionException(message: Constants.connectionFailed),
        );
      case DioExceptionType.unknown:
        return FailureResult<T>(
          UnknownApiException(message: e.message ?? Constants.unexpectedError),
        );
    }
  }

  Result<T> _handleBadResponse<T>(Response response) {
    final statusCode = response.statusCode ?? 500;
    final errorMessage = _extractErrorMessage(response.data);

    switch (statusCode) {
      case 400:
        return FailureResult<T>(
          BadRequestException(message: errorMessage, statusCode: statusCode),
        );
      case 401:
        return FailureResult<T>(
          UnauthorizedException(message: errorMessage, statusCode: statusCode),
        );
      case 403:
        return FailureResult<T>(
          ForbiddenException(message: errorMessage, statusCode: statusCode),
        );
      case 404:
        return FailureResult<T>(
          NotFoundException(message: errorMessage, statusCode: statusCode),
        );
      case 500:
        return FailureResult<T>(
          InternalServerErrorException(
            message: errorMessage,
            statusCode: statusCode,
          ),
        );
      default:
        return FailureResult<T>(
          UnknownApiException(
            message: 'Unexpected error: $statusCode - $errorMessage',
          ),
        );
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['error']?.toString() ??
          data['message']?.toString() ??
          Constants.unexpectedServerError;
    }
    return data.toString();
  }

  String _getTimeoutMessage(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return Constants.connectionTimeout;
      case DioExceptionType.sendTimeout:
        return Constants.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return Constants.receiveTimeout;
      default:
        return Constants.timeoutOccurred;
    }
  }
}
