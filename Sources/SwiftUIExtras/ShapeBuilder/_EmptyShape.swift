import SwiftUI

public struct _EmptyShape: Shape {
    
    public init() {
        
    }
    
    nonisolated public func path(in rect: CGRect) -> Path {
        return Path()
    }
}
