import SwiftUI
/**
 * Style
 */
extension SearchBar {
   /**
    * Defines the style for the search bar.
    * - Description: This typealias defines a style for the SearchBar. It includes properties for the background color, border color, and border width of the SearchBar.
    * - Remark: Represents the background color, border color, and border width for the search bar button.
    * - Fixme: ⚠️️⚠️️⚠️️ Consider using a struct instead of a typealias for better readability and maintainability.
    */
   typealias Style = (
      backgroundColor: Color, // The background color of the search bar.
      borderColor: Color, // The border color of the search bar.
      borderWidth: CGFloat // The width of the search bar border.
   )
   /**
    * Style for the SearchBar
    * - Description: This function returns the style for the SearchBar based on its focus state. If the SearchBar is focused, it returns the active background style; otherwise, it returns the default background style.
    * - Remark: Defines the background color, border color, and border width for the search bar.
    * - Fixme: ⚠️️ move this call into the scope of SearchBar.Style ?
    */
   static func getStyle(isFocused: Bool) -> SearchBar.Style {
      isFocused ? activeBGStyle : inActiveBGStyle
   }
}
/**
 * Styles
 */
extension SearchBar {
   /**
    * The style for the background view of the `SearchBarView`
    * - Description: This style is applied to the search bar when it is not focused, providing a default visual appearance with a specified background color, border color, and border width.
    * - Note: the borderwidth of 0.5 makes it look sharper than 1.0
    * - Remark: Represents the style for the background of the input-text-field (has rounded corners etc)
    */
   fileprivate static let inActiveBGStyle: SearchBar.Style = {
      (
         backgroundColor: background/*Palette.Main.SearchBar.background*/, // The background color of the search bar.
         borderColor: borderColor/*Palette.Main.SearchBar.borderColor*/, // The border color of the search bar.
         borderWidth: 0.5 // The width of the border of the search bar.
         // cornerRadius: SearchBarView.height / 6 // The corner radius of the search bar.
      )
   }()
   /**
    * The active style for the background view of the `SearchBarView`
    * - Description: This style is applied to the search bar when it is focused, providing a visual indication of its active state with a specified background color, border color, and border width.
    * - Remark: Represents the active style for the background of the input-text-field (has rounded corners etc)
    */
   fileprivate static let activeBGStyle: SearchBar.Style = {
      (
         backgroundColor: activeBG/*Palette.Main.SearchBar.activeBG*/, // The background color of the search bar when active.
         borderColor: activeBorder/*Palette.Main.SearchBar.activeBorder*/, // The border color of the search bar.
         borderWidth: inActiveBGStyle.borderWidth // The width of the border of the search bar.
         // cornerRadius: backgroundStyle.cornerRadius // The corner radius of the search bar.
      )
   }()
}
