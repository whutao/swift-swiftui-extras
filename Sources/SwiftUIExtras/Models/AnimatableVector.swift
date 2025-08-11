import SwiftExtras
import SwiftUI

public struct AnimatableVector<each Value: VectorArithmetic>: VectorArithmetic {
    
    public var values: (repeat each Value)
    
    public init(values: (repeat each Value)) {
        self.values = values
    }
    
    // MARK: - VectorArithmetic
    
    public static var zero: AnimatableVector<repeat each Value> {
        return AnimatableVector(values: (repeat (each Value).zero))
    }
    
    public mutating func scale(by rhs: Double) {
        values = (repeat (each values).scaled(by: rhs))
    }
    
    public var magnitudeSquared: Double {
        var result = 0.0
        for value in repeat (each values) {
            result += value.magnitudeSquared
        }
        return result
    }
    
    public static func + (
        lhs: AnimatableVector<repeat each Value>,
        rhs: AnimatableVector<repeat each Value>
    ) -> AnimatableVector<repeat each Value> {
        return AnimatableVector(values: (repeat (each lhs.values) + (each rhs.values)))
    }
    
    public static func - (
        lhs: AnimatableVector<repeat each Value>,
        rhs: AnimatableVector<repeat each Value>
    ) -> AnimatableVector<repeat each Value> {
        return AnimatableVector(values: (repeat (each lhs.values) - (each rhs.values)))
    }
    
    public static func == (
        lhs: AnimatableVector<repeat each Value>,
        rhs: AnimatableVector<repeat each Value>
    ) -> Bool {
        for (left, right) in repeat (each lhs.values, each rhs.values) {
            if !(left == right) {
                return false
            }
        }
        return true
    }
}
