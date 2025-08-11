import SwiftUI

public enum _ConditionalInsettableShape<TrueShape: InsettableShape, FalseShape: InsettableShape>: InsettableShape {
    
    case `true`(TrueShape)
    
    case `false`(FalseShape)
    
    public func path(in rect: CGRect) -> Path {
        switch self {
        case let .true(shape):
            return shape.path(in: rect)
        case let .false(shape):
            return shape.path(in: rect)
        }
    }
    
    public func inset(by amount: CGFloat) -> _ConditionalInsettableShape<TrueShape.InsetShape, FalseShape.InsetShape> {
        switch self {
        case let .true(shape):
            return .true(shape.inset(by: amount))
        case let .false(shape):
            return .false(shape.inset(by: amount))
        }
    }
}
