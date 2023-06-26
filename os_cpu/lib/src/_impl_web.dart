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
import 'dart:html' as html;

import 'package:os/os.dart';

import '../os_cpu.dart';

int? get cpuConcurrencyImpl => html.window.navigator.hardwareConcurrency;

Future<CpuType?> getCpuType() async {
  return getCpuTypeSync();
}

CpuType? getCpuTypeSync() {
  //
  // Guess based on the operating system.
  //
  final operatingSystemType = OperatingSystemType.current;
  if (const {
    OperatingSystemType.android,
    OperatingSystemType.fuchsia,
    OperatingSystemType.ios,
    OperatingSystemType.mac,
  }.contains(operatingSystemType)) {
    return CpuType.aarch64;
  }
  return CpuType.amd64;
}
