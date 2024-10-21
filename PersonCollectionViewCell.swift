//
//  PersonCollectionViewCell.swift
//  UIKitPlayaround
//
//  Created by Isabella Sulisufi on 18/10/2024.
//

import UIKit

protocol PersonCollectionViewCellDelegate: AnyObject {
    func didTapEmail()
}

class PersonCollectionViewCell: UICollectionViewCell {

    // Initialize vw as an optional, but configure it properly during setup
    private var vw: PersonView?

    weak var delegate: PersonCollectionViewCellDelegate?

    var item: PersonResponse? {
        didSet {
            guard let firstName = item?.firstName,
                  let lastName = item?.lastName,
                  let email = item?.email else {
                return
            }
            vw?.set(name: "\(firstName) \(lastName)", email: email)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PersonCollectionViewCell {

    func setup() {
        // Initialize vw and set up the tap event closure
        let personView = PersonView { [weak self] in
            self?.delegate?.didTapEmail()
        }
        personView.translatesAutoresizingMaskIntoConstraints = false
        self.vw = personView

        // Safely unwrap and add the view to the contentView
        self.contentView.addSubview(personView)

        NSLayoutConstraint.activate([
            personView.topAnchor.constraint(equalTo: contentView.topAnchor),
            personView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            personView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            personView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
}
