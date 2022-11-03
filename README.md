# flutter_stocks_assessment

Flutter Stock Assesment

## Code Quality

```shell
# Code Linting
flutter analyze

# Code Style Check
flutter format -o none --set-exit-if-changed lib

# Code Formatting
flutter format lib
```

## iOS build command

Run after adding or updating a Flutter library.

```shell
cd ios
pod repo update
pod update
```

## Creating Release Builds

### Android

```shell
flutter build appbundle
```

### iOS

```shell
flutter build ios
```

Then run `Product -> Archive` from Xcode.
