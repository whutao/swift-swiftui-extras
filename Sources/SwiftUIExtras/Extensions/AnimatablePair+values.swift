import SwiftUI

extension AnimatablePair {
    
    /// The values as a tuple.
    public var values: (first: First, second: Second) {
        get { (first, second) }
        set {
            first = newValue.first
            second = newValue.second
        }
    }
}
