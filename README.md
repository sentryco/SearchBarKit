[![Tests](https://github.com/sentryco/SearchBarKit/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/SearchBarKit/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/80a82bb4-248f-44e1-9117-b780cddbc8e6)](https://codebeat.co/projects/github-com-sentryco-searchbarkit-main)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Swift Version](https://img.shields.io/badge/Swift-5.9-orange)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20macOS-lightgrey.svg)](#)


# SearchBarKit

> Sleek searchbar for iOS and macOS

<img width="388" alt="img" src="https://s11.gifyu.com/images/SOOPE.gif">

## Features

- 🎯 **Focus Callbacks**: Receive notifications when the search field gains or loses focus.
- ✍️ **Real-time Text Updates**: Get instant updates as the user types.
- 🎨 **Effortless Customization**: Easily adjust sizing and color themes via struct injection.
- 🌐 **Cross-Platform Compatibility**: Works seamlessly on both iOS and macOS.
- 🌗 **Dark & Light Mode Support**: Automatically adapts to the system's appearance.

## Example

```swift
SearchBar(
      placeholderText: "Search...", // Placeholder text
      onFocus: { isFocused in // Triggered when search field is focused
         print("isFocused: \(isFocused)")
      },
      onTextChange: { text in // Triggered when text changes
         print("text: \(text)")
      }
)
```
**Custom Sizing**

```swift
let customSizing = SearchBarSizing(
      horizontalPadding: 8,
      verticalPadding: 8,
      leftIconHorizontalPadding: 8,
      clearButtonPadding: 8
)

SearchBar(
      placeholderText: "Search...",
      searchbarSizing: customSizing,
      onFocus: { isFocused in
         // Handle focus change
      },
      onTextChange: { text in
         // Handle text change
      }
)
```

**Custom Theme**

```swift
let customTheme = SearchBarTheme(
      iconColor: .blue,
      textColor: .black,
      activeBG: .white,
      activeBorder: .blue,
      background: .gray.opacity(0.2),
      borderColor: .blue
)

SearchBar(
      placeholderText: "Search...",
      searchBarTheme: customTheme,
      onFocus: { isFocused in
         // Handle focus change
      },
      onTextChange: { text in
         // Handle text change
      }
)
```

## Installation
Add to your project using Swift Package Manager by adding the following URL:

```swift
.package(url: "https://github.com/sentryco/SearchBarKit", branch: "main")
```   

## Dependencies:
- [HybridColor](https://github.com/sentryco/HybridColor)

## Todo
- Maybe not hide close button on focus loss?
- Add more comments with AI 
- Remove unit test, add uitest
- It seems placeholder text-color for SearchBar text doesnt work for macOS. Try to fix it
- Store accessIds in an accissible const
- Make SearchBar a ViewBuilder and add styling as a textfield modifier?

## Future improvments:
- Add SearchBarIdentifier (injectable accessid) (for now these are hardcoded) 
- Move more metrics to const (later when it makes sense) 
