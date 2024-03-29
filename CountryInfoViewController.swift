//
//  CountryInfoViewController.swift
//

import UIKit

class CountryInfoViewController: UIViewController {
    @IBOutlet weak var countryTableView: UITableView!
    
    var currentFlagInfo: Array<FlagInfo> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentFlagInfo = flagInfo.sorted(by: { NSLocalizedString($0.name, comment: "") < NSLocalizedString($1.name, comment: "") })
        
        self.hideKeyboardWhenTappedAround()
        let searchController: UISearchController = UISearchController(searchResultsController: nil)
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.autocapitalizationType = .none
        
        searchController.searchBar.delegate = self
        
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = searchController
            self.navigationItem.hidesSearchBarWhenScrolling = false
            
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
     
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension CountryInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentFlagInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as! CountryInfoTableViewCell
        let target = currentFlagInfo[indexPath.row]
        
        cell.flagImageView.image = UIImage(named: target.imageName)
        cell.countryNameLabel.text = NSLocalizedString(target.name, comment: "")
        
        return cell
    }
    
}

extension CountryInfoViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            currentFlagInfo = flagInfo.sorted(by: { NSLocalizedString($0.name, comment: "") < NSLocalizedString($1.name, comment: "") })
            countryTableView.reloadData()
            return
        }
        
        guard let countrys = searchBar.text?.split(separator: ",") else {
            return
        }
        
        var tempFlagInfo = [FlagInfo]()
        
        currentFlagInfo.removeAll()
        for i in 0..<countrys.count {
            let countryName = countrys[i].trimmingCharacters(in: .whitespaces).lowercased()
            
            tempFlagInfo = flagInfo.filter { $0.name.lowercased().contains(countryName) || NSLocalizedString($0.name, comment: "").contains(countryName) }
            
            if !tempFlagInfo.isEmpty {
                for j in 0..<tempFlagInfo.count {
                    currentFlagInfo.append(tempFlagInfo[j])
                }
            }
        }
        
        let sortOrderList = currentFlagInfo
        
        currentFlagInfo = Array(Set(currentFlagInfo))
        currentFlagInfo = Array(NSOrderedSet(array: sortOrderList)) as! [FlagInfo]
        
        countryTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentFlagInfo = flagInfo.sorted(by: { NSLocalizedString($0.name, comment: "") < NSLocalizedString($1.name, comment: "") })
        countryTableView.reloadData()
    }
}
