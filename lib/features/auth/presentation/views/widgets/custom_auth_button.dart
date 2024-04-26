// import 'package:flutter/material.dart';
//
// class CustomAuthButton extends StatelessWidget {
//   const CustomAuthButton(
//       {super.key, required this.state, required this.onTap, required this.text});
//   final dynamic state;
//   final Function() onTap;
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     if (state is LoginLoading || state is RegisterLoading) {
//       return const Center(
//         child: CircularProgressIndicator(
//           color: kMainColor,
//         ),
//       );
//     }
//     return InkWell(
//       onTap: () async {
//         return onTap();
//       },
//       child: Container(
//         height: 50,
//         width: MediaQuery.of(context).size.width * 0.9,
//         decoration: BoxDecoration(
//           color: kMainColor,
//           borderRadius: BorderRadiusDirectional.circular(25),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }
