import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken_admin/features/authentication/register/providers/register.controller.dart';
import 'package:balatonivizeken_admin/shared/consts/screen_widths.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rustic/option.dart';
import 'package:rustic/result.dart';
import '../../../shared/consts/colors.dart';
import '../../../shared/repositories/user_storage/models/user.model.dart';
import '../../../shared/router/router.dart';
import '../../../shared/widgets/snack.dart';
import '../../../shared/widgets/unattached_screens_wrapper.dart';
import '../common_widgets/landing_screen_text_field.dart';
import '../login/providers/login.controller.dart';
import '../user_type.enum.dart';
import 'models/registration.model.dart';

@RoutePage()
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _familyNameController = TextEditingController();

  final _givenNameController = TextEditingController();

  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _invitationCodeController = TextEditingController();

  bool _validate(TextEditingController controller) {
    return controller.text.isNotEmpty;
  }

  bool get _isValid {
    final validations = [
      _validate(_familyNameController),
      _validate(_givenNameController),
      _validate(_usernameController),
      _validate(_emailController),
      _validate(_phoneNumberController),
      _validate(_passwordController),
      _validate(_confirmPasswordController),
      _validate(_invitationCodeController)
    ];
    return validations.every((isValid) => isValid);
  }

  Widget _title(BuildContext context) {
    return const Text(
      "Regisztráció",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }

  Widget _textField(
      BuildContext context, {
        required TextEditingController controller,
        required String hintText,
        required Iterable<String> autofillHints,
        required TextInputAction textInputAction,
        void Function(String value)? onSubmitted,
        bool obscureText = false,
      }) {
    return LandingScreenTextField(
      controller: controller,
      hintText: hintText,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onChanged: (value) => setState(() {}),
      onSubmitted: onSubmitted,
      labelTextSuffix: ' *',
    );
  }

  bool _passwordsMatch(BuildContext context) {
    return _passwordController.text == _confirmPasswordController.text;
  }

  void _register(BuildContext context) {
    if (!_passwordsMatch(context)) {
      Snack.show(context, text: "A jelszavak nem egyeznek");
      return;
    }
    ref.read(registerControllerProvider.notifier).register(
      registrationDto: RegistrationDto(
          username: _usernameController.text,
          familyName: _familyNameController.text,
          givenName: _givenNameController.text,
          emailAddress: _emailController.text,
          phoneNumber: _phoneNumberController.text,
          password: _passwordController.text,
          userType: UserType.admin,
          invitationCode: _invitationCodeController.text
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _isValid ? () => _register(context) : null,
      child: const Text('Regisztrálás'),
    );
  }

  Widget _termsAndConditions(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'A folytatással beleegyezel a következőkbe:\n ',
        style: const TextStyle(color: BalatoniVizekenColors.white),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO webview or different page or popup
              },
            text: 'Általános Szerződési Feltételek',
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
          const TextSpan(
            text: ' és ',
            style: TextStyle(),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO webview or different page or popup
              },
            text: 'Adatvédelmi nyilatkozat',
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Center(  // A Column középre igazításához
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: BalatoniVizekenScreenWidths.medium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            _title(context),
            const SizedBox(height: 16),
            AutofillGroup(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  _textField(
                    context,
                    controller: _familyNameController,
                    hintText: 'Vezetéknév',
                    autofillHints: ['Vezetéknév'],
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _textField(
                    context,
                    controller: _givenNameController,
                    hintText: 'Keresztnév',
                    autofillHints: ['Keresztnév'],
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _textField(
                    context,
                    controller: _usernameController,
                    hintText: 'Felhasználónév',
                    autofillHints: ['Felhasználónév'],
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _textField(
                    context,
                    controller: _emailController,
                    hintText: 'Email-cím',
                    autofillHints: ['Email-cím'],
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _textField(
                    context,
                    controller: _phoneNumberController,
                    hintText: 'Telefonszám',
                    autofillHints: ['Telefonszám'],
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _textField(
                    context,
                    controller: _passwordController,
                    hintText: 'Jelszó',
                    autofillHints: ['Jelszó'],
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  _textField(
                    context,
                    controller: _confirmPasswordController,
                    hintText: 'Jelszó megerősítés',
                    autofillHints: ['Jelszó megerősítés'],
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  _textField(
                    context,
                    controller: _invitationCodeController,
                    hintText: 'Ellenőrző kód',
                    autofillHints: ['Adminisztrátorként kapott ellenőrző kód'],
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      if (_isValid) {
                        _register(context);
                      }
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  _termsAndConditions(context),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _registerButton(context),
            const Spacer(),
          ],
        ),
      ),
    );
  }


  bool _isLoading({
    required Option<Result<Option<void>, Object>> register,
    required Option<Result<Option<UserDto>, Object>> login,
  }) {
    // login állapot kezelése
    final loginLoading = login.map(
          (value) => value.map(
            (option) => option.map(
              (userDto) => false,   // Ha van UserDto, nincs betöltés
        ).unwrapOr(true),        // Ha nincs UserDto (None), akkor betöltés alatt
      ).unwrapOr(false),         // Ha hiba van (Err), nincs betöltés
    ).unwrapOr(false);           // Ha nincs login opció (None), nincs betöltés

    // register állapot kezelése
    final registerLoading = register.map(
          (value) => value.map(
            (option) => option.map(
              (_) => false,          // Ha a belső Option tartalmaz valamit (void), nincs betöltés
        ).unwrapOr(true),        // Ha nincs érték (None), betöltés alatt
      ).unwrapOr(false),         // Ha hiba van (Err), nincs betöltés
    ).unwrapOr(false);           // Ha nincs register opció (None), nincs betöltés

    // Ha bármelyik állapot betöltés alatt van, akkor true
    return loginLoading || registerLoading;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(registerControllerProvider, (_, next) {
      next.map(
        (value) => value.map(
          (option) => option.map(
            (_) {
              Snack.show(context, text: 'Sikeres regisztráció! Jelentkezzen be a létrehozott felhasználójával!');
              context.router.replaceAll([LoginRoute()]);
            },
          ).unwrapOr(null),  // Ha nincs belső érték (None), nem csinál semmit
        ).unwrapOr(() {
          // TODO: itt mit lenne érdemes csinálni?
        }()),  // Ha hiba van (Err), ide jön a hibakezelés
      ).unwrapOr(null);  // Ha nincs érték (None), nem történik semmi
    });

    final register = ref.watch(registerControllerProvider);
    final login = ref.watch(loginControllerProvider);

    return UnattachedScreensWrapper(
      isLoading: _isLoading(register: register, login: login),
      canPop: true,
      content: _body(context),
    );
  }
}