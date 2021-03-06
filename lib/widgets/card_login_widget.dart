import 'package:flutter/material.dart';
import 'package:smarthome/screens/home_screen.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/utils/text_gradient.dart';
import 'package:validatorless/validatorless.dart';

class CardLoginWidget extends StatefulWidget {
  const CardLoginWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _CardLoginWidgetState createState() => _CardLoginWidgetState();
}

class _CardLoginWidgetState extends State<CardLoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    print('submit');
    bool formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextGradient(
              'Welcome home! Sign in to manage\nyour devices & accessories',
              fontSize: 17,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: Validatorless.multiple([
                      Validatorless.email('Enter any valid email.'),
                      Validatorless.required('Enter any valid email.')
                    ]),
                    onFieldSubmitted: (value) {
                      _passFocusNode.requestFocus();
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.email,
                          color: AppColors.iconColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    controller: _passwordController,
                    focusNode: _passFocusNode,
                    onFieldSubmitted: (value) {
                      _onSubmit();
                    },
                    validator: Validatorless.multiple([
                      Validatorless.min(3, 'Minimum 3 characters.'),
                      Validatorless.required('Enter any password'),
                    ]),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.lock,
                          color: AppColors.iconColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Ink(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [Color(0xff7080e1), Color(0xffc46de2)],
                        stops: [0.4, 1.0],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: _onSubmit,
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account yet?',
                        style: TextStyle(color: AppColors.iconColor),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Create an account',
                          style: TextStyle(color: Color(0xff5168c5)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
