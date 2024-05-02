import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StreamController<String> streamController = StreamController<String>();
  late Stream<String> dataStream;
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Broatcast Stream Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            StreamBuilder<String>(
              stream: dataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(
                        "Stream 1 : ${snapshot.data}" ?? "No Data",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.purple),
                      ),
                      Text(
                        "Stream 2 : ${snapshot.data}" ?? "No Data",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.purple),
                      ),
                    ],
                  );
                } else {
                  return const Text(
                    "No stream Data",
                    style: TextStyle(fontSize: 30, color: Colors.green),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: nameController,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 350,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {
                  streamController.add(nameController.text.toString());
                },
                icon: const Icon(Icons.stream),
                label: const Text("Send"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
