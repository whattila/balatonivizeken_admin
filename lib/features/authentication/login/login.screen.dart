import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken_admin/features/authentication/login/providers/login.controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rustic/option.dart';
import 'package:rustic/result.dart';
import '../../../shared/consts/colors.dart';
import '../../../shared/repositories/user_storage/models/user.model.dart';
import '../../../shared/router/router.dart';
import '../../../shared/widgets/unattached_screens_wrapper.dart';
import '../common_widgets/landing_screen_divider.dart';
import '../common_widgets/landing_screen_text_field.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _title(BuildContext context) {
    return const Text(
      'Üdv, újra!',
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
      onSubmitted: onSubmitted,
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return GestureDetector(
        child: const Text(
          'Elfelejtett jelszó?',
          textAlign: TextAlign.right,
          style: TextStyle(
            decorationStyle: TextDecorationStyle.solid,
            color: BalatoniVizekenColors.purple,
          ),
        ),
        onTap: () => {context.router.push(ForgotPasswordRoute())});
  }

  void _signIn(BuildContext context, WidgetRef ref) {
    ref.read(loginControllerProvider.notifier).login(username: _usernameController.text, password: _passwordController.text);
  }

  Widget _signInButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text('Bejelentkezés'),
      onPressed: () {
        _signIn(context, ref);
      },
    );
  }

  Widget _getStarted(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Nincs felhasználója? ",
        style: const TextStyle(color: BalatoniVizekenColors.white),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router.push(const RegisterRoute());
              },
            text: 'Csináljunk egyet!',
            style: const TextStyle(color: BalatoniVizekenColors.purple, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        _title(context),
        const SizedBox(height: 16),
        AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _textField(
                context,
                controller: _usernameController,
                hintText: 'Felhasználónév',
                //TODO hint text
                autofillHints: ['Felhasználónév'],
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              _textField(
                context,
                controller: _passwordController,
                hintText: 'Jelszó',
                //TODO hint text
                autofillHints: ['Jelszó'],
                textInputAction: TextInputAction.done,
                onSubmitted: (value) => _signIn(context, ref),
                obscureText: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _forgotPassword(context),
        const SizedBox(height: 16),
        _signInButton(context, ref),
        const SizedBox(height: 8),
        const LandingScreenDivider(),
        const SizedBox(height: 8),
        _getStarted(context),
        const Spacer(),
      ],
    );
  }

  Null _clearTextFields() {
    _usernameController.clear();
    _passwordController.clear();
    return null;
  }

  bool _isLoading({required Option<Result<Option<UserDto>, Object>> login}) {
    return login.map(
          (result) => result.map(
            (option) => option.map(
              (userDto) => false,   // Ha van UserDto, akkor nincs betöltés
        ).unwrapOr(true),        // Ha nincs UserDto (None), akkor töltődik
      ).unwrapOr(false),         // Ha hiba van (Err), akkor nincs betöltés
    ).unwrapOr(false);           // Ha nincs login opció (None), akkor nincs betöltés
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginControllerProvider, (_, next) {
      next.map(
            (value) => value.map(
              (option) => option.map(
                (userDto) {
              _clearTextFields();
              context.router.replaceAll([const DashboardRoute()]);
            },
          ).unwrapOr(null), // Ha nincs UserDto (None), akkor nem csinál semmit (null)
        ).unwrapOr(_clearTextFields()), // Ha hiba van (Err), akkor tisztítja a mezőket
      ).unwrapOr(null); // Ha nincs "next" opció (None), akkor nem csinál semmit (null)
    });

    final login = ref.watch(loginControllerProvider);
    return UnattachedScreensWrapper(isLoading: _isLoading(login: login), canPop: false, content: _body(context, ref));
  }
}