//
//  Book.swift
//  Coding Challenge
//
//  Created by Chris Morse on 10/11/16.
//  Copyright © 2016 morsetech.net. All rights reserved.
//

import Foundation
import UIKit

class Book: NSObject {
    let title: String?
    let author: String?
    let imageURL: NSURL?

    init(dictionary:[String:AnyObject]) {
        self.title = dictionary["title"] as? String
        self.author = dictionary["author"] as? String

        if let urlString = dictionary["imageURL"] as? String {
            let url = NSURL(string: urlString)
            self.imageURL = url
        } else {
            self.imageURL = nil
        }

        super.init()
    }

    ///Returns the book image as a UIImage or a default image
    func bookImage() -> UIImage? {
        if let imageURL = self.imageURL {
            //TODO: Load in background
            if let data = NSData(contentsOfURL: imageURL) {
                //TODO: cache results
                let image = UIImage(data: data)
                return image
            }
        }

        //TODO: Return default image instead
        return nil
    }
}