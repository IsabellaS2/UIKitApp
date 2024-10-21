//
//  ViewController.swift
//  UIKitPlayaround
//
//  Created by Isabella Sulisufi on 17/10/2024.
//

import UIKit
import SafariServices

class PeopleViewController: UIViewController {

    private let vm: PeopleViewModel

    // Initialize the view model in the initializer
    init(viewModel: PeopleViewModel) {
        self.vm = viewModel
        super.init(nibName: nil, bundle: nil) // Call to super initializer
    }

    // This is required when creating a custom initializer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 130)

        let vw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vw.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        vw.dataSource = self

        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("the view is ready")
        setup()
        vm.delegate = self
        vm.getUsers()
    }
}

extension PeopleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.people.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = vm.people[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as! PersonCollectionViewCell
        cell.item = item
        cell.delegate = self // Set delegate to PeopleViewController
        return cell
    }
}

extension PeopleViewController: PeopleViewModelDelegate {
    func didFinish() {
        cv.reloadData()
    }

    func didFail(error: any Error) {
        print(error)
    }
}

extension PeopleViewController: PersonCollectionViewCellDelegate {
    func didTapEmail() {
        let url = URL(string: "https://www.youtube.com/")!
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
        print("button pressed")
    }
}

private extension PeopleViewController {
    func setup() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "People"

        self.view.backgroundColor = .white
        self.view.addSubview(cv)

        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: self.view.topAnchor),
            cv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
