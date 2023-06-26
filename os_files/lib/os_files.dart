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

/// Provides information about operating system file system.
///
/// The library works in all platforms, including browsers.
///
/// ## Main APIs
///   * [terminalAppDirectories]
///     * Returns directories in the system PATH.
///   * [terminalAppFound]
///     * Inspects whether the terminal application is found (in the system
///       PATH).
///   * [randomTemporaryDirectory]
///     * Generates a path for a temporary directory.
library os.files;

import 'os_files.dart';

export 'src/directories.dart';
