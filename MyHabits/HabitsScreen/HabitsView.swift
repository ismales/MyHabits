//
//  HabitsView.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//

import UIKit

class HabitsView: UIView {

    // MARK: - Properties
    let tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView())

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
