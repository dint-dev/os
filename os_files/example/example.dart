import 'package:os_files/os_files.dart';

Future<void> main() async {
  print('Python 3 installed: ${await terminalAppFound('python3')}');
  print('Random temporary directory: ${randomTemporaryDirectory().path}');
}
