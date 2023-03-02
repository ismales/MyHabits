//
//  Resources.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//

import UIKit

enum Resources {
    enum Colors {
        enum TabBar {
            static var background = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 0.8)
            static var separator = #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.2919161967)
        }
        static var background = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        static var active = #colorLiteral(red: 0.631372549, green: 0.0862745098, blue: 0.8, alpha: 1)
    }

    enum Strings {
        enum TabBar {
            static var habits = "Привычки"
            static var info = "Информация"
        }
    }

    enum Images {
        enum TabBar {
            static var habits = UIImage(named: "habits_tab_icon")
            static var info = UIImage(systemName: "info.circle.fill")
        }
    }
}
