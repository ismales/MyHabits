//
//  UITextView +ext.swift
//  MyHabits
//
//  Created by Сманчос on 06.03.2023.
//

import UIKit

extension UITextView {
    override open func draw(_ rect: CGRect) {
        textContainer.lineFragmentPadding = 0
        textContainerInset = .zero
    }
}
