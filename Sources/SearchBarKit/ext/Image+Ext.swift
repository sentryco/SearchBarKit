import SwiftUI
import HybridColor
/**
 * This extension provides utility functions for handling SwiftUI Images, including applying icon styles and initializing images from optional system names.
 */
extension Image {
   /**
    * The aligned icon
    * - Description: This function applies a style to the image, resizing it to the specified size, adding padding, and setting the color.
    * - Fixme: ⚠️️ more advance modifier for images: https://stackoverflow.com/a/59534345/5389500
    * - Fixme: ⚠️️ might be able to use that link for Text modifiers sa well?
    * - Fixme: ⚠️️ make padding edge-inset?
    * - Parameters:
    *   - size: The size to resize the image to.
    *   - padding: The amount of padding to add around the image.
    *   - color: The color to set the image to.
    * - Returns: The styled image.
    */
   internal func iconStyle(size: CGFloat, padding: CGFloat, color: Color = Color.whiteOrBlack.opacity(0.8)) -> some View {
      self
         .resizable() // Make the image resizable
         .aspectRatio(contentMode: .fit)  // Set the aspect ratio of the image to fit (// .fill .scaledToFit())
         .frame(width: size, height: size) // Set the frame size of the image
         .padding(.horizontal, padding) // Add horizontal padding to the image
         .foregroundColor(color) // Set the color of the image
   }
}
/**
 * Init or nothing
 */
extension Image {
   /**
    * Adds support for optionally creating an image
    * - Description: This initializer creates an image from an optional system name, or returns nil if the system name is nil.
    * ## Examples:
    * Image(optionalSystemName: leadingImageName)?
    *   .iconStyle(size: 16, padding: 0)
    * - Parameter optionalSystemName: The optional system name of the image to be initialized.
    */
   internal init?(optionalSystemName: String?) {
      if let systemName: String = optionalSystemName {
         self.init(systemName: systemName)
      } else {
         return nil
      }
   }
}
/**
 * Preview
 * - Description: This section provides a preview of the image with the applied icon style. The image is displayed in a fixed layout with a size of 400x400. The image used for the preview is the system image named "heart". The icon style applied to the image includes a size of 16 and no padding. The image is further modified with additional padding and a background color that is either black or white, depending on the current color scheme.
 * - Fixme: ⚠️️ add support for relativly sized? later?
 */
#Preview(traits: .fixedLayout(width: 400, height: 400)) {
   PreviewContainer {
      Image(optionalSystemName: "heart")?
         .iconStyle(size: 16, padding: 0)
         .padding()
         .background(Color.blackOrWhite.opacity(1))
   }
}
