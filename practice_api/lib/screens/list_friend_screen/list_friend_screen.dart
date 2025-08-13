import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/create_and_edit_screen.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/build_body_widget.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_controller.dart';
import 'package:provider/provider.dart';

class ListFriendScreen extends StatefulWidget
{
    const ListFriendScreen({super.key});
    static const routeName = '/list-friend';

    @override
    State<ListFriendScreen> createState() => _ListFriendScreenState();
}

class _ListFriendScreenState extends State<ListFriendScreen>
{
    late FriendController _controller;
    @override
    void initState() 
    {
        // TODO: implement initState
        super.initState();
        _controller = FriendController();
        _controller.getListFriend();
    }

    @override
    void dispose() 
    {
        // TODO: implement dispose
        super.dispose();
        _controller.dispose();
    }

    @override
    Widget build(BuildContext context) 
    {
        return ChangeNotifierProvider.value(
            value: _controller,
            child: Consumer<FriendController>(
                builder: (context, controller, child)
                {
                    return Scaffold(
                        backgroundColor: Color(0xFF212121),
                        appBar: AppBar(
                            title: Text(
                                'List Friend',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            centerTitle: true,
                            backgroundColor: Color(0xFF212121),
                        ),
                        body: RefreshIndicator(
                          onRefresh: () async {
                              await _controller.getListFriend();
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Stack(
                                  children: [
                                      BuildBodyWidget(),
                                      if (_controller.isLoading) _buildLoadingWidget(),
                                  ],
                              ),
                          ),
                        ),
                        floatingActionButton: FloatingActionButton(
                            onPressed: ()
                            async {
                               final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const CreateAndEditScreen(),
                                    ),
                                );
                               if(result == true){
                                   _controller.getListFriend();
                               }
                            },
                            child: const Icon(Icons.add),
                        ),
                    );
                },
            ),
        );
    }
}

Widget _buildLoadingWidget()
{
    return const Center(child: CircularProgressIndicator());
}
