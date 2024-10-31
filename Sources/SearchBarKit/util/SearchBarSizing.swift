import Foundation
/**
 * - Fixme: ⚠️️ add doc
 */
public struct SearchBarSizing {
   /**
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ rename to textHor...
    */
   let horizontalPadding: CGFloat
   /**
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ rename to textVer...
    */
   let verticalPadding: CGFloat
   /**
    * - Fixme: ⚠️️ add doc
    */
   let leftIconHorizontalPadding: CGFloat
   /**
    * - Fixme: ⚠️️ add doc
    */
   let clearButtonPadding: CGFloat
   // - Fixme: ⚠️️ add public init etc
}
/**
 * - Fixme: ⚠️️ add doc
 */
extension SearchBarSizing {
   /**
    * - Fixme: ⚠️️ add doc
    */
   public static var defaultSizing: SearchBarSizing {
      .init(
         horizontalPadding: 12,
         verticalPadding: 10,
         leftIconHorizontalPadding: 12,
         clearButtonPadding: 12
      )
   }
}
