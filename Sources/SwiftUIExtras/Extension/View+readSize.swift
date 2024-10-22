import SwiftUI

extension View {
    
    /// Adds an action to perform when the size changes.
    @inlinable
    public func readSize(onChange action: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                DispatchQueue.main.async {
                    action(geometry.size)
                }
                return Color.clear
            }
        )
    }
}
