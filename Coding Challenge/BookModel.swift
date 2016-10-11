//
//  Book.swift
//  Coding Challenge
//
//  Created by Chris Morse on 10/11/16.
//  Copyright © 2016 morsetech.net. All rights reserved.
//

import Foundation
import UIKit

class BookModel: NSObject {
    let title: String?
    let author: String?
    let imageURL: NSURL?

    init(dictionary: Dictionary<String,AnyObject>) {
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

    ///Loads book image as a UIImage or a default image on the current thread
    func bookImage() -> UIImage? {
        //TODO: cache results
        if let imageURL = self.imageURL {
            if let data = NSData(contentsOfURL: imageURL) {
                let image = UIImage(data: data)
                return image
            }
        }

        return UIImage(named: "book")
    }

    func loadImage(completion: (image: UIImage?) -> Void) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)) {
            let image = self.bookImage()

            dispatch_async(dispatch_get_main_queue(), {
                completion(image: image)
            })
        }

    }
}