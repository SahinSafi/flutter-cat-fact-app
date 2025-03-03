import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {

  final String errorMessage;
  final Function retry;

  const NetworkError({super.key, required this.errorMessage, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.network_check_sharp,
            size: 100,
            color: Colors.pinkAccent,
          ),
          const Text(
            "Opps",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(errorMessage),
          const Padding(padding: EdgeInsets.only(top: 16)),
          ElevatedButton(
            onPressed: ()=> retry,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            child: const Text("Retry", style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
