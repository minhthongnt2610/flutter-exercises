import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/input_date_time_field.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/build_body_widget.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_controller.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_element.dart';
import 'package:provider/provider.dart';

import 'models/friend_model.dart';

class ListFriendScreen extends StatelessWidget
{
    const ListFriendScreen({super.key});

    @override
    Widget build(BuildContext context)
    {
        return ChangeNotifierProvider(
            create: (context) => FriendController()..getListFriend(),
            child: ListFriendScreenBody(),
        );
    }
}

class ListFriendScreenBody extends StatelessWidget
{
    const ListFriendScreenBody({super.key});
    @override
    Widget build(BuildContext context)
    {
        final controller = Provider.of<FriendController>(context, listen: false); // Sử dụng listen: false nếu chỉ gọi phương thức

        return Scaffold(
            appBar: AppBar(
                title: const Text('List Friend'),
                centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                    children: [
                        BuildBodyWidget(controller: controller),
                        if (controller.isLoading) _buildLoadingWidget(),
                    ]
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: ()
                {

                },
                child: const Icon(Icons.add),
            ),
        );
    }
}


Widget _buildLoadingWidget(){
    return const Center(
        child: CircularProgressIndicator(),
    );
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'widgets/friend_controller.dart';
//
// class ListFriendScreen extends StatelessWidget {
//     const ListFriendScreen({super.key});
//
//     @override
//     Widget build(BuildContext context) {
//         return ChangeNotifierProvider(
//             create: (context) => FriendController()..getListFriend(),
//             child: const ListFriendScreenBody(),
//         );
//     }
// }
//
// class ListFriendScreenBody extends StatelessWidget {
//     const ListFriendScreenBody({super.key});
//
//     @override
//     Widget build(BuildContext context) {
//         final controller = Provider.of<FriendController>(context, listen: false);
//
//         return Scaffold(
//             appBar: AppBar(
//                 title: const Text('List Friend'),
//                 centerTitle: true,
//             ),
//             body: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                     children: [
//                         ElevatedButton(
//                             onPressed: () {
//                                 controller.getListFriend();
//                             },
//                             child: const Text('Get List Friend'),
//                         ),
//                         Expanded(
//                             child: Consumer<FriendController>(
//                                 builder: (context, friendController, child) {
//                                     if (friendController.isLoading) {
//                                         return const Center(child: CircularProgressIndicator());
//                                     }
//
//                                     return ListView.builder(
//                                         itemCount: friendController.friends?.length,
//                                         itemBuilder: (context, index) {
//                                             final friend = friendController.friends?[index];
//                                             return ListTile(
//                                                 title: Text(friend?.name ?? 'No Name'),
//                                             );
//                                         },
//                                     );
//                                 },
//                             ),
//                         ),
//                     ],
//                 ),
//             ),
//             floatingActionButton: FloatingActionButton(
//                 onPressed: () {},
//                 child: const Icon(Icons.add),
//             ),
//         );
//     }
// }