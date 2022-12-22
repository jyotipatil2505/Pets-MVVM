//
//  PetDetailsViewController.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 20/12/22.
//

import UIKit
import WebKit

class PetDetailsViewController: UIViewController {
    
    @IBOutlet weak var petWebView: WKWebView!
    var urlString: String?
    var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        Loader.showProgressLoader()
        
        // Add tool bar with progress view and refresh buttons
        progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progressTintColor = UIColor(red: 40/255, green: 170/255, blue: 192/255, alpha: 1.0)
        progressView.trackTintColor = .orange
        progressView.sizeToFit()
        
        let progressButton = UIBarButtonItem(customView: progressView)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: petWebView, action: #selector(petWebView.reload))
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        // Monitoring page loads
        petWebView?.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        // Use extension below to simplify the url load code
        //petWebView?.navigationDelegate = self
        petWebView?.load(urlString)
        petWebView?.navigationDelegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
    
    //MARK: - Private Methods
    func setNavigationBar() {
        self.title = LanguageHandler.localizedWith(string: "pets_info", defaultValue: "Pets Info")
    }
}

extension PetDetailsViewController: WKNavigationDelegate {
    //implement the decidePolicyFor method. This is the only part that takes any work: you need to pull out the host of the URL that was requested, run any checks you want to make sure it’s OK, then call the decisionHandler() closure with either .allow to allow the URL or .cancel to deny access.
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    //
    //    Monitoring page load progress
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            print(Float(petWebView.estimatedProgress))
            progressView.progress = Float(petWebView.estimatedProgress)
            
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Loader.hideProgressLoader()
    }
}
