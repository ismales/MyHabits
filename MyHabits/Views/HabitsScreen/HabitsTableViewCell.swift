//
//  HabitsTableViewCell.swift
//  MyHabits
//
//  Created by Сманчос on 03.03.2023.
//

import UIKit

protocol HabitsTableViewCellDelegate: AnyObject {
    func checkboxButtonTapped(_ button: UIButton, indexPath: IndexPath)
}

final class HabitsTableViewCell: UICollectionViewCell {

    // MARK: - Propertie's
    weak var delegate: HabitsTableViewCellDelegate?

    private var indexPathCell = IndexPath()

    private let cellContentView: UIView = {
        let cellContentView = UIView()
        cellContentView.translatesAutoresizingMaskIntoConstraints = false
        cellContentView.backgroundColor = .white
        cellContentView.layer.cornerRadius = 10
        cellContentView.layer.masksToBounds = true
        return cellContentView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        return stackView
    }()

    private let textLbl: UILabel = {
        let textLbl = UILabel()
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        textLbl.font = UIFont.systemFont(ofSize: Resources.Metric.textSize, weight: .medium)
        textLbl.numberOfLines = 2
        return textLbl
    }()

    private let habitTimeLbl: UILabel = {
        let habitTimeLbl = UILabel()
        habitTimeLbl.translatesAutoresizingMaskIntoConstraints = false
        habitTimeLbl.font = UIFont.systemFont(ofSize: Resources.Metric.footnoteSice, weight: .regular)
        habitTimeLbl.textColor = .systemGray2
        return habitTimeLbl
    }()

    private let counterlbl: UILabel = {
        let counterlbl = UILabel()
        counterlbl.translatesAutoresizingMaskIntoConstraints = false
        counterlbl.font = UIFont.systemFont(ofSize: Resources.Metric.footnoteSice, weight: .regular)
        counterlbl.textColor = .systemGray
        return counterlbl
    }()

    private lazy var checkboxButton: UIButton = {
        let checkboxButton = UIButton()
        checkboxButton.translatesAutoresizingMaskIntoConstraints = false
        checkboxButton.layer.borderWidth = Resources.Metric.Button.borderWidth
        checkboxButton.layer.cornerRadius = Resources.Metric.Button.cornerRadius
        checkboxButton.tintColor = .white
        checkboxButton.clipsToBounds = true
        checkboxButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return checkboxButton
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method's
    override func prepareForReuse() {
        super.prepareForReuse()

        textLbl.text = ""
        habitTimeLbl.text = ""
        counterlbl.text = ""
        checkboxButton.setImage(nil, for: .normal)
    }

    func setupCell(habit: Habit) {
        textLbl.text = habit.name
        textLbl.textColor = habit.color
        habitTimeLbl.text = "Каждый день в \(habit.date)"
        counterlbl.text = "Счетчик: \(HabitsStore.shared.habits.count)"
        checkboxButton.layer.borderColor = habit.color.cgColor
        checkboxButton.setImage(.init(systemName: "checkmark"), for: .normal)
    }

    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }

    private func layout() {
        contentView.addSubview(cellContentView)
        cellContentView.addSubview(stackView)
        cellContentView.addSubview(checkboxButton)
        stackView.addArrangedSubview(textLbl)
        stackView.addArrangedSubview(habitTimeLbl)
        stackView.addArrangedSubview(counterlbl)

        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: Resources.Metric.sideOffset),
            stackView.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: Resources.Metric.sideOffset),
            stackView.trailingAnchor.constraint(equalTo: checkboxButton.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -Resources.Metric.sideOffset),

            textLbl.topAnchor.constraint(equalTo: stackView.topAnchor),
            textLbl.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            textLbl.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            habitTimeLbl.topAnchor.constraint(equalTo: textLbl.bottomAnchor),
            habitTimeLbl.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            habitTimeLbl.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            habitTimeLbl.bottomAnchor.constraint(equalTo: counterlbl.topAnchor, constant: -Resources.Metric.topOffset),

            counterlbl.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            counterlbl.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            counterlbl.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),

            checkboxButton.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            checkboxButton.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -Resources.Metric.sideOffset * 2),
            checkboxButton.heightAnchor.constraint(equalToConstant: Resources.Metric.Button.side),
            checkboxButton.widthAnchor.constraint(equalToConstant: Resources.Metric.Button.side),
        ])
    }

    @objc func buttonTapped() {
        delegate?.checkboxButtonTapped(checkboxButton, indexPath: indexPathCell)
    }
}
