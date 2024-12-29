import SwiftUI
import HybridColor
/**
 * Components
 * - Fixme: ⚠️️ Take a look at the new `focusEffectDisabled`: https://stackoverflow.com/a/77681648/5389500 and https://stackoverflow.com/a/60286113/5389500
 */
extension SearchBar {
   /**
    * - Description: This property creates a horizontal stack that layers the search icon, text field, and clear button horizontally. It is used to construct the visual layout of the search bar.
    * - Note: The tallest view represents the height of the entire stack. In this case clearButton is 46px high, and the stack is then 46px high
    */
   internal var stack: some View {
      HStack(spacing: .zero) { // Initializes a ZStack to layer the searchTextField and the HStack containing icons and clear button
         leftIcon // Adds search icon to the left
         searchTextField // Displays the search text field
         clearButton // Adds clearButton to the right
      }
         .background(
            backgroundView
         )
         .getHeight { height in
            if isPrintingSearchBar {
               print("SearchBar height: \(height)")
            }
         }
   }
}
/**
 * Private
 */
extension SearchBar {
   /**
    * Creates background view for the `SearchBar`
    * - Remark: Represents the background for the input-text-field (has rounded corners etc)
    * - Fixme: ⚠️️ Move cornerRadius to const
    */
   fileprivate var backgroundView: some View {
      let style: SearchBar.Style = SearchBar.getStyle(isFocused: textFieldIsFocused)
      return RoundedRectangle(cornerRadius: 10) // Creates a rounded rectangle with a corner radius of 12 to be used as an overlay.
         .stroke( // Strokes the border of the rounded rectangle with a gray color and a line width of 1.0.
            style.borderColor,
            lineWidth: style.borderWidth
         )
         .fill(style.backgroundColor)
   }
   /**
    * Creates the icon (leftIcon)
    * - Fixme: ⚠️️ Maybe also add focused and unfocused state for this? change the colors etc?
    * - Fixme: ⚠️️ Move icon to const
    * - Fixme: ⚠️️ Consider moving size to const 👈
    */
   fileprivate var leftIcon: some View {
      Image(optionalSystemName: "magnifyingglass")?
         .iconStyle(
            size: 18,
            padding: SearchBar.searchbarSizing.leftIconHorizontalPadding,
            color: SearchBar.searchBarTheme.iconColor
         )
         .getHeight { height in
            if isPrintingSearchBar {
               print("leftIcon height: \(height)")
            }
         }
   }
   /**
    * searchTextField
    * - Description: This view represents the search text field in the 
    *                search bar. It is responsible for displaying the 
    *                search input and handling focus state changes.
    * - Note: the search_text_field is the accessibility id
    * - Note: The `focused` modifier is used to dynamically change the 
              focus state of the text field based on the 
              `textFieldIsFocused` state variable. This allows the text 
              field to gain or lose focus programmatically, which is 
              essential for managing the user's interaction with the 
              search bar.
    * - Fixme: ⚠️️ Move logic into modifiers, see `PinCode`, how it's done there etc? 👈 can searchbar be a style or a modifier etc?
    * - Fixme: ⚠️️ Remove the TextField id. we set the real id later? make sure UITests keep running etc
    */
   fileprivate var searchTextField: some View {
      let placeholderTxt: Text = {
         return Text(placeholderText) // Customize placeholder text color
            .foregroundStyle(Self.placeholderColor)
      }()
      return TextField(
         "searchTextField", // Sets the accessibility identifier for the text field
         text: $searchText, // Binds the text field to the searchText state
         prompt: placeholderTxt // Sets the placeholder text for the text field
      )
      .searchTextFieldStyle(isFocused: $textFieldIsFocused) // Applies the search text field style
      .getHeight { height in
         if isPrintingSearchBar {
            print("searchTextField height: \(height)")
         }
      }
      .accessibilityIdentifier("searchTextField") // Sets the accessibility identifier for the text field
      .onChange(of: textFieldIsFocused) { _, _ in // Listens for changes in textFieldIsFocused
         onFocus(textFieldIsFocused) // Calls the onFocus callback with the updated focus state
      }
   }
   /**
    * Creates the "clear-text-btn"
    * - Description: This view represents the clear button in the 
    *                search bar. It is responsible for clearing the 
    *                search text and dismissing the keyboard when 
    *                clicked.
    * - Note: We can also use self.hideKeyboard()
    * - Remark: Clears the search field, hides the clear button, ends text focus, and forwards the callback
    * - Fixme: ⚠️️ Move the onClear to a method? or better move it to a modifier, see pin for how, hold off on that, still relevant?
    * - Fixme: ⚠️️ Or make a binding to searchMode, wait until things are more settled, transfer code from legacy etc
    * - Fixme: ⚠️️ Use accessId? there is a ZStack in the style, or does it work as is?
    * - Fixme: ⚠️️ Move accessibilityIdentifier to a const?
    * - Fixme: ⚠️️ move iconSize to contst
    */
   fileprivate var clearButton: some View {
      @ViewBuilder var view: some View {
         if textFieldIsFocused {
            Button(action: handleClearButtonPress) {}
               .clearButtonStyle
               .padding(SearchBar.searchbarSizing.clearButtonPadding)
            // .opacity(textFieldIsFocused ? 1 : 0) // Hides shows clear button
               .accessibilityIdentifier("searchClearButton")
               #if DEBUG
               .background(isDebuggingSearchBar ? .purple : .clear)
               #endif
         } else { // ghost graphics, to avoid collapsing into the void space when not shown
            Rectangle()
               .fill(Color.clear)
               .frame(
                  width: 12 + SearchBar.searchbarSizing.clearButtonPadding, // 12 equals icon size
                  height: 12 + SearchBar.searchbarSizing.clearButtonPadding
               )
               #if DEBUG
               .background(isDebuggingSearchBar ? .teal : .clear)
               #endif
               .padding(SearchBar.searchbarSizing.clearButtonPadding)
               #if DEBUG
               .background(isDebuggingSearchBar ? .indigo : .clear)
               #endif
         }
      }
      return view
         .getHeight { height in
            if isPrintingSearchBar {
               print("clearButton height: \(height)")
            }
         }
   }
}
