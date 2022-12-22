//
//  LanguageHandler.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 22/12/22.
//

import UIKit

class LanguageHandler: NSObject {
    public class func localizedWith(string: String, defaultValue: String) -> String {
        let key = "en"
        let path = Bundle.main.path(forResource: key, ofType: "lproj")
        let bundle = Bundle(path: path ?? "")
        var localizedString = bundle?.localizedString(forKey: string, value: defaultValue, table: nil)
        return localizedString ?? defaultValue
    }
}
