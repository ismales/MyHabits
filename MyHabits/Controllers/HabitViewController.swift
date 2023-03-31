//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Сманчос on 04.03.2023.
//

import UIKit

final class HabitViewController: UIViewController {
    
    // MARK: - Propertie's
    private let habitView = HabitView()
    var selectedButtonColor = UIColor.white

    // MARK: - Lifecicle
    override func loadView() {
        super.loadView()

        view = habitView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        selectColor()
        setupNavBar()
    }

    // MARK: - Method's
    private func setupNavBar() {
        let leftBarButton = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancel))
        let rightBarButton = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(create))

        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton

        navigationItem.title = "Создать"
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func selectColor() {
        habitView.colorButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.selectedColor = self.selectedButtonColor

        colorPickerVC.delegate = self
        present(colorPickerVC, animated: true)
    }

    @objc private func cancel() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func create() {
        let newHabit = Habit(name: habitView.habitName.text ?? "",
                             date: habitView.timePicker.date,
                             color: self.selectedButtonColor)
        let store = HabitsStore.shared
        store.habits.insert(newHabit, at: 0)

        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extension's
extension HabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        self.selectedButtonColor = viewController.selectedColor
    }

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        habitView.colorButton.backgroundColor = self.selectedButtonColor
        habitView.colorButton.layer.borderWidth = 0
    }
}
