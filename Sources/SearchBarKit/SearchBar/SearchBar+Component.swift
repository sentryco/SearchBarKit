import SwiftUI
import HybridColor
/**
 * Components
 */
extension SearchBar {
   /**
    * Creates the icon (leftIcon)
    * - Fixme: ⚠️️ maybe also add focused and unfocused state for this? change the colors etc?
    * - Fixme: ⚠️️ Move icon to const
    */
   internal var leftIcon: some View {
      Image(optionalSystemName: "magnifyingglass")?
         .iconStyle(
            // - Fixme: ⚠️️ consider adding to const
            size: 18,
            padding: SearchBar.searchbarSizing.leftIconHorizontalPadding/*Measure.defaultMargin*/,
            color: SearchBar.searchBarTheme.iconColor/*Palette.Main.SearchBar.icon*/ // Color.whiteOrBlack.opacity(0.5)
         )
   }
   /**
    * searchTextField
    * - Description: This view represents the search text field in the search bar. It is responsible for displaying the search input and handling focus state changes.
    * - Note: the search_text_field is the accessibility id
    * - Note: The `focused` modifier is used to dynamically change the focus state of the text field based on the `textFieldIsFocused` state variable. This allows the text field to gain or lose focus programmatically, which is essential for managing the user's interaction with the search bar.
    * - Fixme: ⚠️️ Call methods with this, put the methods in +Action file etc
    * - Fixme: ⚠️️ Move logic into modifiers, see `PinCode`, how it's done there etc? 👈 can searchbar be a style or a modifier etc?
    * - Fixme: ⚠️️ Take a look at the new `focusEffectDisabled`: https://stackoverflow.com/a/77681648/5389500 and https://stackoverflow.com/a/60286113/5389500
    * - Fixme: ⚠️️ move the placeholder color to pallet
    * - Fixme: ⚠️️ remove the TextField id. we set the real id later? make sure UITests keep running etc
    */
   internal var searchTextField: some View {
      let placeholderTxt: Text = {
         let color: Color = .init(light: .gray, dark: .gray).opacity(0.8)
         return Text(placeholderText) // Customize placeholder text color
            .foregroundStyle(color)
      }()
      return TextField(
         "searchTextField"/*InterfaceID.searchTextField*/, /*"search_text_field"*/ // Sets the accessibility identifier for the text field
         text: $searchText, // Binds the text field to the searchText state
         prompt: placeholderTxt // Sets the placeholder text for the text field
      )
      .searchTextFieldStyle(isFocused: $textFieldIsFocused) // Applies the search text field style
      .accessibilityIdentifier("searchTextField")
      // .accessIdentifier(InterfaceID.searchTextField) // Sets the accessibility identifier for the text field
      .focused($textFieldIsFocused) // Sets the focus state of the text field
      .onChange(of: textFieldIsFocused) { _, _ in // Listens for changes in textFieldIsFocused
         onFocus(textFieldIsFocused) // Calls the onFocus callback with the updated focus state
      }
   }
   /**
    * Creates the "clear-text-btn"
    * - Description: This view represents the clear button in the search bar. It is responsible for clearing the search text and dismissing the keyboard when clicked.
    * - Note: We can also use self.hideKeyboard()
    * - Remark: Clears the search field, hides the clear button, ends text focus, and forwards the callback
    * - Fixme: ⚠️️⚠️️ Make ClearButton style 👈👈 Ask CoPilot to make a draft
    * - Fixme: ⚠️️ Move the onClear to a method? or better move it to a modifier, see pin for how, hold off on that, still relevant?
    * - Fixme: ⚠️️ Or make a binding to searchMode 👈👈 wait until things are more settled, transfer code from legacy etc
    * - Fixme: ⚠️️ move iconName, iconSize to const
    * - Fixme: ⚠️️ also pull colors from pallet later etc
    * - Fixme: ⚠️️ use accessId? there is a ZStack in the style
    */
   internal var clearButton: some View {
      Button(action: {
         searchText = "" // Clears search
         onFocus(false) // Dismiss focus
         textFieldIsFocused = false // dismiss keyboard etc
      }) {
      }
      .headerIconStyle( // Applies the header icon style to the button.
         iconName: "xmark", // Sets the icon name to "xmark"
         // - Fixme: ⚠️️ add to const?
         iconSize: 10, // Sets the icon size to 10
         // - Fixme: ⚠️️ move bellow to const
         padding: SearchBar.searchbarSizing.clearButtonPadding /*Measure.defaultMargin*/, // Applies default margin padding
         iconColor: SearchBar.searchBarTheme.textColor/*Palette.Main.SearchBar.textColor*/ /*Color.whiteOrBlack.opacity(0.5)*/, // Sets icon color to white or black with 50% opacity
         backgroundColor: Color.whiteOrBlack.opacity(0.2), // Sets background color to white or black with 20% opacity
         strokeColor: .gray.opacity(0.0) // Sets stroke color to gray with 0% opacity
      )
      .padding(SearchBar.searchbarSizing.clearButtonPadding/*Measure.defaultMargin*/)
      .opacity(textFieldIsFocused ? 1 : 0) // hides shows clear button
      // - Fixme: ⚠️️ move bellow to a const
      .accessibilityIdentifier("searchClearButton")
      // .accessIdentifier(InterfaceID.searchClearButton)
   }
}
