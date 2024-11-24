import SwiftUI
/**
 * - Description: A text field style tailored for search 
 *                functionality, featuring a clear visual 
 *                distinction when focused, and a rounded 
 *                background that fits seamlessly within a 
 *                search bar design.
 * - Note: Used in SearchBar
 * - Fixme: ⚠️️ Tweak the corner radius somewhat
 */
fileprivate struct SearchTextFieldStyle: TextFieldStyle {
   /**
    * - Fixme: ⚠️️ This can probably just be a bool, as we dont set anything in this scope
    */
   fileprivate var isFocused: FocusState<Bool>.Binding
   /**
    * - Description: Constructs the visual representation of 
    *                the text field, applying custom styling 
    *                and layout modifications.
    * - Fixme: ⚠️️ We can probably reuse, some general RoundedTextField style etc, see: RoundedBorderTextFieldStyle
    * - Fixme: ⚠️️ Make text color more prominent when focused
    */
   fileprivate func _body(configuration: TextField<Self._Label>) -> some View {
      let _ = {
         Swift.print("isFocused:  \(isFocused.wrappedValue)")
      }()
      configuration
         #if os(macOS)
         .textFieldStyle(.plain) // ⚠️️ Removes the default macOS styling from a TextField, this will remove all styling, including padding and background color. You may need to add additional modifiers to achieve the desired look.
         #endif
         .vanillaTextFieldStyle // Adds the modifiers that disable some default keyboard things we don't need, see password input field etc
         .font(.title3) // Sets the font style to title3 (similar to .label)
         .focused(isFocused) // - Fixme: ⚠️️ doc this line
      // - Fixme: ⚠️️ put the color into a const etc
         .foregroundColor(SearchBar.searchBarTheme.textColor) // font color
      // - Fixme: ⚠️️ move to const
         .padding(.vertical, SearchBar.searchbarSizing.verticalPadding) // Applies padding to the text field with half of the default padding vertically and the default margin horizontally.
         .padding(.horizontal, (SearchBar.searchbarSizing.horizontalPadding + (12 * 2))) // offset for left and right icons in seachbar
         .background(
            backgroundView
         )
   }
}
/**
 * Component
 */
extension SearchTextFieldStyle {
   /**
    * Creates background view for the `SearchBar`
    * - Remark: Represents the background for the input-text-field (has rounded corners etc)
    */
   fileprivate var backgroundView: some View {
      let style: SearchBar.Style = SearchBar.getStyle(isFocused: isFocused.wrappedValue)
      // - Fixme: ⚠️️ move to const
      return RoundedRectangle(cornerRadius: 10) // Creates a rounded rectangle with a corner radius of 12 to be used as an overlay.
      /*Color.gray*/
         .stroke(style.borderColor, lineWidth: style.borderWidth) // Strokes the border of the rounded rectangle with a gray color and a line width of 1.0.
         .fill(style.backgroundColor)
   }
}
/**
 * Convenient
 */
extension TextField {
   /**
    * Applies the search text field style to a TextField.
    * - Parameter isFocused: A binding to a Boolean value that indicates whether the text field is currently focused.
    * - Returns: A view modifier that applies the search text field style to the TextField.
    */
   internal func searchTextFieldStyle(isFocused: FocusState<Bool>.Binding) -> some View {
      let _ = {
         Swift.print("searchTextFieldStyle - isFocused:  \(isFocused.wrappedValue)")
      }()
      let textFieldStyle = SearchTextFieldStyle(
         isFocused: isFocused // - Fixme: ⚠️️ doc this line
      )
      return self.textFieldStyle(textFieldStyle)
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 340, height: 300)) {
   struct DebugView: View {
      @FocusState var textFieldIsFocused: Bool
      @State var text = "Hello world"
      var body: some View {
         TextField("test-text-field", text: $text)
            .searchTextFieldStyle(isFocused: $textFieldIsFocused)
            .padding()
            .background(Color.blackOrWhite.opacity(1))
            #if os(macOS)
            .padding(.horizontal)
            #endif
            .onChange(of: text) { _, _ in
               Swift.print("text:  \(text)")
            }
            .onChange(of: textFieldIsFocused) { _, _ in
               Swift.print("textFieldIsFocused:  \($textFieldIsFocused.wrappedValue)")
            }
      }
   }
   return PreviewContainer {
      DebugView()
   }
}
