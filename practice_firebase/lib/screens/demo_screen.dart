// import 'package:flutter/material.dart';
// import 'package:practice_firebase/screens/sign_up_screen/sign_up_screen.dart';
// import 'package:practice_firebase/screens/start_screen/start_screen.dart';
//
// import 'login_screen/login_screen.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
//         pageTransitionsTheme: const PageTransitionsTheme(
//           builders: <TargetPlatform, PageTransitionsBuilder>{
//             TargetPlatform.android: ZoomPageTransitionsBuilder(),
//           },
//         ),
//       ),
//       home: _TransitionsHomePage(),
//     ),
//   );
// }
//
// class _TransitionsHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Material Transitions')),
//       body: ListView(
//         children: const <Widget>[
//           _TransitionListTile(
//             title: 'Container transform',
//             subtitle: 'OpenContainer',
//             destination: StartScreen(),
//           ),
//           _TransitionListTile(
//             title: 'Shared axis',
//             subtitle: 'SharedAxisTransition',
//             destination: SignUp(),
//           ),
//           _TransitionListTile(
//             title: 'Fade through',
//             subtitle: 'FadeThroughTransition',
//             destination: Login(),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _TransitionListTile extends StatelessWidget {
//   const _TransitionListTile({
//     required this.title,
//     required this.subtitle,
//     required this.destination,
//   });
//
//   final String title;
//   final String subtitle;
//   final Widget destination;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//       leading: Container(
//         width: 40.0,
//         height: 40.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0),
//           border: Border.all(color: Colors.black54),
//         ),
//         child: const Icon(Icons.play_arrow, size: 35),
//       ),
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute<void>(
//             builder: (BuildContext context) => destination,
//           ),
//         );
//       },
//       title: Text(title),
//       subtitle: Text(subtitle),
//     );
//   }
// }
