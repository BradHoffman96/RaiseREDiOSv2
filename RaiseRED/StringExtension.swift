// StringExtension.swift
import UIKit
import Foundation

extension String {
    
    var attributedStringFromHtml: NSAttributedString? {
        do {
            return try NSAttributedString(data: self.data(using: String.Encoding.utf8)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        } catch _ {
            print("Cannot create attributed String")
        }
        return nil
    }
}
