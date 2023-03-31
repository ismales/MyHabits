//
//  HabitView.swift
//  MyHabits
//
//  Created by Сманчос on 06.03.2023.
//

import UIKit
import SwiftUI

final class HabitView: UIView {

    // MARK: - Propertie's
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    private let designationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Resources.Metric.textSize, weight: .bold)
        label.text = "НАЗВАНИЕ"
        return label
    }()

    lazy var habitName: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: Resources.Metric.textSize)
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.delegate = self
        return textField
    }()

    private let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Resources.Metric.textSize, weight: .bold)
        label.text = "ЦВЕТ"
        return label
    }()

    lazy var colorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = Resources.Metric.Button.borderWidth
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = Resources.Metric.Button.cornerRadius
        button.clipsToBounds = true
        return button
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Resources.Metric.textSize, weight: .bold)
        label.text = "ВРЕМЯ"
        return label
    }()

    let timeTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.text = "Каждый день в 11:30"
        textView.textAlignment = .natural
        return textView
    }()

    lazy var timePicker: UIDatePicker = {
        let time = UIDatePicker()
        time.locale = .current
        time.datePickerMode = .time
        time.preferredDatePickerStyle = .wheels
        time.minuteInterval = 10
        time.date = dateFormatter.date(from: "11:30")!
        time.addTarget(self, action: #selector(setTime), for: .valueChanged)
        return time
    }()

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method's
    private func setupView() {
        addSubview(stackView)
        [designationLabel, habitName, colorLabel, colorButton, timeLabel, timeTextView, timePicker].forEach{ stackView.addArrangedSubview($0) }

        highlightPartText()

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Resources.Metric.topOffset),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Resources.Metric.sideOffset),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Resources.Metric.sideOffset),
            stackView.heightAnchor.constraint(equalToConstant: 510),

            colorButton.heightAnchor.constraint(equalToConstant: Resources.Metric.Button.side),
            colorButton.widthAnchor.constraint(equalToConstant: Resources.Metric.Button.side),

            timeTextView.heightAnchor.constraint(equalToConstant: 50),
            timeTextView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    func highlightPartText() {
        let text = timeTextView.text!
        let highlightedPart = NSMutableAttributedString(string: text)
        let attributes = [NSAttributedString.Key.foregroundColor: Resources.Colors.active]

        highlightedPart.addAttributes(attributes, range: NSRange(location: 14, length: 5))
        timeTextView.attributedText = highlightedPart
        timeTextView.font = UIFont.systemFont(ofSize: Resources.Metric.textSize)
    }

    @objc private func setTime() {
        timeTextView.text = "Каждый день в \(dateFormatter.string(from: timePicker.date))"
        highlightPartText()
    }
}

// MARK: - Extension's
extension HabitView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
    }
}
