[![Pub Package](https://img.shields.io/pub/v/os.svg)](https://pub.dartlang.org/packages/os)
[![package publisher](https://img.shields.io/pub/publisher/os.svg)](https://pub.dev/packages/os/publisher)

# Introduction

This Dart package that provides information about the operating system and the build environment.
The package is designed to work in all platforms, including browsers.

# Getting started
In pubspec.yaml:
```yaml
dependencies:
  os: ^1.0.0
```

# APIs
## Operating system detection
[OperatingSystemType.current](https://pub.dev/documentation/os/latest/os/OperatingSystemType/current.html)
detects operating system in all platforms (including browsers):

Example:
```dart
import 'package:os/os.dart';

void main() {
  final operatingSystem = OperatingSystem.current;
  print('Operating system: $operatingSystem');
  print('Operating system is by Apple: ${operatingSystem.isCupertino}');
}
```

## Detect development/production environment
* [isRunningInDebugMode](https://pub.dev/documentation/os/latest/os/isRunningInDebugMode.html)
    * Is the code running in debug mode?
* [isRunningInProfileMode](https://pub.dev/documentation/os/latest/os/isRunningInProfileMode.html)
    * Is the code running in a profile mode?
* [isRunningInReleaseMode](https://pub.dev/documentation/os/latest/os/isRunningInReleaseMode.html)
    * Is the code running in a release mode?
* [isRunningInTest](https://pub.dev/documentation/os/latest/os/isRunningInTest.html)
    * Is the code running in a test?

## Determine platform properties
* [isRunningInFlutter](https://pub.dev/documentation/os/latest/os/isRunningInFlutter.html)
    * Is the code running in a Flutter application?
* [isRunningInJs](https://pub.dev/documentation/os/latest/os/isRunningInJs.html)
    * Is the code running in a Javascript engine?
* [isRunningInWeb](https://pub.dev/documentation/os/latest/os/isRunningInWeb.html)
    * Is the code running in a web browser?

## Add test tear down functions
The package does not introduce a dependency on "package:test", but it is still able to detect a test
environment and add "tearDown" functions that will be run after the test.

Use [TestEnvironment.current](https://pub.dev/documentation/os/latest/os/TestEnvironment/current.html)
```dart
import 'package:os/test_environment.dart';

void doSomething() {
  // ...
  
  TestEnvironment.current?.addTearDown(() {
    // ...
  });
  TestEnvironment.current?.printOnFailure('Some information');
  
  // ...
}
```