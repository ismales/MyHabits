//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Сманчос on 02.03.2023.
//
 
import UIKit

final class InfoViewController: UIViewController {

    private let infoView = InfoView()

    override func loadView() {
        super.loadView()

        view = infoView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    private func configure() {
        navigationItem.title = Resources.Strings.TabBar.info
        infoView.setupTexts(info: info)
    }
}
