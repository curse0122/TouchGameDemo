//
//  PaddingLabel.swift
//  TouchGameDemo
//
//  Created by nier on 2021/2/22.
//

import UIKit

class PaddingLabel: UILabel {
    
    @IBInspectable var padding: CGFloat = 0
    @IBInspectable var paddingX: CGFloat = 0
    @IBInspectable var paddingY: CGFloat = 0
    @IBInspectable var paddingTop: CGFloat = 0
    @IBInspectable var paddingLeft: CGFloat = 0
    @IBInspectable var paddingBottom: CGFloat = 0
    @IBInspectable var paddingRight: CGFloat = 0
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: paddingTop, left: paddingLeft, bottom: paddingBottom, right: paddingRight)))
    }
    
    override var intrinsicContentSize: CGSize {
        checkPadding()
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + paddingLeft + paddingRight, height: size.height + paddingTop + paddingBottom)
    }
    
    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (paddingLeft + paddingRight)
        }
    }
    
    private func checkPadding() {
        if padding != 0 {
            paddingTop = padding
            paddingLeft = padding
            paddingBottom = padding
            paddingRight = padding
            return
        }
        
        if paddingX != 0 || paddingY != 0 {
            paddingTop = paddingY
            paddingLeft = paddingX
            paddingBottom = paddingY
            paddingRight = paddingX
            return
        }
    }
}
