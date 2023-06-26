import 'package:os_cpu/os_cpu.dart';

import '../lib/os_cpu.dart';

Future<void> main() async {
  print('CPU: ${await CpuType.get()}');
}
