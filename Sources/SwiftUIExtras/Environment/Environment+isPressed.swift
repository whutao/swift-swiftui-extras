import SwiftUI

extension EnvironmentValues {
    
    private enum IsPressedKey: EnvironmentKey {
        static let defaultValue: Bool = false
    }
    
    /// A Boolean value that indicates whether
    /// the view associated with this environment is in the pressed state.
    ///
    /// The default value is false.
    public var isPressed: Bool {
        get { self[IsPressedKey.self] }
        set { self[IsPressedKey.self] = newValue }
    }
}

extension View {
    
    /// Sets the `isPressed` environment value.
    @inlinable
    @inline(__always)
    public func isPressed(_ isPressed: Bool) -> some View {
        environment(\.isPressed, isPressed)
    }
}
