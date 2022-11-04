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


## Getting Started


Stocks api is being used for fetching stocks of 10 random companies (Apple, Microsoft, Google, Amazon, Tesla, Nvidia, Cisco, Paypal, AMD, Intel).
The api endpoint used for fetching stocks is "http://api.marketstack.com/v1/eod?access_key=$_API_KEY&symbols=AAPL,MSFT,AMZN,TSLA,NVDA,GOOGL,AMD,INTC,CSCO,PYPL"
Api key is currently of free subscription which gets expired after every 100 network calls.

User can change date selection to fetch results of different dates.
Autocomplete search added for company name. User can search via company name.
