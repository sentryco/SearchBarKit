import Foundation
/**
 * Sizing configuration for the search bar.
 * - Description: This struct holds the sizing configuration for the search bar,
 *                which determines the dimensions and layout of the search bar.
 *                It can be customized to fit different design requirements.
 * - Fixme: ⚠️️ break file into multiple files
 */
public struct SearchBarSizing {
   /**
    * Horizontal padding for the search bar.
    * - Description: This property determines the horizontal padding around the search bar,
    *                which affects the overall width of the search bar.
    * - Fixme: ⚠️️ rename to textHor...
    * - Fixme: ⚠️️ rename to ...innerPadding?
    */
   let horizontalPadding: CGFloat
   /**
    * Vertical padding for the search bar.
    * - Description: This property determines the vertical padding around the search bar,
    *                which affects the overall height of the search bar.
    * - Fixme: ⚠️️ rename to textVer...
    * - Fixme: ⚠️️ rename to ...innerPadding?
    */
   let verticalPadding: CGFloat
   /**
    * Horizontal padding for the left icon.
    * - Description: This property determines the horizontal padding between the left icon and the search bar,
    *                which affects the overall width of the search bar.
    */
   let leftIconHorizontalPadding: CGFloat
   /**
    * Padding for the clear button.
    * - Description: This property determines the padding around the clear button,
    *                which affects the overall width of the search bar.
    */
   let clearButtonPadding: CGFloat
   /**
    * - Fixme: ⚠️️ Add doc
    */
   public init(horizontalPadding: CGFloat, verticalPadding: CGFloat, leftIconHorizontalPadding: CGFloat, clearButtonPadding: CGFloat) {
      self.horizontalPadding = horizontalPadding
      self.verticalPadding = verticalPadding
      self.leftIconHorizontalPadding = leftIconHorizontalPadding
      self.clearButtonPadding = clearButtonPadding
   }
}
/**
 * Default sizing configuration for the search bar.
 */
extension SearchBarSizing {
   /**
    * Default sizing configuration for the search bar.
    */
   public static var defaultSizing: SearchBarSizing {
      .init(
         horizontalPadding: .zero/*12*/,
         verticalPadding: 10,
         leftIconHorizontalPadding: 12,
         clearButtonPadding: 12
      )
   }
}
