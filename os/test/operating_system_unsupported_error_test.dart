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
  group('OperatingSystemUnsupportedError():', () {
    test('chrome', () {
      expect(
        OperatingSystemUnsupportedError().toString(),
        'Unsupported operation: Operating system "${OperatingSystemType.current.name}" is unsupported.',
      );
      expect(
        OperatingSystemUnsupportedError(reason: 'x').toString(),
        'Unsupported operation: Operating system "${OperatingSystemType.current.name}" is unsupported.\n'
        'Reason: x',
      );
    }, testOn: '!browser');

    test('chrome', () {
      expect(
        OperatingSystemUnsupportedError().toString(),
        'Unsupported operation: Web platform is unsupported.',
      );
      expect(
        OperatingSystemUnsupportedError(reason: 'x').toString(),
        'Unsupported operation: Web platform is unsupported.\n'
        'Reason: x',
      );
    }, testOn: 'browser');
  });
}
