//
//  HabitsTableViewCell.swift
//  MyHabits
//
//  Created by Сманчос on 03.03.2023.
//

import UIKit

class HabitsTableViewCell: UICollectionViewCell {

    // MARK: - Propertie's
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
        textLbl.textColor = .blue
        textLbl.text = "Выпить стакан воды"
        return textLbl
    }()

    private let habitTimeLbl: UILabel = {
        let habitTimeLbl = UILabel()
        habitTimeLbl.translatesAutoresizingMaskIntoConstraints = false
        habitTimeLbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        habitTimeLbl.textColor = .systemGray2
        habitTimeLbl.text = "Каждый день в 7:30"
        return habitTimeLbl
    }()

    private let counterlbl: UILabel = {
        let counterlbl = UILabel()
        counterlbl.translatesAutoresizingMaskIntoConstraints = false
        counterlbl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        counterlbl.textColor = .systemGray
        counterlbl.text = "Счетчик: 0"
        return counterlbl
    }()

    private lazy var checkboxView: UIView = {
        let checkboxView = UIView()
        checkboxView.translatesAutoresizingMaskIntoConstraints = false
        checkboxView.layer.borderWidth = 2
        checkboxView.layer.borderColor = UIColor.blue.cgColor
        checkboxView.layer.cornerRadius = 20
        checkboxView.clipsToBounds = true
        checkboxView.backgroundColor = .blue
        return checkboxView
    }()

    private lazy var checkboxImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "check")
        return image
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
        checkboxImage.image = nil
    }

//    func setupCell(habit: HabitsStore) {
//        ppAuthorLabel.text = post.author
//        ppImageView.image = post.image                    надо будет заполнить, чтобы поля автомастически подставлялись в значения!
//        ppDescriptionLabel.text = post.description
//        ppLikesView.text = "Likes: \(post.likes)"
//        ppViews.text = "Views: \(post.views)"
//    }

    private func layout() {
        contentView.addSubview(cellContentView)
        cellContentView.addSubview(stackView)
        cellContentView.addSubview(checkboxView)
        stackView.addArrangedSubview(textLbl)
        stackView.addArrangedSubview(habitTimeLbl)
        stackView.addArrangedSubview(counterlbl)
        checkboxView.addSubview(checkboxImage)

        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: Resources.Metric.sideOffset),
            stackView.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: Resources.Metric.sideOffset),
            stackView.trailingAnchor.constraint(equalTo: checkboxView.leadingAnchor),
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

            checkboxView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            checkboxView.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -Resources.Metric.sideOffset * 2),
            checkboxView.heightAnchor.constraint(equalToConstant: 40),
            checkboxView.widthAnchor.constraint(equalToConstant: 40),

            checkboxImage.centerXAnchor.constraint(equalTo: checkboxView.centerXAnchor),
            checkboxImage.centerYAnchor.constraint(equalTo: checkboxView.centerYAnchor),
            checkboxImage.heightAnchor.constraint(equalToConstant: 15),
            checkboxImage.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
}
