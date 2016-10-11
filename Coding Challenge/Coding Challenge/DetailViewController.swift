//
//  DetailViewController.swift
//  Coding Challenge
//
//  Created by Chris Morse on 10/11/16.
//  Copyright © 2016 morsetech.net. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!


    var detailItem: BookModel?

    func configureView() {
        // Update the user interface for the detail item.
        if let book = self.detailItem {
            titleLabel.text = book.title

            if (book.author != nil) {
                authorLabel.text = "by: \(book.author!)"
            } else {
                authorLabel.text = ""
            }

            book.loadImage { (image) in
                self.bookImage.image = image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

