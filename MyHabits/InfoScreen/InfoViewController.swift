//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    private func configure() {
        view.backgroundColor = Resources.Colors.background

        navigationItem.title = Resources.Strings.TabBar.info
    }
}
