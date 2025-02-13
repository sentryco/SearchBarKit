import SwiftUI
/**
 * Contains the `SearchField` and related UI elements
 * Abstract: A SwiftUI view component that provides a customizable and interactive search interface, including text input, placeholder, and focus management.
 * - Description: The `SearchBar` struct defines a user interface component
 *                for text-based search functionality within an app. It
 *                includes a text field for user input, a placeholder to
 *                indicate the intended use, and callbacks for text changes
 *                and focus events. The component is designed to integrate
 *                seamlessly with SwiftUI views and provides a customizable
 *                and interactive search experience.
 * - Fixme: ⚠️️ Possibly customize `NSSearchField` in the future etc (less custom code etc, do it when migrating to SwiftUI / Catalyst) might be able to customize it etc?
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
    * - Fixme: ⚠️️ Make this a binding or remove? or use textFieldIsFocused? expand on this?
    * - Fixme: ⚠️️️ Make `onFocus` a binding instead? 👈 fix it later when transfering code and comments from legacy etc, rational? pros and cons?
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
    * - Note: This callback is a way for caller to listen to changes. It avoids having to add a state in the caller scope. instead we have the state here.
    * - Fixme: ⚠️️ The `onTextChange` should probably just be a 👉 binding 👈, so maybe remove that? fix it later when transfereing code and comments from legacy etc, rational? pros and cons?
    * - Parameters:
    *   - text: The new text in the search bar
    */
   internal var onTextChange: OnTextChange
   /**
    * Current search
    * - Description: This property holds the current search text in the search bar.
    * - Fixme: ⚠️️ Make this a binding instead? or keep the "state + callback structure"? do analysis, pros and cons?
    */
   @State internal var searchText: String
   /**
    * Tracks the focus-state of the text-field in the search-bar.
    * - Description: This property tracks whether the text field in the 
    *                search bar is currently focused or not. It is used 
    *                to manage the keyboard visibility and the state of 
    *                the search bar.
    * - Note: Ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-dismiss-the-keyboard-for-a-textfield
    * - Remark: Hides the clear button if not in "search-mode", sets the background style, and forwards the callback
    * - Remark: This highlights the text in the search bar and sets focus to the text field.
    * - Note: Alt name: `isTextFieldFocused`
    */
   @FocusState internal var textFieldIsFocused: Bool
   /**
     * Determines whether the text field should automatically gain focus upon initialization.
     * - Description: A Boolean value that specifies if the search bar's text field should automatically
     *                become the first responder and receive input focus when the search bar view is created.
     *                If set to true, the keyboard will appear immediately, allowing the user to start typing
     *                without needing to tap the text field.
    * - Imporatnt: ⚠️️ Temp hack for now. Solve in a better way by injecting a binding or something. Check with copilot. or placing @FocusState in the caller, i guess keeping it here is better, and figuring out a way to inject it. but its not obvious how
    * - Note: This will highlight the text on init, so that the user can type immidiatly
    * - Fixme: ⚠️️ Check the code in the PinView package, maybe it has better init focus code?
    */
   internal let textFieldShouldFocusOnInit: Bool
   /**
    * Initializes a SearchBar with the specified parameters.
    * - Description: Initializes a `SearchBar` with a specific placeholder 
    *                text, focus callback, and text change callback. The 
    *                placeholder text is displayed when the search bar is 
    *                empty. The focus callback is invoked when the search 
    *                bar gains or loses focus, and the text change callback 
    *                is invoked when the text in the search bar changes.
    * - Fixme: ⚠️️ Move the placeholderText into const `Title.searchText`, elaborate on this?
    * - Fixme: ⚠️️ Localize the placeholder text, or do that from the caller POV?
    * - Fixme: ⚠️️ Rename searchText to initsearchText? yes, do it later
    * - Parameters:
    *   - placeholderText: The placeholder text for the search bar.
    *   - onFocus: The callback to execute when the search bar gains focus.
    *   - onTextChange: The callback to execute when the text in the search bar changes.
    *   - searchbarSizing: The sizing configuration for the search bar.
    *   - searchBarTheme: The theme configuration for the search bar.
    *   - textFieldShouldFocusOnInit: A boolean value indicating whether the text field should automatically gain focus when the search bar is initialized.
    *   - searchText: The current text in the search bar.
    */
   public init(
      placeholderText: String = "Search..", 
      searchbarSizing: SearchBarSizing = SearchBarSizing.defaultSizing, 
      searchBarTheme: SearchBarTheme = SearchBarTheme.defaultTheme, 
      onFocus: @escaping OnFocus = defaultOnFocus, 
      onTextChange: @escaping OnTextChange = defaultOnTextChange, /*textFieldIsFocused: FocusState<Bool>.Binding,*/ 
      textFieldShouldFocusOnInit: Bool = false, 
      searchText: String = ""
   ) {
      self.placeholderText = placeholderText
      self.onFocus = onFocus
      self.onTextChange = onTextChange
      self._searchText = .init(initialValue: searchText)
      self.textFieldShouldFocusOnInit = textFieldShouldFocusOnInit
      Self.searchbarSizing = searchbarSizing
      Self.searchBarTheme = searchBarTheme
   }
}
// fixme: remove these as we have gridview now
public var isDebuggingSearchBar: Bool = false // ⚠️️ Debug colors
public var isPrintingSearchBar: Bool = false // ⚠️️ Debug sizing
