import 'package:byskopoyako/constants/route_names.dart';
import 'package:byskopoyako/services/authentication_service.dart';
import 'package:byskopoyako/services/dialog_service.dart';
import 'package:byskopoyako/services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';
import 'base_model.dart';

class LogInViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future logIn({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.logInWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General Login Failure. Please try again later!',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(SignUpViewRoute);
  }
}
