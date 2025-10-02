import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget
{
    const PrimaryButton({
        super.key, 
        required this.title, 
        required this.onTap,
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
                    gradient: LinearGradient(colors: [
                        Colors.purpleAccent.shade200,
                        Colors.pinkAccent.shade100,
                    ]),
                    borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                ),
            ),
        );
    }
}
