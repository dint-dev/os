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

/// A subclass of [UnsupportedError] when something is unsupported because of
/// the platform (operating system, CPU, etc.).
class OperatingSystemUnsupportedError extends UnsupportedError {
  static const _webPlatformMessage = 'Web platform is unsupported.';

  /// Constructs an error that contains the current operating system.
  ///
  /// You can optionally specify a more detailed [reason].
  factory OperatingSystemUnsupportedError({String? reason}) {
    return OperatingSystemUnsupportedError._message(
      message: isRunningInWeb
          ? _webPlatformMessage
          : 'Operating system "${OperatingSystemType.current.name}" is unsupported.',
      reason: reason,
    );
  }

  /// Constructs an error that contains only the message.
  OperatingSystemUnsupportedError.raw(super.message);

  factory OperatingSystemUnsupportedError._message({
    required String message,
    required String? reason,
  }) {
    final sb = StringBuffer();
    sb.write(message);
    if (reason != null) {
      sb.write('\nReason: $reason');
    }
    return OperatingSystemUnsupportedError.raw(sb.toString());
  }

  /// Checks that the current operating system is one of the given.
  ///
  /// Otherwise throws [OperatingSystemUnsupportedError].
  static void check(
    Set<OperatingSystemType> operatingSystemTypes, {
    String? reason,
  }) {
    if (operatingSystemTypes.contains(OperatingSystemType.current)) {
      throw OperatingSystemUnsupportedError(reason: reason);
    }
  }
}
