import SwiftUI

extension View {
    
    /// Positions this view within a frame of the specified size and alignment.
    @inlinable
    @inline(__always)
    public func frame(size: CGSize?, alignment: Alignment = .center) -> some View {
        frame(width: size?.width, height: size?.height, alignment: alignment)
    }
    
    /// Sets this view's ideal frame size and alignment within its container.
    @inlinable
    @inline(__always)
    public func frame(idealSize: CGSize?, alignment: Alignment = .center) -> some View {
        frame(idealWidth: idealSize?.width, idealHeight: idealSize?.height, alignment: alignment)
    }
    
    /// Constrains this view's minimum frame size and alignment within its container.
    @inlinable
    @inline(__always)
    public func frame(minSize: CGSize?, alignment: Alignment = .center) -> some View {
        frame(minWidth: minSize?.width, minHeight: minSize?.height, alignment: alignment)
    }
    
    /// Constrains this view's maximum frame size and alignment within its container.
    @inlinable
    @inline(__always)
    public func frame(maxSize: CGSize?, alignment: Alignment = .center) -> some View {
        frame(maxWidth: maxSize?.width, maxHeight: maxSize?.height, alignment: alignment)
    }
    
    /// Constrains this view's minimum and maximum frame size with the specified alignment.
    @inlinable
    @inline(__always)
    public func frame(minSize: CGSize?, maxSize: CGSize?, alignment: Alignment = .center) -> some View {
        frame(
            minWidth: minSize?.width,
            maxWidth: maxSize?.width,
            minHeight: minSize?.height,
            maxHeight: maxSize?.height,
            alignment: alignment
        )
    }
}
