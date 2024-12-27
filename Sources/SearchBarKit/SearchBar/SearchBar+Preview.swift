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
   let searchbarSizing: SearchBarSizing = {
      .init(
         horizontalPadding: SearchBarSizing.defaultSizing.horizontalPadding,
         verticalPadding: SearchBarSizing.defaultSizing.verticalPadding,
         leftIconHorizontalPadding: SearchBarSizing.defaultSizing.leftIconHorizontalPadding,
         clearButtonPadding: SearchBarSizing.defaultSizing.clearButtonPadding
      )
   }()
   let searchbar: some View = SearchBar(
      placeholderText: "Search...", // Placeholder text displayed in the SearchBar when no text is entered.
      searchbarSizing: searchbarSizing,
      onFocus: { (_ isFocused: Bool) in // Callback function triggered when the SearchBar gains or loses focus.
         Swift.print("isFocused: \(isFocused)")
      },
      onTextChange: { text in // Handles text changes in the SearchBar, printing the new text to the console.
         Swift.print("text: \(text)")
      },
      textFieldShouldFocusOnInit: false,
      searchText: "" // "Adobe"
   )
      .padding() // Outer padding
      .background(
         Rectangle()
            .fill(Color.blackOrWhite)
            .overlay(Color.gray.opacity(0.15))
      ) // .background(Color.tertiaryBackground)
      #if os(macOS)
      .padding(.horizontal)
      #endif // .contentInsetAdjustmentBehavior = .never  
   if isPadDevice { // iPad
      return searchbar
         .frame(maxWidth: 400, maxHeight: 400) // .ignoresSafeArea(.keyboard, edges: .bottom)  // .edgesIgnoringSafeArea(.all)
   } else { // mac or iphone
      return searchbar
   }
}
