import Foundation
#if os(iOS)
import UIKit
#endif
/**
 * Is or isn't iPad
 * - Description: This variable checks if the current device is an iPad. It returns true if the device is an iPad, and false otherwise. This is useful for adjusting UI or functionality based on the device type.
 */
public var isPadDevice: Bool {
   #if os(iOS) // Check if the target platform is iOS
   return UIDevice.current.userInterfaceIdiom == .pad// Return true if the device is an iPad
   #elseif os(macOS) // Check if the target platform is macOS
   return false // Return false as macOS is not an iPad
   #endif
}

