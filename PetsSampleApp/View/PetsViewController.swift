//
//  PetsViewController.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 20/12/22.
//

import UIKit

class PetsViewController: UIViewController {
    
    @IBOutlet weak var petsTableView: UITableView!
    private let viewModel = PetsViewModel()
    var pets = [PetModel]()
    var settings = SettingsModel(dictionary: [String: Any]())

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewProperties()
        setNavigationBar()
        viewModel.petsModelArray.bind { [weak self] petsList in
            self?.pets = petsList
        }
        viewModel.settings.bind { [weak self] settings in
            self?.settings = settings
        }
    }
    //MARK: - Private Methods
    func setTableViewProperties() {
        petsTableView.tableFooterView = UIView()
    }
    
    func setNavigationBar() {
        self.title = LanguageHandler.localizedWith(string: "pets", defaultValue: "Pets")
    }
}
//MARK: - Extension of PetsViewController
extension PetsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PetsTableViewCell")as? PetsTableViewCell else { return UITableViewCell()}
        let petDetail = pets[indexPath.row]
        cell.petsLabel.text = petDetail.title ?? ""
        cell.petImageView.image = UIImage(named: petDetail.image ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Pets", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "PetDetailsViewController") as? PetDetailsViewController, let contentUrl = pets[indexPath.row].contentUrl {
            vc.urlString = contentUrl
            vc.modalPresentationStyle = .overCurrentContext
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            showAlert(title: "", message: LanguageHandler.localizedWith(string: "restricted_access_in_non_working_hours", defaultValue: "You are restricted to access the content in non-working hours."))
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
