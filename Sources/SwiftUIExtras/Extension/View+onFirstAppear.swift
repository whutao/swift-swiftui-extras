import SwiftUI

extension View {
    
    /// Adds an action to perform before this view appears for the 1st time.
    public func onFirstAppear(_ action: @escaping () -> Void) -> some View {
        modifier(OnFirstAppearViewModifier(action: action))
    }
}

private struct OnFirstAppearViewModifier: ViewModifier {
    
    @State
    private var hasAppeared = false
    
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
        self.hasAppeared = hasAppeared
    }
    
    func body(content: Content) -> some View {
        content.onAppear {
            if !hasAppeared {
                hasAppeared = true
                action()
            }
        }
    }
}
