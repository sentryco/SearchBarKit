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
    * - Fixme: ⚠️️ Take a look at the new `focusEffectDisabled`: https://stackoverflow.com/a/77681648/5389500 and https://stackoverflow.com/a/60286113/5389500
    * - Fixme: ⚠️️ Move the placeholder color to pallet 🏀
    * - Fixme: ⚠️️ Remove the TextField id. we set the real id later? make sure UITests keep running etc
    * - Fixme: ⚠️️ move foregroundStyle to ViewModififier that we apply to entire SearchBarView? decouled styling?
    * - Fixme: ⚠️️ does the placeholder text work? confirm this
    */
   internal var searchTextField: some View {
      let placeholderTxt: Text = {
         let color: Color = .init(light: .gray, dark: .gray).opacity(0.8)
         return Text(placeholderText) // Customize placeholder text color
            .foregroundStyle(color)
      }()
      return TextField(
         "searchTextField", // Sets the accessibility identifier for the text field
         text: $searchText, // Binds the text field to the searchText state
         prompt: placeholderTxt // Sets the placeholder text for the text field
      )
      .searchTextFieldStyle(isFocused: $textFieldIsFocused) // Applies the search text field style
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
    */
   internal var clearButton: some View {
      Button(action: {
         searchText = "" // Clears search
         onFocus(false) // Dismiss focus
         textFieldIsFocused = false // Dismiss keyboard etc
      }) {}
         .clearButtonStyle
      .padding(SearchBar.searchbarSizing.clearButtonPadding)
      .opacity(textFieldIsFocused ? 1 : 0) // Hides shows clear button
      .accessibilityIdentifier("searchClearButton")
   }
}
