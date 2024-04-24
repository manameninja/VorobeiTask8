//
//  ViewController.swift
//  VorobeiTask8
//
//  Created by Даниил Павленко on 24.04.2024.
//

import UIKit

class ViewController: UIViewController {

    private let scrollView = UIScrollView()
    
    let imageView: UIImageView = {
        let view = UIImageView(
            image: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize, weight: .bold)
        label.text = "Avatar"
        return label
    }()
    

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, imageView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        title = nil

        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.contentLayoutGuide.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 2),

            stackView.leftAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leftAnchor, constant: 15),
            stackView.rightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.rightAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),

            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        title = scrollView.contentOffset.y > stackView.bounds.height ? "Avatar" : nil
    }
}
