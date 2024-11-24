import SwiftUI
import HybridColor
/**
 * Preview
 * - Description: This section provides a preview of the SearchBar 
 *                component. It sets up a SearchBar with placeholder 
 *                text, focus handling, and text change handling. The 
 *                SearchBar is displayed in a dark color scheme and its 
 *                layout varies depending on the device type (mac, pad, 
 *                or phone).
 * - Note: We keep this in interfacelib since AF-extension and APP uses it
 * - Fixme: ⚠️️ Add debug view with state etc? 👈 yes please
 * - Fixme: ⚠️️ Add clause for iPad preview
 * - Fixme: ⚠️️ Figure put the preview focus hover issue only on iPad etc, Might go away in simulator? double check this when we setup UITests for ipad etc
 * - Fixme: ⚠️️ Move the Search... to const, still relevant?
 * - Fixme: ⚠️️ Add the focus feature to this preview, a temp solution is in now
 * - Fixme: ⚠️️ clean up dead code
 */
#Preview(traits: .fixedLayout(width: 400, height: 400)) {
   struct DebugView: View {
//      @FocusState private var isFocused: Bool
      var body: some View {
//         let _ = {
//            self.isFocused = true
//         }()
         SearchBar(
            placeholderText: "Search...", // Placeholder text displayed in the SearchBar when no text is entered.
            onFocus: { (_ isFocused: Bool) in // Callback function triggered when the SearchBar gains or loses focus.
               Swift.print("isFocused: \(isFocused)")
            },
            onTextChange: { text in // Handles text changes in the SearchBar, printing the new text to the console.
               Swift.print("text: \(text)")
            },
            textFieldShouldFocusOnInit: false,
            searchText: "Adobe"
         )
      }
   }
//   let previewContainer = PreviewContainer {
   let previewContainer = DebugView()
         .padding()
         .background(Color.blackOrWhite) // .background(Color.tertiaryBackground)
         #if os(macOS)
         .padding(.horizontal)
         #endif // .contentInsetAdjustmentBehavior = .never
//   }
   // .environment(\.colorScheme, .dark) // return previewContainer
   if isPadDevice { // iPad
      return previewContainer
         .frame(maxWidth: 400, maxHeight: 400) // .ignoresSafeArea(.keyboard, edges: .bottom)  // .edgesIgnoringSafeArea(.all)
   } else { // mac or iphone
      return previewContainer
   }
}
