import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moviemania/ui/auth/register.dart';
import 'package:moviemania/ui/home/TabHome.dart';
import 'package:moviemania/utils/Store.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    // _emailcontroller.text= TextEditingController() as String;
  }

  // var store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 16,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                      height: 100,
                      child: Lottie.asset(
                        "assets/lottie/ej.json",
                      ))),
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: validateEmail,
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                      label: Text('E-mail'), border: OutlineInputBorder()),
                ),
              ),
              Form(
                key: _formKeyPass,
                child: TextFormField(
                  obscureText: true,
                  validator: validatePass,
                  controller: _passwordcontroller,
                  decoration:  InputDecoration(
                      label: Text('Password'),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _isLoading
                        ? const SpinKitSpinningLines(color: Colors.amber)
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                signInWithEmailAndPassword(
                                    _emailcontroller.text,
                                    _passwordcontroller.text);
                              }
                              _emailcontroller.clear();
                              _passwordcontroller.clear();

                              //Get.to(()=>TabHome());
                            },
                            child: const Text('Login'),
                          ),
                  ),
                ],
              ),
              const Text('Or Continue with...'),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      // store.signInGoogle();
                    },
                    child: Container(
                      height: 40,
                      child: Image.asset(
                        'assets/icons/gg.png',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //store.signInFacebook();
                    },
                    child: SizedBox(
                      height: 40,
                      child: Image.asset(
                        'assets/icons/fb.png',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // store.signInApple();
                    },
                    child: SizedBox(
                      height: 50,
                      child: Image.asset(
                        'assets/icons/apple.png',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                  onTap: () {
                    Get.to(() => Register());
                  },
                  child: const Text('Dont have an account?, Register'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        setState(() {
          _isLoading = false;
        });

        Get.off(() => TabHome());
      });

      // debugPrint("value is.....${value.toString()}"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('', 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  String? validateEmail(String? value) {
    if (value.toString().isEmpty) {
      return "Input Email";
    }
  }

  String? validatePass(String? value) {
    if (value.toString().isEmpty) {
      return 'Input Password';
    }
  }
}
