import 'package:flutter/material.dart';
import 'package:submission_flutter_pemua/bloc/registrasi_bloc.dart';
import 'package:submission_flutter_pemua/pages/sign_in_page.dart';
import 'package:submission_flutter_pemua/widget/success_dialog.dart';
import 'package:submission_flutter_pemua/widget/warning_dialog.dart';

import '../theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Daftar untuk melanjutkan masuk',
              style: subtittleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
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
                        controller: _namaTextboxController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'nama lengkap',
                          hintStyle: subtittleTextStyle,
                        ),
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

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
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
                            if (value.isEmpty) {
                              return 'Email harus diisi';
                            }
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return "Email tidak valid";
                            }
                            return null;
                          }),
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
        margin: EdgeInsets.only(top: 15),
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
                          hintText: 'password',
                          hintStyle: subtittleTextStyle,
                        ),
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

    Widget rePasswordInput() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              're-password',
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
                          decoration: InputDecoration.collapsed(
                            hintText: 'ulangi password',
                            hintStyle: subtittleTextStyle,
                          ),
                          validator: (value) {
//jika inputan tidak sama dengan password
                            if (value != _passwordTextboxController.text) {
                              return "Konfirmasi Password tidak sama";
                            }
                            return null;
                          }),
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
      RegistrasiBloc.registrasi(
              nama: _namaTextboxController.text,
              email: _emailTextboxController.text,
              password: _passwordTextboxController.text)
          .then((value) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => SuccessDialog(
                  description: "Registrasi berhasil, silahkan login",
                  okClick: () {
                    Navigator.pop(context);
                  },
                ));
      }, onError: (error) {
        print(error);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => WarningDialog(
                  description: "Registrasi gagal, silahkan coba lagi",
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
        margin: EdgeInsets.only(top: 20),
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
            'Daftar',
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
              'Don\'t have an account? ',
              style: subtittleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => SignInPage()));
              },
              child: Text(
                'masuk',
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
                  nameInput(),
                  emailInput(),
                  passwordInput(),
                  rePasswordInput(),
                  signInButton(),
                  Spacer(),
                  footer(),
                ],
              ),
            )),
      ),
    );
  }
}

// class SignUpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget header() {
//       return Container(
//         margin: EdgeInsets.only(top: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Daftar',
//               style: blackTextStyle.copyWith(
//                 fontSize: 24,
//                 fontWeight: semiBold,
//               ),
//             ),
//             SizedBox(
//               height: 2,
//             ),
//             Text(
//               'Daftar untuk melanjutkan masuk',
//               style: subtittleTextStyle,
//             ),
//           ],
//         ),
//       );
//     }

//     Widget nameInput() {
//       return Container(
//         margin: EdgeInsets.only(top: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Nama Lengkap',
//               style: blackTextStyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 50,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(
//                   12,
//                 ),
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       'assets/images/email-icon.png',
//                       width: 17,
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Expanded(
//                       child: TextFormField(
//                         style: blackTextStyle,
//                         decoration: InputDecoration.collapsed(
//                           hintText: 'nama lengkap',
//                           hintStyle: subtittleTextStyle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     }

//     Widget emailInput() {
//       return Container(
//         margin: EdgeInsets.only(top: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Email Address',
//               style: blackTextStyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 50,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(
//                   12,
//                 ),
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       'assets/images/email-icon.png',
//                       width: 17,
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Expanded(
//                       child: TextFormField(
//                         style: blackTextStyle,
//                         decoration: InputDecoration.collapsed(
//                           hintText: 'masukan email',
//                           hintStyle: subtittleTextStyle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     }

//     Widget passwordInput() {
//       return Container(
//         margin: EdgeInsets.only(top: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Password',
//               style: blackTextStyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 50,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(
//                   12,
//                 ),
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       'assets/images/password-icon.png',
//                       width: 17,
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Expanded(
//                       child: TextFormField(
//                         style: blackTextStyle,
//                         obscureText: true,
//                         decoration: InputDecoration.collapsed(
//                           hintText: 'password',
//                           hintStyle: subtittleTextStyle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     }

//     Widget rePasswordInput() {
//       return Container(
//         margin: EdgeInsets.only(top: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               're-password',
//               style: blackTextStyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 50,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(
//                   12,
//                 ),
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       'assets/images/password-icon.png',
//                       width: 17,
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Expanded(
//                       child: TextFormField(
//                         style: blackTextStyle,
//                         obscureText: true,
//                         decoration: InputDecoration.collapsed(
//                           hintText: 'ulangi password',
//                           hintStyle: subtittleTextStyle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     }

//     Widget signInButton() {
//       return Container(
//         height: 50,
//         width: double.infinity,
//         margin: EdgeInsets.only(top: 20),
//         child: TextButton(
//           onPressed: () {},
//           style: TextButton.styleFrom(
//               backgroundColor: primaryColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               )),
//           child: Text(
//             'Daftar',
//             style: primaryTextStyle.copyWith(
//               color: primaryTextColor,
//               fontSize: 16,
//               fontWeight: medium,
//             ),
//           ),
//         ),
//       );
//     }

//     Widget footer() {
//       return Container(
//         margin: EdgeInsets.only(
//           bottom: 30,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Don\'t have an account? ',
//               style: subtittleTextStyle.copyWith(
//                 fontSize: 12,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     new MaterialPageRoute(builder: (context) => SignInPage()));
//               },
//               child: Text(
//                 'masuk',
//                 style: purpleTextStyle.copyWith(
//                   fontSize: 12,
//                   fontWeight: medium,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: defaultMargin),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               header(),
//               nameInput(),
//               emailInput(),
//               passwordInput(),
//               rePasswordInput(),
//               signInButton(),
//               Spacer(),
//               footer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
