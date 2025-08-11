import SwiftUI

public enum _ConditionalShape<TrueShape: Shape, FalseShape: Shape>: Shape {
    
    case `true`(TrueShape)
    
    case `false`(FalseShape)
    
    nonisolated public func path(in rect: CGRect) -> Path {
        switch self {
        case let .true(shape):
            return shape.path(in: rect)
        case let .false(shape):
            return shape.path(in: rect)
        }
    }
}
