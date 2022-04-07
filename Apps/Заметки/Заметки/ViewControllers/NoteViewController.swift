//
//  NoteViewController.swift
//  Заметки
//
//  Created by Yerlan Omarov on 29.03.2022.
//

import UIKit

class NoteViewController: UIViewController {
    
    private lazy var titleView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    private lazy var noteView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    init(noteTitle: String?, noteText: String?) {
        super.init(nibName: nil, bundle: nil)
        
        if let noteTitle = noteTitle {
            titleView.text = noteTitle
        }
        
        if let noteText = noteText {
            noteView.text = noteText
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNoteView()
    }
}

// MARK: - Private methods
extension NoteViewController {
    private func configureNoteView() {
        view.addSubview(titleView)
        view.addSubview(noteView)
        
        titleView.text = "My text"
        noteView.text = "Some text"
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            noteView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 8),
            noteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            noteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            noteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ])
    }
}
