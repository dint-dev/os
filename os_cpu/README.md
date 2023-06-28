[![Pub Package](https://img.shields.io/pub/v/os_cpu.svg)](https://pub.dartlang.org/packages/os_cpu)
[![package publisher](https://img.shields.io/pub/publisher/os_cpu.svg)](https://pub.dev/packages/os_cpu/publisher)

# Introduction

This Dart package that provides information about the CPU.
The package is designed to work in all platforms, including browsers.

# Getting started
## 1.Add dependency
In pubspec.yaml:
```yaml
dependencies:
  os_cpu: ^1.0.1
```

## 2.Use
Use [CpuType.get](https://pub.dev/documentation/os_cpu/latest/os_cpu/CpuType/get.html) or
[CpuType.getSync](https://pub.dev/documentation/os_cpu/latest/os_cpu/CpuType/getSync.html):
```dart
import 'package:os_cpu/os_cpu.dart';

Future<void> main() async {
  final cpuType = await CpuType.get(); // OR CpuType.getSync()
  print(cpuType);
}
```