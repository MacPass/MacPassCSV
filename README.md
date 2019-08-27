# MacPassCSV

Plugin to import and export CSV files into and from [MacPass](https://github.com/mstarke/MacPass)

## Dependencies

[MacPass Source](https://github.com/mstarke/MacPass)

## Installation

### Using a precompiled version

Download the latest release from the [Releases page](https://github.com/MacPass/MacPassCSV/releases), extract, and copy the resulting file to the MacPass plugin folder at `~/Library/Application Support/MacPass/`. Restart MacPass if you're already running it.

### Building from source

* Clone the repository
```bash
git clone https://github.com/MacPass/MacPassCSV
cd MacPassCSV
```
* Install [Carthage](https://github.com/Carthage/Carthage#installing-carthage)

* Clone MacPass and fetch and build dependencies
```bash
cd ..
git clone https://github.com/mstarke/MacPass
cd MacPass
git checkout 0.7.10
git submodule update --init --recursive
carthage bootstrap --platform macOS
```

* If your folder structure isn't like the following, you need to adjust the ````HEADER_SEARCH_PATHS```` to point to the MacPass folder
````
└─ Folder
   ├─ MacPass
   └─ MacPassCSV
````

* Change back to the MacPassCSV folder, compile and install
```bash
cd ..
cd MacPassCSV
xcodebuild
```

The Plugin is moved to the plugin folder of MacPass automacially.
````~/Library/Application Support/MacPass/MacPassCSV.mpplugin````

## License

The MIT License (MIT)

Copyright (c) 2019 Michael Starke, HicknHack Software GmbH

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

