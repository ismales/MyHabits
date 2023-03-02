//
//  HabitsTabBarController.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//

import UIKit

enum Tabs: Int {
    case habits
    case info
}

final class HabitsTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    private func configure() {
        tabBar.backgroundColor = Resources.Colors.TabBar.background
        tabBar.tintColor = Resources.Colors.active
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = Resources.Colors.TabBar.separator.cgColor
        tabBar.layer.masksToBounds = true

        let habitsVC = UINavigationController(rootViewController: HabitsViewController())
        let infoVC = UINavigationController(rootViewController: InfoViewController())

        habitsVC.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.habits, image: Resources.Images.TabBar.habits, tag: Tabs.habits.rawValue)
        infoVC.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.info, image: Resources.Images.TabBar.info, tag: Tabs.info.rawValue)

        viewControllers = [habitsVC, infoVC]
    }
}

