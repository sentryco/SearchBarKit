import SwiftUI
import HybridColor
/**
 * Content
 */
extension SearchBar {
   /**
    * Body
    * - Description: This view represents the body of the SearchBar, 
    *                containing the search text field and the clear 
    *                button.
    * - Note: We can also do this with rebinding: 
    *         https://stackoverflow.com/a/57875903/5389500
    * - Fixme: ⚠️️ We should probably just use a VStack where searchTextField expands to near the clearButton etc, try width: infinity etc
    * - Fixme: ⚠️️ Figure out a better way to do this without ZStack etc
    * - Fixme: ⚠️️ Move to stack var?
    */
   public var body: some View {
      ZStack { // Initializes a ZStack to layer the searchTextField and the HStack containing icons and clear button
         searchTextField // Displays the search text field
         HStack { // - Fixme: ⚠️️ Use .pinTo call, which one?
            leftIcon // Adds search icon to the left
            Spacer() // expand middle
            clearButton // Adds clearButton to the right
         }
      }
      .onChange(of: searchText) { // Listens for changes in searchText and calls onTextChange with the new text
         onTextChange(searchText) // Executes the onTextChange callback with the updated searchText
      }
   }
}
