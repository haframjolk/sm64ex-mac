# sm64ex-mac

A script to compile sm64ex for macOS (Intel or Apple silicon) and create an app bundle.

## Dependencies

Compiling sm64ex and creating an app bundle with all dylibs included on macOS requires the following Homebrew bottles to be installed:

```sh
brew install gcc make audiofile sdl2 glew glfw pkg-config mingw-w64 dylibbundler
```

## Building

Clone the sm64ex repository:

```sh
git clone https://github.com/sm64pc/sm64ex.git
```

Place a US Super Mario 64 ROM in the sm64ex repository root and name it `baserom.us.z64`, as per the instructions in the sm64ex repository. Apply any patches you wish to apply before compilation.

Clone this repository:

```sh
git clone https://github.com/haframjolk/sm64ex-mac.git
```

Place the icon you wish to use for the app bundle in the repository root and name it `icon.icns`.

Run the build script with the path to your sm64ex repository root as an argument:

```sh
./build-sm64ex-mac.sh ../sm64ex
```

The resulting app bundle will be located in `out/sm64ex.app`.
