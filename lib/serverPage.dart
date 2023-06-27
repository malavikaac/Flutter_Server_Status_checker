import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apiservice.dart';

class ServerPage extends StatefulWidget {
  const ServerPage({super.key});

  @override
  State<ServerPage> createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  bool isServerOn = true;
  String? status;
  String? message;

  @override
  void initState() {
    final _serverApi = Provider.of<ApiService>(context, listen: false);
    _serverApi.getServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _serverApi = Provider.of<ApiService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Server Status',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 215, 193, 252),
      ),
      body: Consumer<ApiService>(
        builder: (context, snapshot, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: snapshot.status == "true"
                    ? Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 100, 184, 118)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Server is On'),
                        ))
                    : Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 221, 65, 44)),
                        child: Text('Server is Off')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 215, 193, 252)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(snapshot.message!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(snapshot.status!),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
