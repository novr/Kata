import SwiftUI

public struct Typography: Sendable, Modifiable, Equatable {
    public var largeTitle: Font
    public var title: Font
    public var title2: Font
    public var title3: Font
    public var headline: Font
    public var subheadline: Font
    public var body: Font
    public var callout: Font
    public var footnote: Font
    public var caption: Font
    public var caption2: Font

    public init(
        largeTitle: Font,
        title: Font,
        title2: Font,
        title3: Font,
        headline: Font,
        subheadline: Font,
        body: Font,
        callout: Font,
        footnote: Font,
        caption: Font,
        caption2: Font
    ) {
        self.largeTitle = largeTitle
        self.title = title
        self.title2 = title2
        self.title3 = title3
        self.headline = headline
        self.subheadline = subheadline
        self.body = body
        self.callout = callout
        self.footnote = footnote
        self.caption = caption
        self.caption2 = caption2
    }
}
