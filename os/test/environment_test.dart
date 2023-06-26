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
  test('isRunningInDebugMode == true', () {
    expect(isRunningInDebugMode, isTrue);
  });

  test('isRunningInProfileMode == false', () {
    expect(isRunningInProfileMode, isFalse);
  });

  test('isRunningInReleaseMode == false', () {
    expect(isRunningInReleaseMode, isFalse);
  });

  test('isRunningInFlutter == false', () {
    expect(isRunningInFlutter, isFalse);
  });

  test('isRunningInTest == true', () {
    expect(isRunningInTest, isTrue);
  });

  group('not in browser:', () {
    test('isRunningInWeb == false', () {
      expect(isRunningInWeb, isFalse);
    });
    test('isRunningInJs == false', () {
      expect(isRunningInJs, isFalse);
    });
    test('environmentalVariables is not empty', () {
      expect(environmentalVariables, isNotEmpty);
    });
  }, testOn: '!browser');

  group('in browser:', () {
    test('isRunningInWeb == true', () {
      expect(isRunningInWeb, isTrue);
    });
    test('isRunningInJs == true', () {
      expect(isRunningInJs, isTrue);
    });
    test('environmentalVariables is empty', () {
      expect(environmentalVariables, isEmpty);
    });
  }, testOn: 'browser');
}
