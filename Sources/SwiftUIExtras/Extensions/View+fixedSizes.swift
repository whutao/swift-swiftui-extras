import SwiftUI

extension View {
    
    /// Constrains the view's width to its ideal size while allowing the height to grow or shrink to fit its container.
    @inlinable
    public func fixedWidth() -> some View {
        fixedSize(horizontal: true, vertical: false)
    }
    
    /// Constrains the view's height to its ideal size while allowing the width to grow or shrink to fit its container.
    @inlinable
    public func fixedHeight() -> some View {
        fixedSize(horizontal: false, vertical: true)
    }
}
