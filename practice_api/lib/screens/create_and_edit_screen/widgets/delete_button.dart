import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget
{
    const DeleteButton({
        super.key, 
        required this.title, 
        required this.onTap
    });
    final String title;
    final VoidCallback onTap;
    @override
    Widget build(BuildContext context)
    {
        return InkWell(
            onTap: onTap,
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red, width: 2,),
                ),
                child: Center(
                    child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                ),
            ),
        );
    }
}
