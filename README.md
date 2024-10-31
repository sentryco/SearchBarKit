[![Tests](https://github.com/sentryco/SearchBarKit/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/SearchBarKit/actions/workflows/Tests.yml)

# SearchBarKit

> Sleek searchbar for iOS and macOS

<img width="388" alt="img" src="https://s11.gifyu.com/images/SOOPE.gif">

## Features

- Focus triggers callback and receeded look and feel
- Text change triggers callback
- Customizable sizing and color theme (via struct injection)
- Works for iOS and macOS
- Dark / light mode

## Example

```swift
SearchBar(
   placeholderText: "Search...", // Placeholder text
   onFocus: { // Triggered when searchfield is focused
      Swift.print("isFocused: \($0)")
   }, onTextChange: { // Triggered when text changes
      Swift.print("text: \($0)")
   }
)
```

## Todo
- Maybe not hide close button on focus loss?
- Add more comments with AI 
- Remove unit test, add uitest

## Future improvments:
- Add SearchBarIdentifier (injectable accessid) (for now these are hardcoded) 
- Move more metrics to const (later when it makes sense) 
