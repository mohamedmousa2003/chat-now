// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
//
//
//
// class ErrorStateWidget extends StatelessWidget {
//   final Exception? exception;
//   final VoidCallback onRetry;
//
//   const ErrorStateWidget({
//     required this.exception,
//     required this.onRetry,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.error_outline,
//               size: 60,
//               color: Colors.red,
//             ),
//             const SizedBox(height: 20),
//             Text(
//               ErrorMapper.map(exception!),
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: onRetry,
//               child: const Text('Try Again'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
//
// class ErrorMapper {
//   static String map(Exception exception) {
//     switch (exception) {
//       case SocketException():
//         return 'No internet connection. Please check your network.';
//
//       case TimeoutException():
//         return 'Request timeout. Please try again.';
//
//       case ServerErrorException():
//         return exception.messageError ?? 'Server error occurred';
//
//       default:
//         return 'Something went wrong. Please try again later.';
//     }
//   }
// }
//
//
