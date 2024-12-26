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
    */
   public var body: some View {
      stack
         #if DEBUG
         .background(isDebuggingSearchBar ? .blue : .clear)
         #endif
         .onChange(of: searchText) { // Listens for changes in searchText and calls onTextChange with the new text
            onTextChange(searchText) // Executes the onTextChange callback with the updated searchText
         }
         .task { // works as a onAppear (More modern async)
            // Use a slight delay to ensure the view is fully loaded
            if textFieldShouldFocusOnInit {
               try? await Task.sleep(for: .milliseconds(100))
               textFieldIsFocused = true
            }
         }
   }
}
// .onAppear {
//    if textFieldShouldFocusOnInit {
//       DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//          textFieldIsFocused = true
//       }
//    }
// }
