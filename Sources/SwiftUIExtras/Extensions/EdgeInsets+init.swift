import SwiftUI

extension EdgeInsets {
    
    /// Creates the insets instance.
    @inlinable
    public init(all amount: CGFloat) {
        self.init(top: amount, leading: amount, bottom: amount, trailing: amount)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(horizontal: CGFloat) {
        self.init(top: .zero, leading: horizontal, bottom: .zero, trailing: horizontal)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(vertical: CGFloat) {
        self.init(top: vertical, leading: .zero, bottom: vertical, trailing: .zero)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(top: CGFloat) {
        self.init(top: top, leading: .zero, bottom: .zero, trailing: .zero)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(leading: CGFloat) {
        self.init(top: .zero, leading: leading, bottom: .zero, trailing: .zero)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(bottom: CGFloat) {
        self.init(top: .zero, leading: .zero, bottom: bottom, trailing: .zero)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(trailing: CGFloat) {
        self.init(top: .zero, leading: .zero, bottom: .zero, trailing: trailing)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(top: CGFloat, leading: CGFloat) {
        self.init(top: top, leading: leading, bottom: .zero, trailing: .zero)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(top: CGFloat, bottom: CGFloat) {
        self.init(top: top, leading: .zero, bottom: bottom, trailing: .zero)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(top: CGFloat, trailing: CGFloat) {
        self.init(top: top, leading: .zero, bottom: .zero, trailing: trailing)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(leading: CGFloat, bottom: CGFloat) {
        self.init(top: .zero, leading: leading, bottom: bottom, trailing: .zero)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(leading: CGFloat, trailing: CGFloat) {
        self.init(top: .zero, leading: leading, bottom: .zero, trailing: trailing)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(bottom: CGFloat, trailing: CGFloat) {
        self.init(top: .zero, leading: .zero, bottom: bottom, trailing: trailing)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(top: CGFloat, leading: CGFloat, bottom: CGFloat) {
        self.init(top: top, leading: leading, bottom: bottom, trailing: .zero)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(top: CGFloat, leading: CGFloat, trailing: CGFloat) {
        self.init(top: top, leading: leading, bottom: .zero, trailing: trailing)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(top: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.init(top: top, leading: .zero, bottom: bottom, trailing: trailing)
    }
    
    /// Creates the insets instance.
    @inlinable
    public init(leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.init(top: .zero, leading: leading, bottom: bottom, trailing: trailing)
    }
}
