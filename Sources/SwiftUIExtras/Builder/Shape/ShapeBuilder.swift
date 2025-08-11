import SwiftUI

@resultBuilder
public enum ShapeBuilder {
    
    public static func buildBlock<Component: Shape>(_ component: Component) -> some Shape {
        return component
    }
    
    public static func buildEither<TrueComponent: Shape, FalseComponent: Shape>(
        first component: TrueComponent
    ) -> _ConditionalShape<TrueComponent, FalseComponent> {
        return .true(component)
    }
    
    public static func buildEither<TrueComponent: Shape, FalseComponent: Shape>(
        second component: FalseComponent
    ) -> _ConditionalShape<TrueComponent, FalseComponent> {
        return .false(component)
    }
    
    public static func buildOptional<Component: Shape>(
        _ component: Component?
    ) -> _ConditionalShape<Component, _EmptyShape> {
        if let component {
            return .true(component)
        } else {
            return .false(_EmptyShape())
        }
    }
}
