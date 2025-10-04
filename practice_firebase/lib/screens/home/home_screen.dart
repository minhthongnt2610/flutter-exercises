import 'package:flutter/material.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/firestore_database/firestore_service.dart';
import 'package:practice_firebase/models/firebase/fb_friend_model.dart';
import 'package:practice_firebase/screens/home/widgets/friend_elements.dart';
import 'package:practice_firebase/screens/home/widgets/home_app_bar.dart';
import 'package:provider/provider.dart';
import '../../contains/app_colors.dart';
import '../../models/friend_model.dart';
import '../../providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final currentUser = userProvider.firebaseUser;

    if (currentUser == null) {
      return Scaffold(body: Center(child: Text("Bạn chưa đăng nhập")));
    }
    return StreamBuilder(
      stream: _firestoreService.getFriends(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }
        final friends = snapshot.data
            ?.map((FbFriendModel) => FbFriendModel.toFriendModel())
            .toList();
        if (friends == null) {
          return Scaffold(body: Center(child: Text('No friends found')));
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: HomeAppBar(),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColor.hex1F4F70, AppColor.hex8FC9F0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: _buildFriendListWidget(friends),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // TODO: thêm logic add friend
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

Widget _buildFriendListWidget(List<FriendModel> friends) {
  if (friends.isEmpty) {
    return Center(
      child: Container(
        child: Text(
          'You have no friend to complete.',
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  } else {
    return ListView.builder(
      itemBuilder: (context, index) {
        final friend = friends[index];
        return FriendElement(friend: friend, onTap: () {

        });
      },
      itemCount: friends.length,
    );
  }
}
