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
import 'dart:io';

import '_impl.dart';

/// Returns an immutable list of directories in the `PATH` environmental
/// variable.
///
/// In browsers, the list is empty.
///
/// Use [terminalAppFound] to test whether a system has a terminal application.
final List<Directory> terminalAppDirectories = terminalAppDirectoriesImpl;

/// Returns a random temporary directory path.
///
/// The directory will be inside [Directory.systemTemp]. This method does not
/// create the directory or otherwise change state of the file system.
///
/// In browsers, the method returns null.
///
/// You can optionally specify a [debugName].
///
/// If this method is called inside a test and [deleteAfterTest] is
/// true, the directory will be deleted after the test finishes (if it exists).
///
/// ## Example
/// ```
/// import 'package:os/os_memory.dart';
/// import 'package:test/test_environment.dart';
///
/// void main() {
///   test(() {
///     final directory = randomTemporaryDirectory();
///     // ...
///   });
///
///   test(() {
///     final directory = randomTemporaryDirectory();
///     // ...
///   });
/// }
/// ```
Directory randomTemporaryDirectory({
  String? debugName,
  bool deleteAfterTest = true,
}) {
  return randomTemporaryDirectoryImpl(
    debugName: debugName,
    deleteAfterTest: deleteAfterTest,
  );
}

/// Determines whether any directory in [terminalAppDirectories]
/// (`PATH` environmental variable) contains the given application.
///
/// In browsers, the method always returns false.
///
/// ## Example
/// ```
/// import 'package:os/os_memory.dart';
///
/// Future<void> main() async {
///   final hasDart = await terminalAppFound('dart');
///   print('Dart SDK installed: $hasDart');
/// }
/// ```
Future<bool> terminalAppFound(String name) => terminalAppFoundImpl(name);
