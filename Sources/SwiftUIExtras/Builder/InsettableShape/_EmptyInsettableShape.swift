import SwiftUI

public struct _EmptyInsettableShape: InsettableShape {
    
    public init() {
        
    }
    
    public func path(in rect: CGRect) -> Path {
        return Path()
    }
    
    public func inset(by amount: CGFloat) -> some InsettableShape {
        return self
    }
}
