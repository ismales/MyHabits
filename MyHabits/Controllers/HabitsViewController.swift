//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//

import UIKit

final class HabitsViewController: UIViewController {

    private let habitsView = HabitsView()
    private lazy var navBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(tapAction))

    override func loadView() {
        super.loadView()

        view = habitsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        view.backgroundColor = Resources.Colors.background
        navigationItem.title = Resources.Strings.NavigationBar.today
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.rightBarButtonItem = navBarButton
        navBarButton.tintColor = Resources.Colors.active
    }

    @objc private func tapAction() {
        let createHabit = HabitViewController()
        navigationController?.pushViewController(createHabit, animated: true)
    }
}
