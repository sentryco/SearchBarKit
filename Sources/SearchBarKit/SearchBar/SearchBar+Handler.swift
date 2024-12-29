import SwiftUI
/**
 * handler
 */
extension SearchBar {
   /**
    * Handles the action when the clear button is pressed on the search bar.
    * - Description: This method is triggered when the clear button is pressed. It clears the search text,
    *                dismisses the keyboard, and notifies that the search bar has lost focus.
    */
   public func handleClearButtonPress() {
      searchText = "" // Clears search
      onFocus(false) // Dismiss focus
      textFieldIsFocused = false // Dismiss keyboard etc
   }
}
