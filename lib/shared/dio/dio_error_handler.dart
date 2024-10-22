import 'package:dio/dio.dart';

import '../widgets/network_issue.dart';

class DioErrorHandler {
  static String _handleResponseError(DioError e) {
    assert(e.type == DioErrorType.badResponse, '_handleResponseError can only handle type of DioErrorType.response');
    final statusCode = e.response?.statusCode;
    if (e.response?.data["message"] != null) {
      return e.response?.data["message"];
    }
    if (statusCode == 500) {
      return 'Belső szerverhiba';
    }
    if (statusCode == 401) {
      return 'Autentikációs hiba';
    }
    if (statusCode == 503) {
      return 'Szerver nem elérhető';
    }
    return 'Valami hiba történt, lépjen kapcsolatba ügyfélszolgálatunkkal!';
  }

  static String _handleOtherError(DioError e) {
    assert(e.type == DioErrorType.unknown, '_handleOtherError can only handle type of DioErrorType.other');
    if (e.error is TypeError) {
      return 'Applikáció hiba történt, lépjen kapcsolatba ügyfélszolgálatunkkal!';
    }
    return 'Valami hiba történt, lépjen kapcsolatba ügyfélszolgálatunkkal!';
  }

  static void _handleTimeout({DioError? e}) {
    assert(
    e == null || e.type == DioErrorType.badResponse,
    '_handleTimeout can only handle type of DioErrorType.response or null',
    );
    if (e == null) {
      NetworkIssue.showSnackbar();
    } else {
      final statusCode = e.response?.statusCode;
      if (statusCode == 404) {
        NetworkIssue.showSnackbar();
      }
    }
  }

  static void handleErrorMessage(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        _handleTimeout();
        break;
      case DioErrorType.sendTimeout:
        _handleTimeout();
        break;
      case DioErrorType.receiveTimeout:
        _handleTimeout();
        break;
      case DioErrorType.badResponse:
        _handleTimeout(e: e);
        break;
      case DioErrorType.cancel:
        _handleTimeout();
        break;
      case DioErrorType.unknown:
        break;
      case DioErrorType.badCertificate:
        break;
      case DioErrorType.connectionError:
        _handleTimeout();
        break;
    }
  }

  static String getErrorMessage(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return 'Időtúllépés, kérjük próbálja újra, vagy ellenőrízze internet kapcsolatát!';
      case DioErrorType.sendTimeout:
        return 'Időtúllépés, kérjük próbálja újra, vagy ellenőrízze internet kapcsolatát!';
      case DioErrorType.receiveTimeout:
        return 'Időtúllépés, kérjük próbálja újra, vagy ellenőrízze internet kapcsolatát!';
      case DioErrorType.badResponse:
        return _handleResponseError(e);
      case DioErrorType.cancel:
        return 'Valami hiba történt, próbálja újra';
      case DioErrorType.unknown:
        return _handleOtherError(e);
      case DioErrorType.badCertificate:
        return _handleOtherError(e);
      case DioErrorType.connectionError:
        return 'Időtúllépés, kérjük próbálja újra, vagy ellenőrízze internet kapcsolatát!';
    }
  }

  static bool isFatal(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return false;
      case DioErrorType.sendTimeout:
        return false;
      case DioErrorType.receiveTimeout:
        return false;
      case DioErrorType.badResponse:
        return _isResponseErrorFatal(e);
      case DioErrorType.cancel:
        return false;
      case DioErrorType.unknown:
        return true;
      case DioErrorType.badCertificate:
        return true;
      case DioErrorType.connectionError:
        return false;
    }
  }

  static bool _isResponseErrorFatal(DioError e) {
    assert(e.type == DioErrorType.badResponse, '_handleResponseError can only handle type of DioErrorType.response');
    final statusCode = e.response?.statusCode;
    if (statusCode == 500) {
      return true;
    }
    if (statusCode == 401) {
      return false;
    }
    if (statusCode == 503) {
      return true;
    }
    return true;
  }
}