import SwiftUI

struct HeightMeasuringModifier: ViewModifier {
   let callback: (CGFloat) -> Void
   func body(content: Content) -> some View {
      content
         .background(
            GeometryReader { geometry -> Color in
               DispatchQueue.main.async {
                  callback(geometry.size.height)
               }
               return Color.clear
            }
         )
   }
}
extension View {
   func getHeight(_ callback: @escaping (CGFloat) -> Void) -> some View {
      self.modifier(HeightMeasuringModifier(callback: callback))
   }
}
#Preview {
   Text("Measure my height")
      .padding()
      .background(Color.yellow)
      .getHeight { height in
         print("The height of the view is: \(height)")
      }
}
