# cashregister

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Use java 17 ( not 21)
attempt to  using java 21 was failed, need to investigate more on this 
set flutter java home using this command : 
```shell
flutter config --jdk-dir /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
```

### when entity / dao was change run generator 
```shell
flutter packages pub run build_runner build
```