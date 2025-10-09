import 'package:flutter/material.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/firestore_database/firestore_service.dart';
import 'package:practice_firebase/models/firebase/fb_friend_model.dart';
import 'package:practice_firebase/screens/home/widgets/friend_elements.dart';
import 'package:practice_firebase/screens/home/widgets/home_app_bar.dart';
import 'package:provider/provider.dart';
import '../../contains/app_colors.dart';
import '../../models/friend_model.dart';
import '../../providers/user_provider.dart';
import '../detail_screen/detail_screen.dart';
import '../detail_screen/models/new_friend_screen_argument.dart';

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
      return Scaffold(body: Center(child: Text("No user found")));
    }
    return StreamBuilder(
      stream: _firestoreService.getFriends(currentUser.uid),
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
            heroTag: 'fab_add',
            onPressed: () async {
              _navigateToNewFriendScreen();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Future<void> _navigateToNewFriendScreen({FriendModel? friendModel}) async {
    /// Sử dụng hàm pushNamed để điều hướng tới
    /// màn hình tạo công việc mới
    final result =
        await Navigator.of(context).pushNamed(
              /// Đường dẫn của màn hình tạo công việc mới
              DetailScreen.routeName,

              /// Tham số truuyền vào màn hình tạo công việc mới
              arguments: NewFriendScreenArgument(friendModel: friendModel),
            )
            as bool?;

    /// Nếu không có công việc mới
    if (result != true) {
      return;
    }
  }

  Widget _buildFriendListWidget(List<FriendModel> friends) {
    if (friends.isEmpty) {
      return Center(
        child: Container(
          child: Text(
            'You have no friend to complete.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          final friend = friends[index];
          return FriendElement(
            friend: friend,
            onTap: () {
              _navigateToNewFriendScreen(friendModel: friend);
            },
          );
        },
        itemCount: friends.length,
      );
    }
  }
}
