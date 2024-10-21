//
//  PersonView.swift
//  UIKitPlayaround
//
//  Created by Isabella Sulisufi on 18/10/2024.
//

import UIKit

class PersonView: UIView {

    private let subscribeBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Link"
        config.baseBackgroundColor = .blue
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium

        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Billy bob"
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        return lbl
    }()

    private let emailLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "billybob@gmail.com"
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        return lbl
    }()

    private let personStackView: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.spacing = 8
        return vw
    }()

    private var action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(name: String, email: String) {
        nameLbl.text = name
        emailLbl.text = email
    }

}

private extension PersonView {
    func setup() {
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(personStackView)

        // Add labels and button to the stack view
        personStackView.addArrangedSubview(nameLbl)
        personStackView.addArrangedSubview(emailLbl)
        personStackView.addArrangedSubview(subscribeBtn)

        // Add constraints
        NSLayoutConstraint.activate([
            personStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            personStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            personStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            personStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])

        // Add target for the button
        subscribeBtn.addTarget(self, action: #selector(didTapCall), for: .touchUpInside)
    }

    @objc func didTapCall(sender: UIButton) {
        action()
    }
}
