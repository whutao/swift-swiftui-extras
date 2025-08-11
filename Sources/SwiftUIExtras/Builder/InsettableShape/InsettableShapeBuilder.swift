import SwiftUI

@resultBuilder
public enum InsettableShapeBuilder {
    
    public static func buildBlock<Component: InsettableShape>(_ component: Component) -> some InsettableShape {
        return component
    }
    
    public static func buildEither<TrueComponent: InsettableShape, FalseComponent: InsettableShape>(
        first component: TrueComponent
    ) -> _ConditionalInsettableShape<TrueComponent, FalseComponent> {
        return .true(component)
    }
    
    public static func buildEither<TrueComponent: InsettableShape, FalseComponent: InsettableShape>(
        second component: FalseComponent
    ) -> _ConditionalInsettableShape<TrueComponent, FalseComponent> {
        return .false(component)
    }
    
    public static func buildOptional<Component: InsettableShape>(
        _ component: Component?
    ) -> _ConditionalInsettableShape<Component, _EmptyInsettableShape> {
        if let component {
            return .true(component)
        } else {
            return .false(_EmptyInsettableShape())
        }
    }
}
