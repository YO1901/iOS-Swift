import PlaygroundSupport
import SwiftUI
import UIKit

func generateAvatar(for name: NSString) -> UIImage {
    let avatarSize = CGSize(width: 64, height: 64)
    
    let backgroundColor = UIColor.purple
    let textColor = UIColor.white
    let font = UIFont.systemFont(ofSize: 25)
    
    let shadow = NSShadow()
    shadow.shadowColor = UIColor.black
    shadow.shadowBlurRadius = 4
    shadow.shadowOffset = .zero
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center

    let renderer = UIGraphicsImageRenderer(size: avatarSize)
    return renderer.image { context in
        backgroundColor.setFill()

        let attributes = [
          .font: font,
          .foregroundColor: textColor,
          .shadow: shadow,
          .paragraphStyle: paragraphStyle,
        ] as [NSAttributedString.Key: Any]
        
        let textRect = CGRect(origin: CGPoint(x: 0, y: 15), size: avatarSize)
        name.draw(in: textRect, withAttributes: attributes)
    }
}

