import Foundation
/**
 * Sizing configuration for the search bar.
 * - Description: This struct holds the sizing configuration for the search bar,
 *                which determines the dimensions and layout of the search bar.
 *                It can be customized to fit different design requirements.
 * - Fixme: ⚠️️ break file into multiple files 👈
 */
public struct SearchBarSizing {
   /**
    * Horizontal padding for the search bar.
    * - Description: This property determines the horizontal padding around the search bar,
    *                which affects the overall width of the search bar.
    * - Note: Alt name: `horizontalInnerPadding`
    */
   public let horizontalPadding: CGFloat
   /**
    * Vertical padding for the search bar.
    * - Description: This property determines the vertical padding around the search bar,
    *                which affects the overall height of the search bar.
    * - Note: Alt name: `verticalInnerPadding`
    */
   public let verticalPadding: CGFloat
   /**
    * Horizontal padding for the left icon.
    * - Description: This property determines the horizontal padding between the left icon and the search bar,
    *                which affects the overall width of the search bar.
    */
   public let leftIconHorizontalPadding: CGFloat
   /**
    * Padding for the clear button.
    * - Description: This property determines the padding around the clear button,
    *                which affects the overall width of the search bar.
    */
   public let clearButtonPadding: CGFloat
   /**
    * - Description: This struct encapsulates all padding-related configurations for various elements of the search bar,
    *                including horizontal and vertical padding for the search bar itself, padding for the left icon,
    *                and padding for the clear button. These configurations help in customizing the layout and spacing
    *                within the search bar to match design specifications.
    * fixme: add param doc
    */
   public init(
      horizontalPadding: CGFloat, 
      verticalPadding: CGFloat, 
      leftIconHorizontalPadding: CGFloat, 
      clearButtonPadding: CGFloat
   ) {
      self.horizontalPadding = horizontalPadding
      self.verticalPadding = verticalPadding
      self.leftIconHorizontalPadding = leftIconHorizontalPadding
      self.clearButtonPadding = clearButtonPadding
   }
}
