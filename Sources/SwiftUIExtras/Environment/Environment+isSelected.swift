import SwiftUI

extension EnvironmentValues {
    
    private enum IsSelectedKey: EnvironmentKey {
        static let defaultValue: Bool = false
    }
    
    /// A Boolean value that indicates whether
    /// the view associated with this environment is in the selected state.
    ///
    /// The default value is false.
    public var isSelected: Bool {
        get { self[IsSelectedKey.self] }
        set { self[IsSelectedKey.self] = newValue }
    }
}

extension View {
    
    /// Sets the `isSelected` environment value.
    @inlinable
    public func isSelected(_ isSelected: Bool) -> some View {
        environment(\.isSelected, isSelected)
    }
}
