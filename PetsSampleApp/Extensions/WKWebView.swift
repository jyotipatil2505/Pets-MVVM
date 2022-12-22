//
//  WKWebView.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 20/12/22.
//

import WebKit

extension WKWebView {
    func load(_ urlString: String?) {
        if let contentUrlString = urlString, let url = URL(string: contentUrlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
