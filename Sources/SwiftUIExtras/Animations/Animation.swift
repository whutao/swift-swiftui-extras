import SwiftUI

extension Animation {
    
    /// A smooth spring animation with a predefined duration and no bounce.
    public static var smoothSpring: Animation {
        return smoothSpring()
    }
    
    /// A smooth spring animation with a predefined duration and no bounce that can be tuned.
    @inlinable
    public static func smoothSpring(duration: TimeInterval = 0.5) -> Animation {
        return .spring(response: duration, dampingFraction: 1, blendDuration: 0)
    }
}
