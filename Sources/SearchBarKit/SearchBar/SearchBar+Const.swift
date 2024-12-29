import SwiftUI
import HybridColor
/**
 * Const - theme
 */
extension SearchBar {
   /**
    * Sizing configuration for the search bar.
    * - Description: This property holds the sizing configuration for the search bar,
    *                which determines the dimensions and layout of the search bar.
    *                It can be customized to fit different design requirements.
    * - Fixme: ⚠️️ rename to sizing?
    */
   internal static var searchbarSizing: SearchBarSizing = .defaultSizing
   /**
    * Theme configuration for the search bar.
    * - Description: This property holds the theme configuration for the search bar,
    *                which determines the appearance and style of the search bar.
    *                It can be customized to fit different design requirements.
    * - Fixme: ⚠️️ rename to theme?
    */
   internal static var searchBarTheme: SearchBarTheme = .defaultTheme
   /**
    * Placeholder color for the search bar.
    * - Description: This property defines the color used for the placeholder text in the search bar.
    *                It adjusts its opacity based on the theme to ensure optimal visibility across different backgrounds.
    * - Fixme: ⚠️️ it seems placeholder color only works for iOS at the moment. try to figure out why etc
    */
   internal static let placeholderColor: Color = {
      .init(light: .gray, dark: .gray).opacity(0.8)
   }()
}
/**
 * Const - type / callback
 * - Fixme: ⚠️️ Deprecate these and use bindings and the @Focused prop etc? maybe later when we add code from legacy etc, this needs exploration before executing on it etc do some validating
 */
extension SearchBar {
   /**
    * Closure called when the text in the search bar changes.
    * - Description: This closure is invoked when the text in the 
    *                search bar changes. It allows the parent view to 
    *                react and handle the updated search text in 
    *                real-time.
    * - Parameters:
    *   - text: The new text in the search bar.
    */
   public typealias OnTextChange = (_ text: String) -> Void
   /**
    * Default closure for `OnTextChange`
    */
   public static let defaultOnTextChange: OnTextChange = { (_ text: String) in Swift.print("on text change: \(text)") }
   /**
    * Closure called when the search bar gains or loses focus.
    * - Description: This closure is invoked when the search bar 
    *                gains or loses focus. It allows the parent view to 
    *                react and handle the focus state changes in 
    *                real-time.
    * - Parameters:
    *   - isFocused: A boolean indicating whether the search bar is now focused.
    */
   public typealias OnFocus = (_ isFocused: Bool) -> Void
   /**
    * Default closure for OnFocus.
    */
   public static let defaultOnFocus: OnFocus = { (_ isFocused: Bool) in Swift.print("isfocused: \(isFocused)") }
}
