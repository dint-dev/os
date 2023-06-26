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
import 'dart:math';

import 'package:os/os.dart';

import '../os_files.dart';

final Set<Directory> _deletedDirectories = {};

final String _processTemporaryPath = () {
  final sb = StringBuffer();
  sb.write(Directory.systemTemp.path);
  sb.write(Platform.pathSeparator);
  var prefix = Platform.executable;
  final i = prefix.lastIndexOf(Platform.pathSeparator);
  if (i >= 0) {
    prefix = prefix.substring(i + 1);
  }
  sb.write(
      prefix.replaceAll('/', '').replaceAll(r'\', '').replaceAll(r' ', '_'));
  sb.write('_');
  sb.write(DateTime.now()
      .toUtc()
      .toIso8601String()
      .replaceAll('-', '')
      .replaceAll('T', '')
      .replaceAll(':', '')
      .replaceAll('Z', ''));
  final random = Random.secure();
  for (var i = 0; i < 16; i++) {
    sb.write(random.nextInt(16).toRadixString(16));
  }
  return sb.toString();
}();

int _temporaryDirectoryCounter = 0;

List<Directory> get terminalAppDirectoriesImpl {
  final path = environmentalVariables['PATH'];
  if (path == null) {
    return const <Directory>[];
  }
  return List<Directory>.unmodifiable(path.split(':').map((e) => Directory(e)));
}

Directory randomTemporaryDirectoryImpl({
  String? debugName,
  bool deleteAfterExit = true,
  bool deleteAfterTest = true,
}) {
  final sb = StringBuffer();
  sb.write(_processTemporaryPath);
  sb.write(Platform.pathSeparator);
  sb.write(_temporaryDirectoryCounter++);
  if (debugName != null) {
    sb.write('_');
    sb.write(debugName.replaceAll(Platform.pathSeparator, ''));
  }

  final result = Directory(sb.toString());

  var hasAddedTearDown = false;
  if (deleteAfterTest) {
    final testEnvironment = TestEnvironment.current;
    if (testEnvironment != null) {
      testEnvironment.addTearDown(() async {
        if (await result.exists()) {
          await result.delete(recursive: true);
        }
        try {
          await result.parent.delete();
        } catch (error) {
          // Ignore error
        }
      });
      hasAddedTearDown = true;
    }
  }

  if (!hasAddedTearDown && deleteAfterExit) {
    if (_deletedDirectories.isEmpty) {
      for (var signal in [
        ProcessSignal.sigabrt,
        ProcessSignal.sigkill,
        ProcessSignal.sigquit,
        ProcessSignal.sigterm,
      ]) {
        signal.watch().first.whenComplete(() async {
          _deleteTemporaryDirectories();
        });
      }
    }
    _deletedDirectories.add(result);
  }

  return result;
}

Future<bool> terminalAppFoundImpl(String name) async {
  final futures = terminalAppDirectories.map((directory) async {
    final executablePath = '${directory.path}${Platform.pathSeparator}$name';
    final file = File(executablePath);
    try {
      return await file.exists();
    } catch (error) {
      return false;
    }
  });
  await for (var exists in Stream<bool>.fromFutures(futures)) {
    if (exists) {
      return true;
    }
  }
  return false;
}

Future<void> _deleteTemporaryDirectories() async {
  final list = _deletedDirectories.toList();
  _deletedDirectories.clear();
  for (var item in list) {
    if (await item.exists()) {
      await item.delete(recursive: true);
    }
  }
}
