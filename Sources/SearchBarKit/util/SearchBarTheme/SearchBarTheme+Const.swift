import SwiftUI
import HybridColor
/**
 * Const
 */
extension SearchBarTheme {
   /**
    * Default theme configuration for the search bar.
    */
   public static var defaultTheme: SearchBarTheme {
      .init(iconColor: Self.iconColor,
            textColor: Self.textColor,
            activeBG: Self.activeBG,
            activeBorder: Self.activeBorder,
            background: Self.background,
            borderColor: Self.borderColor
      )
   }
}
/**
 * Defaults
 */
extension SearchBarTheme {
   /**
    * - Fixme: ⚠️️ move to somewhere else
    */
   fileprivate static let iconColor: Color = {
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
   fileprivate static let textColor: Color = { // Secondary label color
      #if os(macOS)
      return Color(NSColor.secondaryLabelColor)
      #elseif os(iOS)
      return Color(UIColor.secondaryLabel)
      #endif
   }()
   /**
    * Active
    */
   fileprivate static let activeBG: Color = {
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
    * - Description: This color is used for the border of
    *               active elements in the interface,
    *               providing a visual cue to the user.
    */
   fileprivate static let activeBorder: Color = {
      .init(
         light: Color.black.opacity(0.6),
         dark: Color.white.opacity(0.6)
      )
   }()
   /**
    * Idle
    * - Note: Alt name: `inActiveBG`
    */
   fileprivate static let background: Color = {
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
   fileprivate static let borderColor: Color = {
      let light: Color = {
         #if os(iOS)
         Color.darkGray.opacity(1)
         #elseif os(macOS)
         tertiary
         #endif
      }()
      let dark: Color = {
         #if os(iOS)
         Color.lightGray.opacity(0.6)
         #elseif os(macOS)
         quaternary
         #endif
      }()
      return .init(light: light, dark: dark)
   }()
   #if os(iOS)
   /**
    * tertiary
    */
   fileprivate static let tertiary: Color = .init(
      light: .init(uiColor: UIColor.lightGray.lighter(amount: 0.4)), // The tertiary color for light mode
      dark: .init(uiColor: #colorLiteral(red: 0.08450166136, green: 0.08400709182, blue: 0.08488682657, alpha: 1)) // The tertiary color for dark mode (it's not pure black)
   )
   /**
    * quaternary
    */
   fileprivate static let quaternary: Color = .init(
      light: .init(uiColor: #colorLiteral(red: 0.7583230138, green: 0.753816545, blue: 0.761787951, alpha: 1)), // The quaternary color for light mode
      dark: .init(uiColor: #colorLiteral(red: 0.168294251, green: 0.1673007905, blue: 0.1690624058, alpha: 1)) // The quaternary color for dark mode
   )
   #elseif os(macOS)
   // tertiary
   fileprivate static let tertiary: Color = .init(
      light: .init(nsColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), // The tertiary color for light mode
      dark: .init(nsColor: #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)) // The tertiary color for dark mode
   )
   fileprivate static let quaternary: Color = .init(
      light: .init(nsColor: #colorLiteral(red: 0.7583230138, green: 0.753816545, blue: 0.761787951, alpha: 1)), // The quaternary color for light mode
      dark: .init(nsColor: #colorLiteral(red: 0.168294251, green: 0.1673007905, blue: 0.1690624058, alpha: 1)) // The quaternary color for dark mode
   )
   #endif
}
