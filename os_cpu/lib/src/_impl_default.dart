// Copyright 2022 dint.dev authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../os_cpu.dart';

int? get cpuConcurrencyImpl => Platform.numberOfProcessors;

Future<CpuType?> getCpuType() async {
  if (Platform.isMacOS ||
      Platform.isLinux ||
      Platform.isAndroid ||
      Platform.isFuchsia) {
    final result = await Process.run('uname', ['-m'], stdoutEncoding: utf8);
    return _cpuTypeFromString((result.stdout as String).toString());
  }

  return getCpuTypeSync();
}

CpuType? getCpuTypeSync() {
  if (Platform.isIOS) {
    return CpuType.aarch64;
  }

  if (Platform.isWindows) {
    final s = Platform.environment['PROCESSOR_ARCHITECTURE']?.toUpperCase();
    if (s == null) {
      throw UnsupportedError(
          'Missing environmental variable PROCESSOR_ARCHITECTURE.');
    }
    return _cpuTypeFromString(s);
  }

  if (Platform.isMacOS ||
      Platform.isLinux ||
      Platform.isAndroid ||
      Platform.isFuchsia) {
    final result = Process.runSync('uname', ['-m'], stdoutEncoding: utf8);
    return _cpuTypeFromString((result.stdout as String).toString());
  }

  throw UnsupportedError(
      'Unsupported operating system: ${Platform.operatingSystem}');
}

CpuType _cpuTypeFromString(String s) {
  switch (s.trim().toLowerCase()) {
    case 'aarch64_be':
      return CpuType.aarch64;
    case 'aarch64':
      return CpuType.aarch64;
    case 'armv8b':
      return CpuType.aarch64;
    case 'armv8l':
      return CpuType.aarch64;
    case 'arm':
      return CpuType.aarch32;
    case 'arm64':
      return CpuType.aarch64;
    case 'x86':
      return CpuType.x86;
    case 'x86_64':
      return CpuType.amd64;
    case 'i386':
      return CpuType.x86;
    case 'i686':
      return CpuType.x86;
    default:
      throw UnsupportedError('Unsupported architecture: $s');
  }
}
