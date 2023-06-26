import 'package:os/os.dart';

Future<void> main() async {
  print('OS: ${OperatingSystemType.current}');
  print('OS by Apple: ${OperatingSystemType.current.isCupertino}');
  print('debug mode: $isRunningInDebugMode');
  print('browser: $isRunningInWeb');
  print('test: $isRunningInTest');
}
