//
//  UIAlertViewController.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 21/12/22.
//

import UIKit

extension UIViewController {

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: LanguageHandler.localizedWith(string: "ok", defaultValue: "Ok"), style: .default) { [weak self] _ in
            //
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
