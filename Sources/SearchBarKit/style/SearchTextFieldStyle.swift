import SwiftUI
/**
 * - Description: A text field style tailored for search 
 *                functionality, featuring a clear visual 
 *                distinction when focused, and a rounded 
 *                background that fits seamlessly within a 
 *                search bar design.
 * - Note: Used in SearchBar
 * - Fixme: ⚠️️ Tweak the corner radius somewhat
 * - Fixme: ⚠️️ Break file into multiple files
 */
fileprivate struct SearchTextFieldStyle: TextFieldStyle {
   /**
    * - Fixme: ⚠️️ This can probably just be a bool, as we don't set anything in this scope
    */
   fileprivate var isFocused: FocusState<Bool>.Binding
   /**
    * - Description: Indicates whether the text field is currently focused, affecting the visual style and behavior.
    * - Fixme: ⚠️️ rename to innerPadding
    */
   fileprivate var padding: EdgeInsets
   /**
    * - Description: Constructs the visual representation of 
    *                the text field, applying custom styling 
    *                and layout modifications.
    * - Fixme: ⚠️️ We can probably reuse, some general RoundedTextField style etc, see: RoundedBorderTextFieldStyle
    * - Fixme: ⚠️️ Make text color more prominent when focused
    * - Parameter configuration: The TextField configuration that defines the text field's appearance and interaction.
    * - Returns: A view representing the styled text field.
    */
   fileprivate func _body(configuration: TextField<Self._Label>) -> some View {
      configuration
         #if os(macOS)
         .textFieldStyle(.plain) // ⚠️️ Removes the default macOS styling from a TextField, this will remove all styling, including padding and background color. You may need to add additional modifiers to achieve the desired look.
         #endif
         .focused(isFocused) // Binds the text field's focus state to the provided FocusState binding, allowing programmatic control of focus
         .vanillaTextFieldStyle // Adds the modifiers that disable some default keyboard things we don't need, see password input field etc
         .font(.title3) // Sets the font style to title3 (similar to .label)
         .foregroundColor(SearchBar.searchBarTheme.textColor) // font color
         #if DEBUG
         .background(isDebuggingSearchBar ? .purple : .clear)
         #endif
         .padding(padding) // Inner padding
         #if DEBUG
         .background(isDebuggingSearchBar ? .pink : .clear)
         #endif
   }
}

/**
 * Convenient
 */
extension TextField {
   /**
    * Provides the default inner padding for a TextField within the search bar.
    * This padding is calculated based on the vertical padding and horizontal padding
    * defined in the SearchBar's sizing configuration. It ensures that the text field
    * has balanced padding around the text, accommodating any icons or buttons aligned
    * with it.
    */
   public static var defaultInnerPadding: EdgeInsets {
      // Applies padding to the text field with half of the default padding vertically and the default margin horizontally.
      let vertical: CGFloat = SearchBar.searchbarSizing.verticalPadding
      // offset for left and right icons in seachbar
      // - Fixme: ⚠️️ We can remove the extra padding by moving icon and clear btn into the same stack as textfield
      let horizontal: CGFloat = {
         SearchBar.searchbarSizing.horizontalPadding //+
//         SearchBar.searchbarSizing.leftIconHorizontalPadding +
//         SearchBar.searchbarSizing.clearButtonPadding
      }()
      return .init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
   }
   /**
    * Applies the search text field style to a TextField.
    * - Fixme: ⚠️️ rename padding to innerPadding?
    * - Parameter isFocused: A binding to a Boolean value that indicates whether the text field is currently focused.
    * - Parameter padding: The padding to apply around the text field, specified as an EdgeInsets.
    * - Returns: A view modifier that applies the search text field style to the TextField.
    */
   internal func searchTextFieldStyle(isFocused: FocusState<Bool>.Binding, padding: EdgeInsets = defaultInnerPadding) -> some View {
      let textFieldStyle = SearchTextFieldStyle(
         isFocused: isFocused, // Binds the focus state of the text field to the provided FocusState binding.
         padding: padding // Binding that controls and tracks the focus state of the text field
      )
      return self.textFieldStyle(textFieldStyle)
   }
}
/**
 * Preview
 * - Fixme: ⚠️️ use @Previewable here instead of bouilerplate debugview code
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
