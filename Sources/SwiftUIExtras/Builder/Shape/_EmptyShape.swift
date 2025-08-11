import SwiftUI

public struct _EmptyShape: Shape {
    
    public init() {
        
    }
    
    public func path(in rect: CGRect) -> Path {
        return Path()
    }
}
