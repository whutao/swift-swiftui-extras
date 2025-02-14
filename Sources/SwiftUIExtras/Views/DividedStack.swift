// https://movingparts.io/variadic-views-in-swiftui
import SwiftUI

/// A vertical stack view that arranges its child views with a custom divider inserted between each view.
///
/// The `DividedVStack` view lays out its children in a vertical stack (using a `VStack`)
/// and automatically inserts a divider view between each consecutive child, omitting a divider after the last view.
///
/// This is useful for visually separating items in a list without manually adding dividers between each element.
///
/// - Parameters:
///   - alignment: The horizontal alignment of the child views in the stack. Defaults to `.center`.
///   - spacing: The spacing between child views. If `nil`, the default spacing is used.
///   - content: A closure that returns the child views of the stack.
///   - divider: A closure that returns the divider view to be inserted between child views.
///
/// ```swift
/// DividedVStack(alignment: .leading, spacing: 10) {
///     Text("Item 1")
///     Text("Item 2")
///     Text("Item 3")
/// } divider: {
///     Divider()
/// }
/// ```
public struct DividedVStack<Content: View, Divider: View>: View {
    
    private let alignment: HorizontalAlignment
    private let spacing: CGFloat?
    private let content: () -> Content
    private let divider: () -> Divider
    
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder divider: @escaping () -> Divider
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
        self.divider = divider
    }
    
    public var body: some View {
        VStack(alignment: alignment, spacing: spacing) {
            _VariadicView.Tree(DividedLayout(divider: divider), content: content)
        }
    }
}

/// A horizontal stack view that arranges its child views with a custom divider inserted between each view.
///
/// The `DividedHStack` view lays out its children in a horizontal stack (using an `HStack`)
/// and automatically inserts a divider view between each consecutive child, omitting a divider after the last view.
///
/// This view is ideal for scenarios where you want to separate items/// arranged in a row with a consistent visual separator.
///
/// - Parameters:
///  - alignment: The vertical alignment of the child views in the stack. Defaults to `.center`.
///  - spacing: The spacing between child views. If `nil`, the default spacing is used.
///  - content: A closure that returns the child views of the stack.
///  - divider: A closure that returns the divider view to be inserted between child views.
///
/// ```swift
/// DividedVStack(alignment: .leading, spacing: 10) {
///     Text("Item 1")
///     Text("Item 2")
///     Text("Item 3")
/// } divider: {
///     Divider()
/// }
/// ```
public struct DividedHStack<Content: View, Divider: View>: View {
    
    private let alignment: VerticalAlignment
    private let spacing: CGFloat?
    private let content: () -> Content
    private let divider: () -> Divider
    
    public init(
        alignment: VerticalAlignment = .center,
        spacing: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder divider: @escaping () -> Divider
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
        self.divider = divider
    }
    
    public var body: some View {
        HStack(alignment: alignment, spacing: spacing) {
            _VariadicView.Tree(DividedLayout(divider: divider), content: content)
        }
    }
}

private struct DividedLayout<Divider: View>: _VariadicView_ViewRoot {
    
    private let divider: () -> Divider
    
    init(@ViewBuilder divider: @escaping () -> Divider) {
        self.divider = divider
    }
    
    @ViewBuilder
    func body(children: _VariadicView.Children) -> some View {
        let lastChildId = children.last?.id
        ForEach(children) { child in
            child
            if child.id != lastChildId {
                divider()
            }
        }
    }
}
