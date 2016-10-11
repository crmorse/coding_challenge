//
//  BookCell.swift
//  Coding Challenge
//
//  Created by Chris Morse on 10/11/16.
//  Copyright © 2016 morsetech.net. All rights reserved.
//

import Foundation
import UIKit

class BookCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    func configure(book: BookModel) {
        bookImage.image = book.bookImage()
        titleLabel.text = book.title
        authorLabel.text = book.author
    }

}