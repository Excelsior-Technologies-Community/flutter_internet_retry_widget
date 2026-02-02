import 'package:flutter/material.dart';
import '../widgets/internet_retry_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showRetry = true;
  bool isLoading = false;

  Future<void> onRetryPressed() async {
    setState(() {
      isLoading = true;
    });


    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;

    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Retry finished')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Internet Retry')),
      body: showRetry
          ? InternetRetryWidget(
        isLoading: isLoading,
        onRetry: onRetryPressed,
      )
          : const Center(
        child: Text('Main App Content Here'),
      ),
    );
  }
}
