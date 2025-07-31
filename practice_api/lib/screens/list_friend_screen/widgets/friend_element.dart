import 'package:flutter/material.dart';

class FriendElement extends StatefulWidget
{
    const FriendElement({super.key});

    @override
    State<FriendElement> createState() => _FriendElementState();
}

class _FriendElementState extends State<FriendElement>
{
    @override
    Widget build(BuildContext context)
    {
        final height = MediaQuery.sizeOf(context).height;
        final width = MediaQuery.sizeOf(context).width;
        return GestureDetector(
            onTap: ()
            {
            },
            child: Container(
                width: 850 * width / 868,
                height: 100 * height / 868,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: [
                            Row(
                                children: [
                                    Text(
                                        'Full name',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                        ),
                                    ),
                                    SizedBox(width: 15, 
                                        child: Text(' :', 
                                            style: 
                                            TextStyle(
                                                color: Colors.black,
                                            ),
                                        ),
                                    ),
                                    Text(
                                        'Thông NT',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                        ),
                                    ),
                                ],
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                        'Birthday',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                        ),
                                    ),
                                    SizedBox(width: 15,
                                        child: Text(' :',
                                            style:
                                            TextStyle(
                                                color: Colors.black,
                                            ),
                                        ),
                                    ),
                                    Text(
                                        '26-10-2004',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                        ),
                                    ),
                                ],
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                        'Age',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                        ),
                                    ),
                                    SizedBox(width: 15,
                                        child: Text(' :',
                                            style:
                                            TextStyle(
                                                color: Colors.black,
                                            ),
                                        ),
                                    ),
                                    Text(
                                        '20',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                        ),
                                    ),
                                ],
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
