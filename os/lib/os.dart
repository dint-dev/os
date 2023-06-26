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

/// Provides information about operating system.
///
/// The library works in all platforms, including browsers.
///
/// The main APIs are:
///   * [environmentalVariables]
///     * Contains environmental variables.
///   * [isRunningInDebugMode]
///     * Is the application running in debug mode?
///   * [isRunningInFlutter]
///     * Is the application running in a Flutter application?
///   * [isRunningInProfileMode]
///     * Is the application running in production mode?
///   * [isRunningInReleaseMode]
///     * Is the application running in production mode?
///   * [isRunningInTest]
///     * Is the application running inside a test?
///   * [isRunningInWeb]
///     * Is the application running in browser?
///   * [OperatingSystemType.current]
///     * In non-browser platforms, returns current operating system type.
///     * In browsers, uses browser APIs (such as `navigator.userAgent`) to try
///       to determine the underlying operating system.
///   * [OperatingSystemUnsupportedError]
///     * An exception that can be used to signal that operating system is not
///       supported by your code.
///   * [TestEnvironment]
library os;

import 'os.dart';

export 'src/environment.dart';
export 'src/operating_system_type.dart';
export 'src/operating_system_unsupported_error.dart';
export 'src/test_environment.dart';
