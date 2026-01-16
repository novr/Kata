// MARK: - Modifiable Protocol (Henge-no-Jitsu)
// The only allowed method for customizing themes via value-semantics mutations.

/// A protocol that enables immutable-style mutations through the `modified` pattern.
///
/// All Kata data structures conform to this protocol to allow clean, chainable customization
/// without breaking value semantics.
///
/// Example:
/// ```swift
/// let customTheme = Theme.standard.modified {
///     $0.colors.primary = .blue
///     $0.spacing.md = 20
/// }
/// ```
public protocol Modifiable {}

extension Modifiable {
    /// Creates a modified copy of the current value.
    ///
    /// - Parameter block: A closure that receives an `inout` copy of `self` for modification.
    /// - Returns: A new instance with the modifications applied.
    @inlinable
    public func modified(_ block: (inout Self) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }
}
