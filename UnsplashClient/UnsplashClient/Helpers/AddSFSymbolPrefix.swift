//
//  AddSFSymbolPrefix.swift
//  UnsplashClient
//
//  Created by Vlad Katsubo on 11.10.22.
//

import Foundation
import UIKit

func addSymbolPrefix(with symbol: String, for text: String) -> NSAttributedString {
    let imageAttachment = NSTextAttachment()
    imageAttachment.image = UIImage(systemName: "\(symbol)", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.white)
    let fullString = NSMutableAttributedString(string: "")
    fullString.append(NSAttributedString(attachment: imageAttachment))
    fullString.append(NSAttributedString(string: " \(text)"))
    return fullString
}


