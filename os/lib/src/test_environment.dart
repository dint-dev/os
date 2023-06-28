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

/// Helps you call various test environment methods.

import 'dart:async';

import '../os.dart';

/// A test environment.
///
/// You can get the current test environment with [TestEnvironment.current].
/// It will return null if the code is not running inside a test. If you just
/// need to know whether a test is running, use [isRunningInTest].
///
/// This does NOT require the package to depend on
/// [package:test](https://pub.dev/packages/test).
abstract class TestEnvironment {
  /// Expando for optimizing [current].
  static final _expando = Expando<TestEnvironment>();

  /// Returns current test environment.
  ///
  /// ## Example
  /// ```
  /// import 'package:os/os.dart';
  ///
  /// void doSomething() {
  ///   TestEnvironment.current?.addTearDown(() async {
  ///     // ...
  ///   });
  /// }
  /// ```
  ///
  /// You don't need any changes in test files:
  /// ```
  /// import 'package:test/test.dart';
  ///
  /// void main() {
  ///   test('doSomething()', () {
  ///     doSomething();
  ///   });
  /// }
  /// ```
  static TestEnvironment? get current {
    final zone = Zone.current;
    final impl = zone[#test.invoker] ?? zone[#test.declarer];
    if (impl == null) {
      return null;
    }
    final existingResult = _expando[impl];
    if (existingResult != null) {
      return existingResult;
    }
    final result = _TestEnvironment(impl);
    _expando[impl] = result;
    return result;
  }

  /// Tells whether the test is closed.
  bool get closed;

  /// A future that completes when the current test has been closed.
  Future<void> get onClose;

  /// Adds a function that will be run when the test (or the test group) is torn
  /// down.
  void addTearDown(FutureOr Function() f);

  /// Signals that the test is still alive.
  void heartbeat();

  /// Prints the message on failure.
  void printOnFailure(String message);

  /// Skips the test.
  void skip([String? message]);
}

class _TestEnvironment extends TestEnvironment {
  final dynamic _impl;

  _TestEnvironment(this._impl);

  @override
  bool get closed => _impl.closed;

  @override
  Future<void> get onClose => _impl.onClose;

  @override
  void addTearDown(FutureOr Function() f) {
    _impl.addTearDown(f);
  }

  @override
  void heartbeat() {
    _impl.heartbeat();
  }

  @override
  void printOnFailure(String message) {
    _impl.printOnFailure(message);
  }

  @override
  void skip([String? message]) {
    _impl.skip(message);
  }
}
