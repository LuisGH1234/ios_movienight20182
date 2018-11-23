//
//  UIImageViewExtension.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 11/8/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import UIKit
import os

extension UIImageView {
    func setImage(fromNamedAsset name: String) {
        self.image = UIImage(named: name)
    }

    func setImage(fromUrlString urlString: String, withDefaultNamed defaultName: String?, withErrorName errorName: String?){
        guard let url = URL(string: urlString) else {
            let message = "Incorrect URL string"
            os_log("%@", message)
            if let name = defaultName {
                DispatchQueue.main.async {
                    self.setImage(fromNamedAsset: name)
                }
            }
            return
        }

        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard
                let urlResponse = response as? HTTPURLResponse,
                urlResponse.statusCode == 200,
                let mimeType = response?.mimeType,
                mimeType.hasPrefix("image"),
                let data = data,
                error == nil,
                let image = UIImage(data: data) else {
                    let message = "Error while downloading Image"
                    os_log("%@", message)
                    if let name = errorName {
                        DispatchQueue.main.async {
                            self.setImage(fromNamedAsset: name)
                        }
                    }
                    return
            }
            DispatchQueue.main.async {
                self.image = image
            }
            }.resume()
    }
}
