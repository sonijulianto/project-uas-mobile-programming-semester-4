import 'package:flutter/material.dart';
import 'package:submission_flutter_pemua/bloc/login_bloc.dart';
import 'package:submission_flutter_pemua/helpers/user_info.dart';
import 'package:submission_flutter_pemua/pages/home_page.dart';
import 'package:submission_flutter_pemua/pages/sign_up_page.dart';
import 'package:submission_flutter_pemua/widget/warning_dialog.dart';
import '../theme.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Masuk untuk melanjutkan',
              style: subtittleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/email-icon.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackTextStyle,
                        controller: _emailTextboxController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'masukan email',
                          hintStyle: subtittleTextStyle,
                        ),
                        validator: (value) {
//validasi harus diisi
                          if (value.isEmpty) {
                            return 'Email harus diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/password-icon.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackTextStyle,
                        obscureText: true,
                        controller: _passwordTextboxController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'masukan password',
                          hintStyle: subtittleTextStyle,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password harus diisi";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    void _submit() {
      _formKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      LoginBloc.login(
              email: _emailTextboxController.text,
              password: _passwordTextboxController.text)
          .then((value) async {
        await UserInfo().setToken(value.token);
        await UserInfo().setUserID(value.userID);
        Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => HomePage()));
      }, onError: (error) {
        print(error);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => WarningDialog(
                  description: "Login gagal, silahkan coba lagi",
                ));
      });
      setState(() {
        _isLoading = false;
      });
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            var validate = _formKey.currentState.validate();
            if (validate) {
              if (!_isLoading) _submit();
            }
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            'Masuk',
            style: primaryTextStyle.copyWith(
              color: primaryTextColor,
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'belum memiliki akun? ',
              style: subtittleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text(
                'Daftar',
                style: purpleTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                emailInput(),
                passwordInput(),
                signInButton(),
                Spacer(),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
