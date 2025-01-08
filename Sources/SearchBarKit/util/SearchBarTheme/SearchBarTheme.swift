import SwiftUI
import HybridColor
/**
 * Theme configuration for the search bar.
 * - Description: This struct holds the theme configuration for the search bar,
 *                which determines the appearance and style of the search bar.
 *                It can be customized to fit different design requirements.
 * - Fixme: ⚠️️ Add placeholder text color?
 * - Fixme: ⚠️️ Break file into multiple files
 */
public struct SearchBarTheme {
   /**
    * The color of the icons within the search bar.
    */
   public let iconColor: Color
   /**
    * The color of the text within the search bar.
    */
   public let textColor: Color
   /**
    * The background color of the search bar when it is active.
    */
   public let activeBG: Color
   /**
    * The border color of the search bar when it is active.
    */
   public let activeBorder: Color
   /**
    * The general background color of the search bar.
    */
   public let background: Color
   /**
    * The color of the border around the search bar.
    */
   public let borderColor: Color
   /**
    * Initializes a new theme for the search bar with specified colors.
    * - Parameters:
    *   - iconColor: The color of the icons within the search bar.
    *   - textColor: The color of the text within the search bar.
    *   - activeBG: The background color of the search bar when it is active.
    *   - activeBorder: The border color of the search bar when it is active.
    *   - background: The general background color of the search bar.
    *   - borderColor: The color of the border around the search bar.
    */
   public init(iconColor: Color, textColor: Color, activeBG: Color, activeBorder: Color, background: Color, borderColor: Color) {
      self.iconColor = iconColor
      self.textColor = textColor
      self.activeBG = activeBG
      self.activeBorder = activeBorder
      self.background = background
      self.borderColor = borderColor
   }
}
