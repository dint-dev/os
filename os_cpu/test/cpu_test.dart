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

import 'package:os_cpu/os_cpu.dart';
import 'package:test/test.dart';

void main() {
  test('cpuConcurrency', () {
    expect(cpuConcurrency, greaterThanOrEqualTo(1));
  });

  group('CpuType:', () {
    test('get() returns non-null value', () async {
      expect(await CpuType.get(), isNotNull);
    });

    test('get() works in browser', () async {
      final channel = spawnHybridCode('''
import 'package:os_cpu/os_cpu.dart';
import 'package:stream_channel/stream_channel.dart';

hybridMain(StreamChannel channel) async {
  channel.sink.add((await CpuType.get())!.index);
  channel.sink.close();
}
      ''');
      final expected = await channel.stream
          .map((event) => CpuType.values[event as int])
          .first;
      expect(await CpuType.get(), expected);
    }, testOn: 'browser');

    test('getSync()', () {
      expect(CpuType.getSync(), isNotNull);
    });

    test('canRun', () {
      expect(CpuType.aarch32.canRun(CpuType.aarch32), isTrue);
      expect(CpuType.aarch32.canRun(CpuType.aarch64), isFalse);
      expect(CpuType.aarch32.canRun(CpuType.x86), isFalse);
      expect(CpuType.aarch32.canRun(CpuType.amd64), isFalse);

      expect(CpuType.aarch64.canRun(CpuType.aarch32), isTrue);
      expect(CpuType.aarch64.canRun(CpuType.aarch64), isTrue);
      expect(CpuType.aarch64.canRun(CpuType.x86), isFalse);
      expect(CpuType.aarch64.canRun(CpuType.amd64), isFalse);

      expect(CpuType.x86.canRun(CpuType.aarch32), isFalse);
      expect(CpuType.x86.canRun(CpuType.aarch64), isFalse);
      expect(CpuType.x86.canRun(CpuType.x86), isTrue);
      expect(CpuType.x86.canRun(CpuType.amd64), isFalse);

      expect(CpuType.amd64.canRun(CpuType.aarch32), isFalse);
      expect(CpuType.amd64.canRun(CpuType.aarch64), isFalse);
      expect(CpuType.amd64.canRun(CpuType.x86), isTrue);
      expect(CpuType.amd64.canRun(CpuType.amd64), isTrue);
    });
  });
}
