//
//  ViewController.swift
//  TagCloud
//
//  Created by Yerlan Omarov on 05.04.2022.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    
    private let tagCellID = "TagCell"
    private let placeholder = "Coctail name"
    
    private lazy var model = [TagModel]()
    
    private lazy var tagCollection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = LeftAlignmentViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        let tags = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        tags.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: tagCellID)
        tags.dataSource = self
        tags.delegate = self
        tags.backgroundColor = .systemBackground
        tags.translatesAutoresizingMaskIntoConstraints = false
        return tags
    }()
    
    private lazy var textToSearch: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemBackground
        textField.placeholder = placeholder
        textField.textAlignment = .center
        
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 8
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0 , height: 2)
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        return textField
    }()
    
    let dataProvider: DataProviderProtocol
    
    init(dataProvider: DataProviderProtocol) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupGestureRecognizer()
        
        fetchData()
    }
}


// MARK: - Private methods
extension ViewController {
    private func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(tagCollection)
        view.addSubview(textToSearch)
        
        setupConstraints()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
            
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func setupConstraints() {
        tagCollection.snp.makeConstraints { maker in
            maker.top.leading.trailing.equalToSuperview()
            maker.height.equalTo(view.frame.height * 3 / 4)
        }
        
        textToSearch.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(30)
            maker.height.equalTo(30)
            maker.bottom.equalTo(tagCollection).inset(-30)
        }
    }
    
    private func updateConstraints(withKeyboard: Bool, inset: CGFloat?) {
        tagCollection.snp.remakeConstraints { maker in
            if withKeyboard {
                maker.top.leading.trailing.equalToSuperview()
                maker.bottom.equalToSuperview().inset((inset ?? 0) + textToSearch.frame.height)
            } else {
                maker.top.leading.trailing.equalToSuperview()
                maker.height.equalTo(view.frame.height * 3 / 4)
            }
        }
        
        textToSearch.layer.cornerRadius = withKeyboard ? 0 : 8
        textToSearch.snp.remakeConstraints { maker in
            maker.height.equalTo(30)
            if withKeyboard {
                maker.leading.trailing.equalToSuperview()
                maker.bottom.equalToSuperview().inset(inset ?? 0)
            } else {
                maker.leading.trailing.equalToSuperview().inset(30)
                maker.bottom.equalTo(tagCollection).inset(-30)
            }
        }
    }
    
    private func setupGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        tagCollection.addGestureRecognizer(tap)
    }
    
    private func fetchData() {
        dataProvider.fetchAllAlcohol({ [weak self] tags in
            guard let self = self else { return }
            self.model = tags.drinks
            self.tagCollection.reloadData()
        })
    }
}

// MARK: - Event Handlers
extension ViewController {
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[
            UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            updateConstraints(withKeyboard: true, inset: keyboardSize.height - view.frame.origin.y)
        }
    }

    @objc
    private func keyboardWillHide(notification: NSNotification) {
        updateConstraints(withKeyboard: false, inset: nil)
    }
    
    @objc
    private func textFieldDidChange() {
        guard let cells = tagCollection.visibleCells as? [TagCollectionViewCell],
              let tagToSearch = textToSearch.text else {
                  return
        }
        
        cells.forEach {
            if $0.hasSubstring(text: tagToSearch) {
                $0.setGradientBackground(toAppear: true)
            } else {
                $0.setGradientBackground(toAppear: false)
            }
        }
    }
}

// MARK: - ViewController: UICollectionViewDataSource,
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = tagCollection.dequeueReusableCell(
            withReuseIdentifier: tagCellID,
            for: indexPath
        ) as? TagCollectionViewCell else { return UICollectionViewCell() }
        
        let tag = model[indexPath.row]
        cell.setup(model: tag)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TagCollectionViewCell {
            cell.changeBackgroundColor()
        }
    }
                              
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = model[indexPath.row].strDrink
        label.numberOfLines = 0
        var expectedLabelSize = label.sizeThatFits(CGSize(width: view.frame.width, height: 9999))
        expectedLabelSize.width += 20
        expectedLabelSize.height *= 1.5
        
        return expectedLabelSize
    }
}
