import SwiftUI

/// A view that initializes a state value and passes a binding to that value into its content.
///
/// `WithInitialValue` wraps an internal state and provides a binding to that state
/// to a content closure. This allows the view hierarchy to both read and update the state value.
///
/// Use this view to encapsulate stateful logic when the initial value is known and you wish to
/// pass its binding into child views.
public struct WithInitialValue<Value, Content: View>: View {
    
    @State
    private var value: Value
    
    private let content: (Binding<Value>) -> Content
    
    /// Creates an instance of `WithInitialValue`.
    public init(
        value: Value,
        @ViewBuilder content: @escaping (Binding<Value>) -> Content
    ) {
        self._value = State(initialValue: value)
        self.content = content
    }
    
    public var body: some View {
        content($value)
    }
}
