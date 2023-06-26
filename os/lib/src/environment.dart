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
import 'test_environment.dart';

/// Tells whether the code is running in debug mode (assertions enabled).
///
/// If the value is `false`, one of the following may be `true`:
///   * [isRunningInProfileMode]
///   * [isRunningInReleaseMode]
///
/// ## Example
/// ```
/// import 'package:os/os.dart';
///
/// void doSomething() {
///   if (isRunningInDebugMode) {
///     // ...
///   } else {
///     // ...
///   }
/// }
/// ```
///
/// ## See also
///   * [isRunningInFlutter]
///   * [isRunningInJs]
///   * [isRunningInTest]
///   * [isRunningInWeb]
const bool isRunningInDebugMode =
    !isRunningInReleaseMode && !isRunningInProfileMode;

/// Tells whether the code is running in a Flutter application (any platform,
/// including web).
///
/// ## Example
/// ```
/// import 'package:os/os.dart';
///
/// void doSomething() {
///   if (isRunningInFlutter) {
///     // ...
///   } else {
///     // ...
///   }
/// }
/// ```
///
/// ## See also
///   * [isRunningInWeb]
///   * [isRunningInDebugMode]
///   * [isRunningInJs]
///   * [isRunningInReleaseMode]
///   * [isRunningInTest]
const bool isRunningInFlutter = bool.fromEnvironment('dart.library.ui');

/// Tells whether the code is running in a Javascript interpreter.
///
/// Note that this may be false even if [isRunningInWeb] is true. For
/// example, the application could have been compiled to Web Assembly (WASM).
///
/// ## Example
/// ```
/// import 'package:os/os.dart';
///
/// void doSomething() {
///   if (isRunningInJs) {
///     // ...
///   } else {
///     // ...
///   }
/// }
/// ```
///
/// ## See also
///   * [isRunningInDebugMode]
///   * [isRunningInFlutter]
///   * [isRunningInProfileMode]
///   * [isRunningInReleaseMode]
///   * [isRunningInTest]
///   * [isRunningInWeb]
const bool isRunningInJs =
    bool.fromEnvironment('dart.library.js') && 0 is double;

/// Tells whether the code is running in debug mode (assertions enabled).
///
/// If the value is `false`, one of the following may be `true`:
///   * [isRunningInDebugMode]
///   * [isRunningInReleaseMode]
///
/// ## Example
/// ```
/// import 'package:os/os.dart';
///
/// void doSomething() {
///   if (isRunningInProfileMode) {
///     // ...
///   } else {
///     // ...
///   }
/// }
/// ```
///
/// ## See also
///   * [isRunningInFlutter]
///   * [isRunningInJs]
///   * [isRunningInTest]
///   * [isRunningInWeb]
const bool isRunningInProfileMode = bool.fromEnvironment('dart.vm.profile');

/// Tells whether the code is running in debug mode (assertions enabled).
///
/// If the value is `false`, one of the following may be `true`:
///   * [isRunningInDebugMode]
///   * [isRunningInProfileMode]
///
/// ## Example
/// ```
/// import 'package:os/os.dart';
///
/// void doSomething() {
///   if (isRunningInReleaseMode) {
///     // ...
///   } else {
///     // ...
///   }
/// }
/// ```
///
/// ## See also
///   * [isRunningInFlutter]
///   * [isRunningInJs]
///   * [isRunningInTest]
///   * [isRunningInWeb]
const bool isRunningInReleaseMode = bool.fromEnvironment('dart.vm.product');

/// Tells whether the code is running in a web browser.
///
/// If the application has been compiled to Javascript, [isRunningInJs]
/// will also be true.
///
/// ## Example
/// ```
/// import 'package:os/os.dart';
///
/// void doSomething() {
///   if (isRunningInWeb) {
///     // ...
///   } else {
///     // ...
///   }
/// }
/// ```
///
/// ## See also
///   * [isRunningInDebugMode]
///   * [isRunningInFlutter]
///   * [isRunningInJs]
///   * [isRunningInReleaseMode]
///   * [isRunningInTest]
const bool isRunningInWeb = bool.fromEnvironment('dart.library.html');

/// Immutable map of environmental variables.
///
/// In browsers, the map is empty.
///
/// ## Example
/// ```
/// import 'package:os/os.dart';
///
/// void main() {
///   final list = environmentalVariables.keys.toList();
///   list.sort();
///   print('Environmental variables: ${list.join(' ')}');
/// }
/// ```
Map<String, String> get environmentalVariables => environmentalVariablesImpl;

/// Tells whether the code is running in test.
///
/// If you want to add tear-downs, use [TestEnvironment.addTearDown].
///
/// ## Example
/// ```
/// import 'package:os/os.dart';
///
/// void doSomething() {
///   if (isRunningInTest) {
///     // ...
///   } else {
///     // ...
///   }
/// }
/// ```
///
/// ## See also
///   * [isRunningInDebugMode]
///   * [isRunningInFlutter]
///   * [isRunningInJs]
///   * [isRunningInProfileMode]
///   * [isRunningInReleaseMode]
///   * [isRunningInWeb]
bool get isRunningInTest => TestEnvironment.current != null;
