import SwiftUI
/**
 * handler
 */
extension SearchBar {
   /**
    * - Fixme: ⚠️️ add doc
    */
   public func handleClearButtonPress() {
      searchText = "" // Clears search
      onFocus(false) // Dismiss focus
      textFieldIsFocused = false // Dismiss keyboard etc
   }
}
