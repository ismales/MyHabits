//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//

import UIKit

final class HabitsViewController: UIViewController {

    private lazy var navBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(tapAction))

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        view.backgroundColor = Resources.Colors.background

        navigationItem.rightBarButtonItem = navBarButton
        navBarButton.tintColor = Resources.Colors.active
    }

    @objc private func tapAction() {

    }
}
