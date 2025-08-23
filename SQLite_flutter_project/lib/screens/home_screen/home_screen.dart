import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_flutter_project/data/data_sources/local/db/db_controller.dart';
import 'package:sqlite_flutter_project/screens/detail_screen/detail_screen.dart';
import 'package:sqlite_flutter_project/screens/home_screen/widgets/build_body_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // //CACH 1
  // late DbController _controller;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _controller = DbController();
  //   _controller.initState();
  //   _controller.fetchFriend();
  // }
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _controller.dispose();
  //   super.dispose();
  // }
  //
  //
  //
  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider.value(
  //     value: _controller,
  //     child: Consumer<DbController>(
  //       builder: (context, controller, child) {
  //         return Scaffold(
  //           appBar: AppBar(title: const Text("Home Screen"), centerTitle: true),
  //           body: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: BuildBodyWidget(),
  //           ),
  //           floatingActionButton: FloatingActionButton(
  //             onPressed: () {
  //               Navigator.of(context).pushNamed(DetailScreen.routeName);
  //             },
  //             child: Icon(Icons.add),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  //CACH 2 (uu tien cach nay)

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DbController()
        ..initState()
        ..fetchFriend(),
      child: Consumer<DbController>(
        builder: (context, controller, child) {
          return Scaffold(
            appBar: AppBar(title: const Text("Home Screen"), centerTitle: true),
            body: const Padding(
              padding: EdgeInsets.all(8.0),
              child: BuildBodyWidget(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(DetailScreen.routeName);
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
