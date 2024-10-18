//
//  ViewController.swift
//  UIKitPlayaround
//
//  Created by Isabella Sulisufi on 17/10/2024.
//

import UIKit

class peopleViewController: UIViewController {

    // Correctly initialize the button
    private let subscribeBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Call"
        config.baseBackgroundColor = .blue
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium

        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("the view is ready")
        setup()
        
        subscribeBtn.addTarget(self, action: #selector(didTapCall), for: .touchUpInside)
    }
}

private extension peopleViewController {
    func setup() {
        self.view.backgroundColor = .white

        self.view.addSubview(subscribeBtn)

        NSLayoutConstraint.activate([
            subscribeBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            subscribeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func didTapCall(sender: UIButton) {
        print("button pressed")
    }
}
