# SearchBarKit

> Sleek searchbar for iPad and macOS

## Features

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
- Add SearchBarPallet (injectable color) 👈
- Add SearchBarIdentifier (injectable accessid) 👈
- Make a gif
- Improve readme
- Add github action
- Clean up comments
- Add to main project (interfacelib?)
- Move more metrics to const
