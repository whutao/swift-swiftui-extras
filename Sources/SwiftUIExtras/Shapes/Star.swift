import CoreGraphicsExtras
import SwiftUI

/// A shape that draws a 5-pointed star. The star is defined by alternating points along an outer and inner radius
/// to create the classic star shape with sharp tips and indented inner corners.
public struct Star: InsettableShape {
    
    internal var inset: CGFloat = 0
    
    /// Creates a new `Star` shape.
    public init() {
       
    }
    
    // MARK: - Shape
    
    public func path(in rect: CGRect) -> Path {
        let rect = rect.insetBy(dx: 2 * inset, dy: 2 * inset)
        let center = rect.center
        let outerRadius = 0.5 * rect.size.minDimension
        let (innerPoints, outerPoints) = makePoints(
            innerRadius: 0.5 * outerRadius,
            outerRadius: outerRadius
        )
        var path = Path()
        path.move(to: outerPoints.first!)
        for (outerPoint, innerPoint) in zip(outerPoints, innerPoints) {
            path.addLine(to: outerPoint)
            path.addLine(to: innerPoint)
        }
        path.closeSubpath()
        return path.applying(
            .translate(
                x: center.x,
                y: center.y + 2 * outerRadius * (1 - cos(.pi / 10))
            )
        )
    }
    
    // MARK: - InsettableShape
    
    public func inset(by amount: CGFloat) -> some InsettableShape {
        var result = self
        result.inset += amount
        return result
    }
    
    // MARK: - Private methods
    
    /// Generates the points required to form a 5-pointed star.
    ///
    /// This function uses polar coordinates to place points on the circle. It alternates between `outerRadius`
    /// and `innerRadius` in a loop of 10 points (5 outer, 5 inner), which are evenly spaced by an angle of 36 degrees (π/5 radians).
    ///
    /// - Parameters:
    ///   - innerRadius: The radius for the inner points of the star, creating the "indented" shape.
    ///   - outerRadius: The radius for the outer points of the star, creating the "tips" of the star.
    /// - Returns: A tuple containing arrays of `CGPoint`s representing the inner and outer points.
    private func makePoints(innerRadius: CGFloat, outerRadius: CGFloat) -> (
        innerPoints: [CGPoint],
        outerPoints: [CGPoint]
    ) {
        var innerPoints: [CGPoint] = []
        var outerPoints: [CGPoint] = []
        var angle: CGFloat = -(.pi / 2)
        for index in 0..<10 {
            if index.isMultiple(of: 2) {
                outerPoints.append(
                    CGPoint(
                        x: outerRadius * cos(angle),
                        y: outerRadius * sin(angle)
                    )
                )
            } else {
                innerPoints.append(
                    CGPoint(
                        x: innerRadius * cos(angle),
                        y: innerRadius * sin(angle)
                    )
                )
            }
            angle = angle + (.pi / 5)
        }
        return (innerPoints, outerPoints)
    }
}
