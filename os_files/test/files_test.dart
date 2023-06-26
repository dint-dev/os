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

import 'dart:io';

import 'package:os_files/os_files.dart';
import 'package:test/test.dart';

void main() {
  test('systemCommandsPaths is not empty', () async {
    expect(terminalAppDirectories, isNotEmpty);
  }, testOn: '!browser');

  test('systemCommandsPaths is empty', () async {
    expect(terminalAppDirectories, isEmpty);
  }, testOn: 'browser');

  test('systemCommandsContains("dart") == true', () async {
    expect(await terminalAppFound('dart'), isTrue);
  }, testOn: '!browser');

  test('systemCommandsContains("dart") == false', () async {
    expect(await terminalAppFound('dart'), isFalse);
  }, testOn: 'browser');

  test('systemCommandsContains("cd") == true', () async {
    expect(await terminalAppFound('cd'), isTrue);
  }, testOn: '!browser');

  test('systemCommandsContains("cd") == false', () async {
    expect(await terminalAppFound('cd'), isFalse);
  }, testOn: 'browser');

  {
    late Directory directory;
    test('temporaryRandomDirectory()', () async {
      directory = randomTemporaryDirectory();
      expect(directory.path,
          startsWith(Directory.systemTemp.path + Platform.pathSeparator));
      expect(await directory.exists(), isFalse);
      await directory.create(recursive: true);
      expect(await directory.exists(), isTrue);
    }, testOn: '!browser');

    test('temporaryRandomDirectory() deletes directory', () async {
      expect(await directory.exists(), isFalse);
    }, testOn: '!browser');
  }

  test(
      'temporaryRandomDirectory() does not attempt to delete non-existing directory',
      () async {
    randomTemporaryDirectory();
  }, testOn: '!browser');

  test('temporaryRandomDirectory()', () async {
    expect(() => randomTemporaryDirectory(), throwsUnsupportedError);
  }, testOn: 'browser');
}
