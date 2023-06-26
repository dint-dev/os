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

import 'package:os/os.dart';
import 'package:test/test.dart';

void main() {
  group('OperatingSystemType:', () {
    test('current is not null', () {
      expect(OperatingSystemType.current, isNotNull);
    });

    test('current == ${OperatingSystemType.android}', () {
      expect(OperatingSystemType.current, OperatingSystemType.android);
    }, testOn: 'android');

    test('current == ${OperatingSystemType.ios}', () {
      expect(OperatingSystemType.current, OperatingSystemType.ios);
    }, testOn: 'ios');

    test('current == ${OperatingSystemType.linux}', () {
      expect(OperatingSystemType.current, OperatingSystemType.linux);
    }, testOn: 'linux');

    test('current == ${OperatingSystemType.mac}', () {
      expect(OperatingSystemType.current, OperatingSystemType.mac);
    }, testOn: 'mac-os');

    test('current == ${OperatingSystemType.windows}', () {
      expect(OperatingSystemType.current, OperatingSystemType.windows);
    }, testOn: 'windows');

    {
      test('current works in browser', () async {
        final channel = spawnHybridCode('''
import 'package:os/os.dart';
import 'package:stream_channel/stream_channel.dart';

hybridMain(StreamChannel channel) {
  channel.sink.add(OperatingSystemType.current.index);
  channel.sink.close();
}
      ''');
        final expected = await channel.stream
            .map((event) => OperatingSystemType.values[event as int])
            .first;
        expect(OperatingSystemType.current, expected);
      }, testOn: 'browser');
    }

    test('isCupertino', () {
      expect(OperatingSystemType.ios.isCupertino, isTrue);
      expect(OperatingSystemType.mac.isCupertino, isTrue);

      expect(OperatingSystemType.android.isCupertino, isFalse);
      expect(OperatingSystemType.chrome.isCupertino, isFalse);
      expect(OperatingSystemType.fuchsia.isCupertino, isFalse);
      expect(OperatingSystemType.linux.isCupertino, isFalse);
      expect(OperatingSystemType.windows.isCupertino, isFalse);
    });
  });
}
