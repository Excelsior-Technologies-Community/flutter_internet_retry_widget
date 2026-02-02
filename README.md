# 🌐 InternetRetryWidget

A clean, customizable, and reusable No Internet / Retry widget for Flutter apps.
It shows a friendly no internet UI with a Retry button and supports a loading state using CircularProgressIndicator.

Perfect for:
- 📵 No internet screens
- 🔁 API retry UI
- ❌ Error / empty states
- 🚧 Maintenance or offline pages

---
## ✨ Preview
![screen-20260202-1719092](https://github.com/user-attachments/assets/acfc9d75-0ae4-4f70-b366-7a9491ab8121)

---
## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_internet_retry_widgets:
    path: ../flutter_internet_retry_widgets  # For local development
```
from git:
```
dependencies:
  flutter_internet_retry_widgets:
    git:
      url: https://github.com/yourusername/flutter_internet_retry_widgets.git  # Your github path
``` 
Then run:
```
flutter pub get
```
---
## ✨ Features

- ✅ Simple & clean UI
- 🔁 Retry callback support
- ⏳ Built-in loading state (CircularProgressIndicator)
- 🧩 Reusable in any screen
- 🎨 Easy to customize (text, icon, button, etc. – extendable)
- 📦 Works in a normal Flutter project (no package setup needed)

---

## 📁 Project Structure
```
lib/
 ├── main.dart
 ├── screens/
 │    └── home_screen.dart
 └── widgets/
      └── internet_retry_widget.dart

```
---
## 🧩 Widget Implementation
#### lib/widgets/internet_retry_widget.dart
```
import 'package:flutter/material.dart';

class InternetRetryWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final bool isLoading;

  const InternetRetryWidget({
    super.key,
    required this.onRetry,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text(
              'No Internet Connection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please check your connection and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Button / Loader switch
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: onRetry,
                    child: const Text('Retry'),
                  ),
          ],
        ),
      ),
    );
  }
}

```
---
## 🧪 Example Usage
#### lib/screens/home_screen.dart
```
import 'package:flutter/material.dart';
import '../widgets/internet_retry_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showRetry = true; // Assume no internet
  bool isLoading = false;

  Future<void> onRetryPressed() async {
    setState(() {
      isLoading = true;
    });

    // Simulate API / Internet check
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
      // If internet is back, you can do:
      // showRetry = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Retry finished')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Internet Retry Example')),
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

```
---
## 🧾 Parameters
| Parameter   | Type           | Required | Description                                   |
| ----------- | -------------- | -------- | --------------------------------------------- |
| `onRetry`   | `VoidCallback` | ✅ Yes    | Called when user taps the Retry button        |
| `isLoading` | `bool`         | ✅ Yes    | Shows loader when `true`, button when `false` |

---
## ⚙️ How It Works
- When isLoading = false
 → Shows Retry Button
- When isLoading = true
 → Shows CircularProgressIndicator
- On pressing Retry
 → You can:
 - Call API
 - Check internet connection
 - Retry failed request
 - Update UI based on result

---
---
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:
!
The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
---
