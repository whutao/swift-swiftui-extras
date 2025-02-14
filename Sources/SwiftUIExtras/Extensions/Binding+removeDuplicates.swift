import SwiftUI

extension Binding where Value: Sendable {
    
    /// Creates a binding that ignores writes to its wrapped value when equivalent to the new value.
    ///
    /// Useful to minimize writes to bindings passed to SwiftUI APIs. For example, [`NavigationLink`
    /// may write `nil` twice][FB9404926] when dismissing its destination via the navigation bar's
    /// back button. Logic attached to this dismissal will execute twice, which may not be desirable.
    ///
    /// [FB9404926]: https://gist.github.com/mbrandonw/70df235e42d505b3b1b9b7d0d006b049
    ///
    /// - Parameter isDuplicate: A closure to evaluate whether two elements are equivalent, for
    ///   purposes of filtering writes. Return `true` from this closure to indicate that the second
    ///   element is a duplicate of the first.
    @inlinable
    public func removeDuplicates(by isDuplicate: @escaping @Sendable (Value, Value) -> Bool) -> Self {
        return Binding(
            get: { wrappedValue },
            set: { newValue, transaction in
                if !isDuplicate(wrappedValue, newValue) {
                    self.transaction(transaction).wrappedValue = newValue
                }
            }
        )
    }
}

extension Binding where Value: Equatable & Sendable {
    
    /// Creates a binding that ignores writes to its wrapped value when equivalent to the new value.
    ///
    /// Useful to minimize writes to bindings passed to SwiftUI APIs. For example, [`NavigationLink`
    /// may write `nil` twice][FB9404926] when dismissing its destination via the navigation bar's
    /// back button. Logic attached to this dismissal will execute twice, which may not be desirable.
    ///
    /// [FB9404926]: https://gist.github.com/mbrandonw/70df235e42d505b3b1b9b7d0d006b049
    @inlinable
    @preconcurrency
    public func removeDuplicates() -> Self {
        return removeDuplicates(by: { $0 == $1 })
    }
}
