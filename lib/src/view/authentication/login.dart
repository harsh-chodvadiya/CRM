import 'package:flutter/material.dart';
import 'package:crm/src/constant/constant.dart';
import 'package:crm/src/widget/button.dart';
import 'package:crm/src/widget/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.r),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email Address'),
              SizedBox(height: 8.0.r),
              MyFormField(
                controller: _email,
                hintText: 'example@mail.com',
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value?.trim() == null ||
                      (value?.trim().isEmpty ?? true)) {
                    return 'Please enter email address';
                  } else if (!value!.trim().isEmail) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0.r),
              const Text('Password'),
              SizedBox(height: 8.0.r),
              MyFormField(
                controller: _password,
                hintText: '********',
                obscureText: true,
                maxLines: 1,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value?.trim() == null ||
                      (value?.trim().isEmpty ?? true)) {
                    return 'Please enter password';
                  } else if (!value!.trim().isPasswordEasy) {
                    return 'Please enter minimum 8 characters & can not contain spaces';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0.r),
              PrimaryButton(
                fixedSize: Size.fromWidth(context.width),
                onPressed: () async => _onLogin(),
                text: 'Login',
              ),
              SizedBox(height: 24.0.r),
              const LocaleText(dataKey: 'hello'),
              const LocaleText(dataKey: 'hello'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onLogin() async {
    // if (_formKey.currentState!.validate()) {}
    if (Nexus.locale == const Locale('en', 'US')) {
      Nexus.changeLocale(const Locale('hi', 'IN'));
    } else {
      Nexus.changeLocale(const Locale('en', 'US'));
    }
  }
}
