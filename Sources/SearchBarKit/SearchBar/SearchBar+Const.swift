import SwiftUI
import HybridColor
/**
 * Const
 * - Fixme: ⚠️️ deprecate these and use bindings and the @Focused prop etc? maybe later when we add code from legacy etc, this needs exploration before executing on it etc do some validating
 */
extension SearchBar {
   /**
    * Closure called when the text in the search bar changes.
    * - Description: This closure is invoked when the text in the search bar changes. It allows the parent view to react and handle the updated search text in real-time.
    * - Parameters:
    *   - text: The new text in the search bar.
    */
   public typealias OnTextChange = (_ text: String) -> Void
   /**
    * Default closure for OnTextChange.
    */
   public static let defaultOnTextChange: OnTextChange = { (_ text: String) in Swift.print("on text change: \(text)") }
   /**
    * Closure called when the search bar gains or loses focus.
    * - Description: This closure is invoked when the search bar gains or loses focus. It allows the parent view to react and handle the focus state changes in real-time.
    * - Parameters:
    *   - isFocused: A boolean indicating whether the search bar is now focused.
    */
   public typealias OnFocus = (_ isFocused: Bool) -> Void
   /**
    * Default closure for OnFocus.
    */
   public static let defaultOnFocus: OnFocus = { (_ isFocused: Bool) in Swift.print("isfocused: \(isFocused)") }
   /**
    * - Fixme: ⚠️️ move to somewhere else
    */
   public static let iconColor: Color = {
      .init(
         light: Color(hex: 0x222222) // The background color for light mode
            .opacity(0.6),
         dark: Color(hex: 0xC5C5C5) // The background color for dark mode
            .opacity(0.6)
      )
   }()
   /**
    * - Fixme: ⚠️️ move somewhere else
    */
   public static let textColor: Color = { // Secondary label color
      #if os(macOS)
      return Color(NSColor.secondaryLabelColor)
      #elseif os(iOS)
      return Color(UIColor.secondaryLabel)
      #endif
   }()
   /**
    * Active
    */
   public static let activeBG: Color = {
      let light = Color.white //.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) // - Fixme: ⚠️️ describe the setup of this color?
      #if os(iOS)
      let dark = Color.darkGray.opacity(0.5)
      #elseif os(macOS)
      let dark: Color = .init(
         nsColor: NSColor._darkGray.lighter(amount: 0.4)
      ).opacity(0.5)
      #endif
      return .init(
         light: light.darker(amount: 0.14),
         dark: dark
      )
   }()
   /**
    * Active Border Color
    * This color is used for the border of active elements in the interface, providing a visual cue to the user.
    */
   public static let activeBorder: Color = {
      .init(
         light: Color.black.opacity(0.6),
         dark: Color.white.opacity(0.6)
      )
   }()
   /**
    * Idle
    * - Note: Alt name: `inActiveBG`
    */
   public static let background: Color = {
      let light = Color.white // .init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) // - Fixme: ⚠️️ describe the setup of this color?
      #if os(iOS)
      let dark = Color.darkGray.opacity(0.3)
      #elseif os(macOS)
      let dark: Color = .init(
         nsColor: NSColor._darkGray.lighter(amount: 0.1)
      ).opacity(0.5)
      #endif
      return .init(
         light: light.darker(amount: 0.08),
         dark: dark
      )
   }()
   /**
    * Border
    */
   public static let borderColor: Color = {
      let light: Color = {
         #if os(iOS)
         Color.darkGray.opacity(1)
         #elseif os(macOS)
         tertiary/*Palette.Background.tertiary*/
         #endif
      }()
      let dark: Color = {
         #if os(iOS)
         Color.lightGray.opacity(0.6)
         #elseif os(macOS)
         quaternary/*Palette.Background.quaternary*/
         #endif
      }()
      return .init(light: light, dark: dark)
   }()
   // tertiary
   public static let tertiary: Color = .init(
      light: .init(uiColor: UIColor.lightGray.lighter(amount: 0.4)), // The tertiary color for light mode
      dark: .init(uiColor: #colorLiteral(red: 0.08450166136, green: 0.08400709182, blue: 0.08488682657, alpha: 1)) // The tertiary color for dark mode (it's not pure black)
   )
   // quaternary
   public static let quaternary: Color = .init(
      light: .init(uiColor: #colorLiteral(red: 0.7583230138, green: 0.753816545, blue: 0.761787951, alpha: 1)), // The quaternary color for light mode
      dark: .init(uiColor: #colorLiteral(red: 0.168294251, green: 0.1673007905, blue: 0.1690624058, alpha: 1)) // The quaternary color for dark mode
   )
}
