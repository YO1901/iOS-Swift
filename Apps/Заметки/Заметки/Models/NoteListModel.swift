//
//  NoteListModel.swift
//  Заметки
//
//  Created by Yerlan Omarov on 30.03.2022.
//

import Foundation
import UIKit

struct NoteListModel {
    var name: String
    var text: String
    var image: UIImage?
    let creationDate: Date
    var lastChangeDate: Date
}
