//
//  BookViewModel.swift
//  Coding Challenge
//
//  Created by Chris Morse on 10/11/16.
//  Copyright © 2016 morsetech.net. All rights reserved.
//

import Foundation
import UIKit

let kDataSourceURL = NSURL(string: "https://de-coding-test.s3.amazonaws.com/books.json")

protocol BookViewModelDelegate {
    func bookDataChanged()
}

class BookViewModel: NSObject {

    var data: [BookModel] = Array()
    var delegate: BookViewModelDelegate?

    override init() {
        super.init()

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)) {
            //TODO: Move this to a proper API Client layer
            self.data = self.loadData(kDataSourceURL!)

            if let delegate = self.delegate {
                dispatch_async(dispatch_get_main_queue(), { 
                    delegate.bookDataChanged()
                })
            }
        }
    }

    /// Loads the JSON result of an API Call and parses it into an array of books
    func loadData(url: NSURL) -> [BookModel] {
        var items: [BookModel] = Array()

        if let data = NSData(contentsOfURL: url) {
            //TODO: Add proper error handling
            if let dict = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [Dictionary<String,AnyObject>] {

                for item in dict!  {
                    let book = BookModel(dictionary: item)
                    items.append(book)
                }
            }
        }

        return items
    }

}