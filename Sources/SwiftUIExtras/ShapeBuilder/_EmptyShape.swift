import SwiftUI

public struct _EmptyShape: Shape {
    
    nonisolated public func path(in rect: CGRect) -> Path {
        return Path()
    }
}
