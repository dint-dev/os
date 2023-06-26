[![Pub Package](https://img.shields.io/pub/v/os_files.svg)](https://pub.dartlang.org/packages/os_files)
[![package publisher](https://img.shields.io/pub/publisher/os_files.svg)](https://pub.dev/packages/os_files/publisher)

# Introduction

This Dart package that provides information about the operating system files and directories.
The package is designed to work in all platforms, including browsers.

# Getting started
## 1.Add dependency
In pubspec.yaml:
```yaml
dependencies:
  os_files: ^1.0.0
```

## 2.Use
```dart
import 'package:os_files/os_files.dart';

Future<void> main() async {
  print('Python 3 installed: ${await terminalAppFound('python3')}');
  print('Random temporary directory: ${randomTemporaryDirectory().path}');
}
```