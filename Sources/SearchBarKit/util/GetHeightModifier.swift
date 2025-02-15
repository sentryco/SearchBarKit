import SwiftUI

extension View {
   /**
    * - Fixme: ⚠️️ add doc
    */
   internal func getHeight(height: Binding<CGFloat>) -> some View {
      getHeightValue { (_ heightValue: CGFloat) in
         height.wrappedValue = heightValue
      }
   }
   /**
    * - Fixme: ⚠️️ add doc
    */
   internal func getHeightValue(callBack: @escaping (_ height: CGFloat) -> Void) -> some View {
      self.background(
         GeometryReader { (_ geo: GeometryProxy) -> Color in
            DispatchQueue.main.async {
               callBack(geo.size.height)
            }
            return Color.clear
         }
      )
   }
}
