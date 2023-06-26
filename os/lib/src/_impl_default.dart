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

import 'dart:io';

import '../../os.dart';

Map<String, String> get environmentalVariablesImpl => Platform.environment;

OperatingSystemType getOperatingSystemType() {
  switch (Platform.operatingSystem) {
    case 'android':
      return OperatingSystemType.android;
    case 'fuchsia':
      return OperatingSystemType.fuchsia;
    case 'ios':
      return OperatingSystemType.ios;
    case 'linux':
      return OperatingSystemType.linux;
    case 'macos':
      return OperatingSystemType.mac;
    case 'windows':
      return OperatingSystemType.windows;
    default:
      return OperatingSystemType.linux;
  }
}
