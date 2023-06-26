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

import '_impl.dart';

/// Returns the number of CPUs (if known).
int? get cpuConcurrency => cpuConcurrencyImpl;

/// CPU type.
///
/// You can the CPU type of the current process with [CpuType.get] or
/// [CpuType.getSync].
enum CpuType {
  /// 32-bit ARM architecture CPU.
  aarch32,

  /// 64-bit ARM architecture CPU.
  aarch64,

  /// 32-bit X86 architecture CPU.
  x86,

  /// 64-bit AMD64 (also known as X64) architecture CPU.
  amd64;

  static Future<CpuType?>? _cpuTypeFuture;

  static CpuType? _cpuType = () {
    final result = getCpuTypeSync();
    _cpuTypeFuture ??= Future<CpuType?>.value(result);
    return result;
  }();

  /// Whether a CPU of this type can run a program of the argument type.
  bool canRun(CpuType cpuType) {
    if (cpuType == this) {
      return true;
    }
    switch (this) {
      case aarch64:
        return cpuType == aarch32;
      case amd64:
        return cpuType == x86;
      default:
        return false;
    }
  }

  /// Determines CPU type of the current process.
  ///
  /// In browsers, attempts to determine the CPU using browser APIs.
  ///
  /// Returns null if the type is unknown.
  ///
  /// You should use [CpuType.getSync] if you need the result synchronously.
  ///
  /// ## Example
  /// ```
  /// import 'package:os/os_cpu.dart';
  ///
  /// Future<void> main() async {
  ///   final cpuType = await CpuType.get();
  ///   print('CPU type: $cpuType');
  /// }
  /// ```
  static Future<CpuType?> get() {
    final oldFuture = _cpuTypeFuture;
    if (oldFuture != null) {
      return oldFuture;
    }
    final newFuture = getCpuType();
    _cpuTypeFuture = newFuture;
    newFuture.then((value) {
      _cpuType ??= value;
    });
    return newFuture;
  }

  /// Determines CPU type of the current process synchronously.
  ///
  /// In browsers, attempts to determine the CPU using browser APIs.
  ///
  /// Returns null if the type is unknown.
  ///
  /// You should use [CpuType.get] if you do NOT need the result synchronously.
  static CpuType? getSync() => _cpuType;
}
