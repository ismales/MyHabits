//
//  UIViewController +ext.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//

import UIKit

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
