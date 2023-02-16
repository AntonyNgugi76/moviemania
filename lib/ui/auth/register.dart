import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moviemania/ui/auth/Login.dart';
import 'package:moviemania/ui/auth/register.dart';
import 'package:moviemania/ui/home/TabHome.dart';
import 'package:moviemania/utils/Store.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController _emailcontroller= TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  padding: EdgeInsets.all(16),
                  child: Container(
                      height: 100,
                      child: Lottie.asset("assets/lottie/ej.json",)

                  )
              ),
              TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(label: Text('E-mail'), border: OutlineInputBorder()),
              ),
              TextField(
                controller: _passwordcontroller,
                decoration:  InputDecoration(label: Text('Password'), border: OutlineInputBorder()),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        signUpWithEmailAndPassword(_emailcontroller.text, _passwordcontroller.text);
                        //Get.to(()=>TabHome());

                      },
                      child: const Text('Register'),
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
                      child: Image.asset('assets/icons/gg.png',),
                    ),),
                  InkWell(

                    onTap: () {
                      //store.signInFacebook();
                    },
                    child: SizedBox(
                      height: 40,
                      child: Image.asset('assets/icons/fb.png',),
                    ),
                  ),
                  InkWell(

                    onTap: () {
                      // store.signInApple();
                    },
                    child: SizedBox(
                      height: 50,
                      child: Image.asset('assets/icons/apple.png',),
                    ),),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                  onTap: (){
                    Get.to(()=>Login());
                  },
                  child:
                  Text('Have an account?, Login'))
            ],
          ),
        ),
      ),
    );
  }


  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) => Get.to(()=>Login()));


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('','The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }
}


