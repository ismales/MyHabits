//
//  HabitsView.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//

import UIKit

class HabitsView: UIView {

    // MARK: - Properties
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Resources.Metric.sideOffset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: Resources.Metric.sideOffset, left: Resources.Metric.sideOffset, bottom: Resources.Metric.sideOffset, right: Resources.Metric.sideOffset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - Resources.Metric.sideOffset * 2
        if indexPath.item == 0 {
            return CGSize(width: width, height: 85)
        } else {
            return CGSize(width: width, height: 130)
        }
    }
}

extension HabitsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6   // поменять. зависит от количества добавленных привычек
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WillSucceedTableViewCell.identifier, for: indexPath) as! WillSucceedTableViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitsTableViewCell.identifier, for: indexPath) as! HabitsTableViewCell
            return cell
        }
    }
}
