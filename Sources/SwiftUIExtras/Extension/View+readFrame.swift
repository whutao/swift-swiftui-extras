import SwiftUI

extension View {
    
    /// Adds an action to perform when the frame changes in the specified coordinate space.
    @inlinable
    public func readFrame(
        in coordinateSpace: CoordinateSpaceProtocol,
        onChange action: @escaping (CGRect) -> ()
    ) -> some View {
        background(
            GeometryReader { geometry in
                DispatchQueue.main.async {
                    action(geometry.frame(in: coordinateSpace))
                }
                return Color.clear
            }
        )
    }
}
