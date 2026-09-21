import 'package:experience_app/auth_service.dart';
import 'package:experience_app/core/utils/assets.dart';
import 'package:experience_app/features/login/presentation/state/auth_notifier_provider.dart';
import 'package:experience_app/features/login/presentation/views/widgets/social_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  LoginView({super.key});
  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    // final loginProvider = Provider.of<LoginProvider>(context);
    // context.watch<LoginProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.asset(
            Assets.background,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            alignment: AlignmentGeometry.topCenter,
          ),
          BodyWidget(),
        ],
      ),
    );
  }
}

class BodyWidget extends ConsumerStatefulWidget {
  BodyWidget({super.key});
  @override
  ConsumerState<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends ConsumerState<BodyWidget> {
  bool showPassword = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      await authService.value.signIn(
        emailController.text.trim(),
        passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('Code: ${e.code}');
      debugPrint('Message: ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    // final loc = AppLocalizations.of(context)!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth > 600
                ? (constraints.maxWidth - 600) / 2 * 24
                : 24,
            vertical: 40,
          ),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              Text(
                "Bienvenido",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                cursorColor: Color(0xFF006FFD),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: InkWell(
                    child: Icon(Icons.visibility_off),
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
                cursorColor: Color(0xFF006FFD),
                obscureText: !showPassword,
              ),
              SizedBox(height: 16),
              Text(
                "Olvidaste tu contraseña?",
                style: TextStyle(
                  color: Color(0xFF006FFD),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF006FFD)),
                ),

                // onPressed: () async {
                //   final email = emailController.text;
                //   final password = passwordController.text;

                //await signIn();
                // context.read<LoginProvider>().login(email, password);

                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => RechargeScreen()),
                // );
                onPressed: authState.isLoading
                    ? null
                    : () async {
                        await ref
                            .read(authNotifierProvider.notifier)
                            .signIn(
                              emailController.text.trim(),
                              passwordController.text,
                            );
                      },
                child: authState.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),

              if (authState.errorMessage != null)
                Text(
                  authState.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),

              SizedBox(height: 26),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "No tienes una cuenta? ",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Registrate",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Register now");
                        },
                      style: TextStyle(
                        color: Color(0xFF006FFD),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Divider(color: Colors.grey),
              SizedBox(height: 24),
              Text("O inicia sesión con", textAlign: TextAlign.center),
              SizedBox(height: 16),
              SocialRow(),
            ],
          ),
        );
      },
    );
  }
}

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        SocialWidget(color: Colors.red, imageAsset: Assets.google),
        SocialWidget(color: Colors.black, imageAsset: Assets.apple),
        SocialWidget(color: Colors.blue, imageAsset: Assets.facebook),
      ],
    );
  }
}
