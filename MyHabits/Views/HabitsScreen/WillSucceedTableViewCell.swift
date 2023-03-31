//
//  WillSucceedTableViewCell.swift
//  MyHabits
//
//  Created by Сманчос on 03.03.2023.
//

import UIKit

final class WillSucceedTableViewCell: UICollectionViewCell {

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
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let textLbl: UILabel = {
        let textLbl = UILabel()
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        textLbl.font = UIFont.systemFont(ofSize: Resources.Metric.textSize, weight: .medium)
        textLbl.textColor = .systemGray
        textLbl.text = "Все получится!"
        return textLbl
    }()

    private let progressLbl: UILabel = {    // ЭТА ШТУКА ДОЛЖНА МЕНЯТЬСЯ В ЗАВИСИМОСТИ ОТ ПРОГРЕССА
        let progressLbl = UILabel()
        progressLbl.translatesAutoresizingMaskIntoConstraints = false
        progressLbl.font = UIFont.systemFont(ofSize: Resources.Metric.textSize, weight: .regular)
        progressLbl.textColor = .systemGray
        progressLbl.text = "0%"    // поменять это поле
        return progressLbl
    }()

    private let progressBar: UIProgressView = { // ЭТА ШТУКА ДОЛЖНА МЕНЯТЬСЯ В ЗАВИСИМОСТИ ОТ ПРОГРЕССА
        let progressBar = UIProgressView()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progressViewStyle = .bar
        progressBar.layer.cornerRadius = 3.5
        progressBar.layer.masksToBounds = true
        progressBar.trackTintColor = .systemGray5
        progressBar.progressTintColor = Resources.Colors.active
//        progressBar.setProgress(0.5, animated: true) // менять значение в зависимости от выполненных привычек
        return progressBar
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
    //    func setupCell(habit: HabitsStore) {
    //        progressLbl.text = "\(progress.percent)%"
    //        progressBar.setProgress = progress.percent / 100             надо будет заполнить, чтобы поля автомастически подставлялись
    //    }

    private func layout() {
        contentView.addSubview(cellContentView)
        cellContentView.addSubview(stackView)
        cellContentView.addSubview(progressBar)
        stackView.addArrangedSubview(textLbl)
        stackView.addArrangedSubview(progressLbl)

        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: Resources.Metric.sideOffset),
            stackView.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: Resources.Metric.sideOffset),
            stackView.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -Resources.Metric.sideOffset),
            stackView.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -Resources.Metric.bottomOffset),

            textLbl.topAnchor.constraint(equalTo: stackView.topAnchor),
            textLbl.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            textLbl.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),

            progressLbl.topAnchor.constraint(equalTo: textLbl.topAnchor),
            progressLbl.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            progressLbl.bottomAnchor.constraint(equalTo: textLbl.bottomAnchor),

            progressBar.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Resources.Metric.topOffset),
            progressBar.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            progressBar.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -Resources.Metric.bottomOffset),
            progressBar.heightAnchor.constraint(equalToConstant: 7)
        ])
    }
}
