import SwiftUI

extension EdgeInsets {
    
    /// The length of the horizontal insets as a sum of leading and trailing.
    @inlinable
    public var horizontal: CGFloat {
        return leading + trailing
    }
    
    /// The length of the vertical insets as a sum of top and bottom.
    @inlinable
    public var vertical: CGFloat {
        return top + bottom
    }
}
