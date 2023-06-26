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

import '../os.dart';
import '_impl.dart';

/// Operating system type.
///
/// You can get current operating system type with [OperatingSystemType.current].
/// In browsers, the value is determined by using uses browser APIs such as
/// `navigator.userAgent`. If you want to check whether the application is
/// running in a browser, use [isRunningInWeb].
///
/// ## Example
/// ```
/// print(OperatingSystemType.current);
/// ```
enum OperatingSystemType {
  /// Android.
  android,

  /// Fuchsia.
  fuchsia,

  /// iOS (iPhone OS, iPad OS, etc.).
  ios,

  /// Chrome OS.
  chrome,

  /// Linux (but not [android] or [chrome]).
  linux,

  /// Mac OS X.
  mac,

  /// Windows.
  windows;

  /// Current operating system type.
  ///
  /// In browsers, the value is determined by using uses browser APIs such as
  /// `navigator.userAgent`. If you want to check whether the application is
  /// running in a browser, use [isRunningInWeb].
  static final OperatingSystemType current = getOperatingSystemType();

  /// Whether this is an operating system designed by Apple ([ios],
  /// [mac]).
  bool get isCupertino => const {ios, mac}.contains(this);
}
