import SwiftUI

/// A triple of animatable values, which is itself animatable.
public struct AnimatableTriple<
    First: VectorArithmetic,
    Second: VectorArithmetic,
    Third: VectorArithmetic
>: VectorArithmetic {
    
    /// The first value.
    public var first: First
    
    /// The second value.
    public var second: Second
    
    /// The third value.
    public var third: Third
    
    /// The values as a tuple.
    public var values: (first: First, second: Second, third: Third) {
        return (first, second, third)
    }
    
    /// Creates an animated triple with the provided values.
    public init(_ first: First, _ second: Second, _ third: Third) {
        self.first = first
        self.second = second
        self.third = third
    }
    
    // MARK: - VectorArithmetic
    
    public var magnitudeSquared: Double {
        return first.magnitudeSquared + second.magnitudeSquared + third.magnitudeSquared
    }
    
    public mutating func scale(by rhs: Double) {
        first.scale(by: rhs)
        second.scale(by: rhs)
        third.scale(by: rhs)
    }
    
    public static var zero: AnimatableTriple<First, Second, Third> {
        return AnimatableTriple(.zero, .zero, .zero)
    }
    
    public static func + (
        lhs: AnimatableTriple<First, Second, Third>,
        rhs: AnimatableTriple<First, Second, Third>
    ) -> AnimatableTriple<First, Second, Third> {
        return AnimatableTriple(
            lhs.first + rhs.first,
            lhs.second + rhs.second,
            lhs.third + rhs.third
        )
    }
    
    public static func - (
        lhs: AnimatableTriple<First, Second, Third>,
        rhs: AnimatableTriple<First, Second, Third>
    ) -> AnimatableTriple<First, Second, Third> {
        return AnimatableTriple(
            lhs.first - rhs.first,
            lhs.second - rhs.second,
            lhs.third - rhs.third
        )
    }
}
