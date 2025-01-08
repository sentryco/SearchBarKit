import SwiftUI
/**
 * Default sizing configuration for the search bar.
 */
extension SearchBarSizing {
   /**
    * Default sizing configuration for the search bar.
    */
   public static var defaultSizing: SearchBarSizing {
      #if os(iOS)
      .init(
         horizontalPadding: .zero,
         verticalPadding: 10,
         leftIconHorizontalPadding: 12,
         clearButtonPadding: 12
      )
      #elseif os(macOS) // macOS needs a bit less spacing in the searchbar etc
      .init(
         horizontalPadding: .zero,
         verticalPadding: 8,
         leftIconHorizontalPadding: 10,
         clearButtonPadding: 10
      )
      #endif
   }
   var padding: EdgeInsets {
      // Applies padding to the text field with half of the default padding vertically and the default margin horizontally.
      let vertical: CGFloat = self.verticalPadding
      // offset for left and right icons in seachbar
      // - Fixme: ⚠️️ We can remove the extra padding by moving icon and clear btn into the same stack as textfield
      let horizontal: CGFloat = {
         self.horizontalPadding //+
         //         SearchBar.searchbarSizing.leftIconHorizontalPadding +
         //         SearchBar.searchbarSizing.clearButtonPadding
      }()
      return .init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
   }
}
