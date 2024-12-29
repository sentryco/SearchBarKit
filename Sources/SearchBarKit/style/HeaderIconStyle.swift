import SwiftUI
import HybridColor
/**
 * Cirle stroke, with icon inside, fill behind
 * - Description: A button style that features a circular stroke with an icon in the center, 
 *                backed by a solid fill color. It is designed to be used for header icons
 *                such as back and more options, providing a clear and recognizable interactive element.
 * - Note: Used for back and more button in header and in onboarding
 * - Note: Alternative name: `HeaderIconButtonStyle`
 * - Fixme: ⚠️️ doc each variable
 * - Fixme: ⚠️️ break file into multiple files
 * ## Examples:
 * IconButtonStyle(strokeColor, backgroundColor, iconColor, size, iconSize)
 */
fileprivate struct HeaderIconStyle: ButtonStyle {
   /**
    * Icon name
    * - Description: The name of the icon to be displayed on the button.
    */
   fileprivate let iconName: String
   /**
    * Icon size
    * - Description: The size of the icon to be displayed on the button.
    */
   fileprivate let iconSize: CGFloat
   /**
    * Icon color
    * - Description: The color of the icon to be displayed on the button.
    */
   fileprivate let iconColor: Color
   /**
    * Background color
    * - Description: The background color of the button.
    */
   fileprivate let backgroundColor: Color
   /**
    * Stroke color
    * - Description: The color of the stroke around the icon.
    */
   fileprivate let strokeColor: Color
   /**
    * Stroke width
    * - Description: The width of the stroke around the icon.
    */
   fileprivate let strokeWidth: CGFloat
   /**
    * Padding
    * - Description: The padding around the button.
    */
   fileprivate let padding: CGFloat
   /**
    * body
    */
   fileprivate func makeBody(configuration: Configuration) -> some View {
      configuration.label // The label of the button
         .headerIconViewModifier( // Applies the headerIconViewModifier to the label
            iconName: iconName, // The name of the icon to be displayed on the button
            iconSize: iconSize, // The size of the icon to be displayed on the button
            padding: padding, // The padding around the button
            iconColor: iconColor, // The color of the icon to be displayed on the button
            backgroundColor: backgroundColor, // The background color of the button
            strokeColor: strokeColor, // The color of the stroke around the icon
            strokeWidth: strokeWidth // The width of the stroke around the icon
         )
   }
}
extension HeaderIconStyle {
   /**
    * Provides a default style configuration for header icons used in buttons.
    * - Description: This style configuration includes default values for icon name, size, color, background color, stroke color, stroke width, and padding. It is used to style header icons consistently across the application.
    */
   static var defaultButtonStyle: HeaderIconStyle {
      .init(
         iconName: "heart",
         iconSize: 16,
         iconColor: Color.whiteOrBlack,
         backgroundColor: Color(light: .lightGray, dark: .darkGray).opacity(0.2),
         strokeColor: Color.whiteOrBlack.opacity(0.5),
         strokeWidth: 1,
         padding: 16
      )
   }
}
/**
 * - Note: Add extension `ButtonStyle where Self == HeaderIconStyle` 
 *         later if we need to store the style for switching etc
 */
extension Button {
   /**
    * Applies the `HeaderIconStyle` to a button.
    * - Description: This method modifies a button by applying the `HeaderIconStyle`, which includes customizations for the icon's appearance and the button's overall style. It sets the icon name, size, color, background color, stroke color, stroke width, and padding according to the style's properties.
    * - Fixme: ⚠️️ Move iconName, iconSize to const
    * - Fixme: ⚠️️ Also pull colors from pallet later etc
    */
   internal var clearButtonStyle: some View {
      let buttonStyle: HeaderIconStyle = .init( // Applies the header icon style to the button.
         iconName: "xmark",
         // - Fixme: ⚠️️ Add to const?
         iconSize: 12, // ⚠️️ Was 10
         iconColor: SearchBar.searchBarTheme.textColor ,
         backgroundColor:  Color.whiteOrBlack.opacity(0.2),
         strokeColor: .gray.opacity(0.0),
         strokeWidth: 1,
         padding: SearchBar.searchbarSizing.clearButtonPadding
      )
      return self.buttonStyle(buttonStyle)
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 200, height: 200)) {
   PreviewContainer {
      Button(action: {}) {}
      .buttonStyle(
         HeaderIconStyle(
            iconName: "chevron.left",
            iconSize: 16,
            iconColor: Color.whiteOrBlack,
            backgroundColor: .gray.opacity(0.2),
            strokeColor: Color.whiteOrBlack.opacity(0.5),
            strokeWidth: 1,
            padding: 1
         )
      )
      .padding()
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
}
