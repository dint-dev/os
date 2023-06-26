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
  {
    final testEnvironment = TestEnvironment.current;

    test('TestEnvironment.current when inside main()', () {
      expect(testEnvironment, isNotNull);
      expect(testEnvironment, isNot(TestEnvironment.current!));
      TestEnvironment.current!.addTearDown(() {});
      TestEnvironment.current!.printOnFailure('example');
    });
  }

  group('TestEnvironment.current when inside group(...)', () {
    final testEnvironment = TestEnvironment.current;

    test('test', () {
      expect(testEnvironment, isNotNull);
      expect(testEnvironment, isNot(TestEnvironment.current!));
      TestEnvironment.current!.addTearDown(() {});
      TestEnvironment.current!.printOnFailure('example');
    });
  });

  test('TestEnvironment.current when inside test(...)', () {
    expect(TestEnvironment.current, isNotNull);
    expect(TestEnvironment.current, TestEnvironment.current!);
    TestEnvironment.current!.addTearDown(() {});
    TestEnvironment.current!.printOnFailure('example');
  });

  {
    final testEnvironment = TestEnvironment.current;
    test('TestEnvironment.current when not a test', () {
      expect(testEnvironment, isNotNull);
      expect(testEnvironment, isNot(TestEnvironment.current!));
      TestEnvironment.current!.addTearDown(() {});
      TestEnvironment.current!.printOnFailure('example');
    });
  }
}
