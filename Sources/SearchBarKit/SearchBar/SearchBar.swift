import SwiftUI
/**
 * Contains the `SearchField` and related UI elements
 * - Description: The `SearchBar` struct defines a user interface component
 *                for text-based search functionality within an app. It
 *                includes a text field for user input, a placeholder to
 *                indicate the intended use, and callbacks for text changes
 *                and focus events. The component is designed to integrate
 *                seamlessly with SwiftUI views and provides a customizable
 *                and interactive search experience.
 * - Fixme: ⚠️️⚠️️ The `onTextChange` should probably just be a 👉 binding 👈, so maybe remove that? fix it later when transfereing code and comments from legacy etc
 * - Fixme: ⚠️️⚠️️ Make `onFocus` a binding instead? 👈 fix it later when transfering code and comments from legacy etc
 * - Fixme: ⚠️️ Possibly customize `NSSearchField` in the future etc (less custom code etc, do it when migrating to SwiftUI / Catalyst)
 */
public struct SearchBar: View {
   /**
    * Placeholder text for the search bar.
    * - Description: This text is displayed in the search bar when no text is entered.
    */
   internal let placeholderText: String
   /**
    * Callback executed when the search bar gains focus.
    * - Description: The callback function that is invoked when the 
    *                search bar either gains or loses focus, allowing 
    *                the parent view to react to focus changes.
    * - Fixme: ⚠️️ Make this a binding or remove? or use textFieldIsFocused?
    * - Parameters:
    *   - isFocused: A boolean indicating whether the search bar is now focused.
    */
   internal let onFocus: OnFocus // = defaultOnFocus
   /**
    * Callback executed when the text in the search bar changes.
    * - Description: The callback function that is invoked when the user 
    *                changes the text in the search bar. It allows the 
    *                parent view to react and handle the updated search 
    *                text in real-time.
    * - Parameters:
    *   - text: The new text in the search bar.
    */
   internal var onTextChange: OnTextChange // = defaultOnTextChange
   /**
    * Current search
    * - Description: This property holds the current search text in the search bar.
    * - Fixme: ⚠️️ Make this a binding instead?
    */
   @State internal var searchText: String = ""
   /**
    * Tracks the focus state of the text field in the search bar.
    * - Description: This property tracks whether the text field in the 
    *                search bar is currently focused or not. It is used 
    *                to manage the keyboard visibility and the state of 
    *                the search bar.
    * - Note: Ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-dismiss-the-keyboard-for-a-textfield
    * - Remark: Hides the clear button if not in "search-mode", sets the background style, and forwards the callback
    * - Remark: This highlights the text in the search bar and sets focus to the text field.
    */
   @FocusState internal var textFieldIsFocused: Bool
   /**
    * Sizing configuration for the search bar.
    * - Description: This property holds the sizing configuration for the search bar,
    *                which determines the dimensions and layout of the search bar.
    *                It can be customized to fit different design requirements.
    * - Fixme: ⚠️️ rename to sizing?
    */
   internal static var searchbarSizing = SearchBarSizing.defaultSizing
   /**
    * Theme configuration for the search bar.
    * - Description: This property holds the theme configuration for the search bar,
    *                which determines the appearance and style of the search bar.
    *                It can be customized to fit different design requirements.
    * - Fixme: ⚠️️ rename to theme?
    */
   internal static var searchBarTheme = SearchBarTheme.defaultTheme
   /**
    * Initializes a SearchBar with the specified parameters.
    * - Description: Initializes a `SearchBar` with a specific placeholder 
    *                text, focus callback, and text change callback. The 
    *                placeholder text is displayed when the search bar is 
    *                empty. The focus callback is invoked when the search 
    *                bar gains or loses focus, and the text change callback 
    *                is invoked when the text in the search bar changes.
    * - Fixme: ⚠️️ Move the placeholderText into const Title.searchText
    * - Fixme: ⚠️️ Localize the placeholder text, see legacy
    * - Parameters:
    *   - placeholderText: The placeholder text for the search bar.
    *   - onFocus: The callback to execute when the search bar gains focus.
    *   - onTextChange: The callback to execute when the text in the search bar changes.
    */
   public init(placeholderText: String = "Search..", searchbarSizing: SearchBarSizing = SearchBarSizing.defaultSizing, searchBarTheme: SearchBarTheme = SearchBarTheme.defaultTheme, onFocus: @escaping OnFocus = defaultOnFocus, onTextChange: @escaping OnTextChange = defaultOnTextChange) {
      self.placeholderText = placeholderText
      self.onFocus = onFocus
      self.onTextChange = onTextChange
      self.searchText = searchText
      self.textFieldIsFocused = textFieldIsFocused
      Self.searchbarSizing = searchbarSizing
      Self.searchBarTheme = searchBarTheme
   }
}
