import SwiftUI

/// A quadruple of animatable values, which is itself animatable.
public struct AnimatableQuadruple<
    First: VectorArithmetic,
    Second: VectorArithmetic,
    Third: VectorArithmetic,
    Fourth: VectorArithmetic
>: VectorArithmetic {
    
    /// The first value.
    public var first: First
    
    /// The second value.
    public var second: Second
    
    /// The third value.
    public var third: Third
    
    /// The fourth value.
    public var fourth: Fourth
    
    /// The values as a tuple.
    public var values: (first: First, second: Second, third: Third, fourth: Fourth) {
        return (first, second, third, fourth)
    }
    
    /// Creates an animated quadruple with the provided values.
    public init(_ first: First, _ second: Second, _ third: Third, _ fourth: Fourth) {
        self.first = first
        self.second = second
        self.third = third
        self.fourth = fourth
    }
    
    // MARK: - VectorArithmetic
    
    public var magnitudeSquared: Double {
        return first.magnitudeSquared + second.magnitudeSquared + third.magnitudeSquared + fourth.magnitudeSquared
    }
    
    public mutating func scale(by rhs: Double) {
        first.scale(by: rhs)
        second.scale(by: rhs)
        third.scale(by: rhs)
        fourth.scale(by: rhs)
    }
    
    public static var zero: AnimatableQuadruple<First, Second, Third, Fourth> {
        return AnimatableQuadruple(.zero, .zero, .zero, .zero)
    }
    
    public static func + (
        lhs: AnimatableQuadruple<First, Second, Third, Fourth>,
        rhs: AnimatableQuadruple<First, Second, Third, Fourth>
    ) -> AnimatableQuadruple<First, Second, Third, Fourth> {
        return AnimatableQuadruple(
            lhs.first + rhs.first,
            lhs.second + rhs.second,
            lhs.third + rhs.third,
            lhs.fourth + rhs.fourth
        )
    }
    
    public static func - (
        lhs: AnimatableQuadruple<First, Second, Third, Fourth>,
        rhs: AnimatableQuadruple<First, Second, Third, Fourth>
    ) -> AnimatableQuadruple<First, Second, Third, Fourth> {
        return AnimatableQuadruple(
            lhs.first - rhs.first,
            lhs.second - rhs.second,
            lhs.third - rhs.third,
            lhs.fourth + rhs.fourth
        )
    }
}
