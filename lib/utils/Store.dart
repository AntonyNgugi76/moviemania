// import 'package:flutter/foundation.dart';
// import 'package:fteam_authentication_firebase/fteam_authentication_firebase.dart';
//
// class Store extends ValueNotifier<bool> {
//   Store() : super(false);
//
//   Future<bool> save(String email, String password) async {
//     return true;
//   }
//
//   Future signInGoogle() async {
//     final result = await FTeamAuth.login(ProviderLogin.google);
//     result.fold((l) {
//       debugPrint(l.toString());
//     }, (r) {
//       if (r == null) {
//         debugPrint('Fail to login');
//         return null;
//       }
//       debugPrint(r.token);
//       return r.email;
//     });
//   }
//
//   Future signInFacebook() async {
//     final result = await FTeamAuth.login(ProviderLogin.facebook);
//     result.fold((l) {
//       debugPrint(l.toString());
//     }, (r) {
//       return r?.email;
//     });
//   }
//
//   Future signInApple() async {
//     final result = await FTeamAuth.login(ProviderLogin.appleId);
//     result.fold((l) {
//       debugPrint(l.toString());
//     }, (r) {
//       return r?.email;
//     });
//   }
// }
