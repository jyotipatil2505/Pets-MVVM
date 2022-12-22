//
//  Loader.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 21/12/22.
//

import UIKit

class Loader: NSObject {
    static var progressHud: MBProgressHUD?
    static let mainWindow = UIApplication.shared.windows.first ?? UIView()
    // MARK: - Show ProgressHud Method
    
    static func showProgressLoader() {
        DispatchQueue.main.async(execute: { [self] in
            progressHud?.hide(animated: true)
            progressHud = MBProgressHUD.showAdded(to: mainWindow, animated: true)
            progressHud?.mode = MBProgressHUDMode.indeterminate
            progressHud?.minShowTime = 0.2
            progressHud?.animationType = MBProgressHUDAnimation.zoom
        })
    }

    static func hideProgressLoader() {
        DispatchQueue.main.async(execute: {[self] in
            progressHud?.hide(animated: true)
        })
    }
}
