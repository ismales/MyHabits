//
//  HabitsView.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//

import UIKit

final class HabitsView: UIView {

    // MARK: - Properties
    let habits: [Habit] = HabitsStore.shared.habits

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = Resources.Colors.background
        collectionView.register(WillSucceedTableViewCell.self, forCellWithReuseIdentifier: WillSucceedTableViewCell.identifier)
        collectionView.register(HabitsTableViewCell.self, forCellWithReuseIdentifier: HabitsTableViewCell.identifier)
        return collectionView
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Resources.Colors.background

        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension HabitsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: Resources.Metric.sideOffset, left: Resources.Metric.sideOffset, bottom: Resources.Metric.sideOffset, right: Resources.Metric.sideOffset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - Resources.Metric.sideOffset * 2
        if indexPath == IndexPath(item: 0, section: 0) {
            return CGSize(width: width, height: 85)
        } else {
            return CGSize(width: width, height: 130)
        }
    }
}

extension HabitsView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return habits.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath == IndexPath(item: 0, section: 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WillSucceedTableViewCell.identifier, for: indexPath) as! WillSucceedTableViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitsTableViewCell.identifier, for: indexPath) as! HabitsTableViewCell
            cell.setupCell(habit: habits[indexPath.item])
            cell.delegate = self
            cell.setIndexPath(indexPath)
            return cell
        }
    }
}

extension HabitsView: HabitsTableViewCellDelegate {
    func checkboxButtonTapped(_ button: UIButton, indexPath: IndexPath) {
        button.backgroundColor = habits[indexPath.item].color
    }
}
