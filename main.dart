import 'package:flutter/material.dart';
import 'api_service.dart';
import 'post_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = ApiService.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GET & POST Example')),
      body: Center(
        child: FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.title,
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text(snapshot.data!.body),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final newPost =
                          await ApiService.createPost(
                              'Hello Flutter',
                              'This is a POST request');

                      setState(() {
                        post = Future.value(newPost);
                      });
                    },
                    child: const Text('Send POST Request'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
