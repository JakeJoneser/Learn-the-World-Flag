//
//  AsiaMainVC.swift
//  Learning Countries
//
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation
import UIKit

class AsiaMainVC: BasedVC {
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    // MARK: Variabel to segue information for DetailEuropeVC
    var imageText = String()
    var imageName = String()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOutlet.delegate           = self
        collectionViewOutlet.dataSource         = self
        collectionViewOutlet.backgroundColor    = .clear
        
        
    }// endOfViewDidload
    
    //MARK: - DID UNWIND SEGUE
    @IBAction func didUnwindSegueToEuropeCountries(_ segue: UIStoryboardSegue) {
        
    } // end of didUnwindSegue
    
    
} // end of class

//MARK: - Extensions with collectionViewDelegate and collectionViewDatasource
extension AsiaMainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - collectionViewCells count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //TODO: сделать массив и из него выдавать количество флагов, накачать флагов
        return AllCountries().getAsiaCountries().count
    }
    
    //MARK: - collectionView cellForItem
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! EuropeCell
        
        // MARK: Cells shapes
        cell.layer.borderWidth  = 1
        cell.layer.cornerRadius = 30
        cell.layer.borderColor  = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.clipsToBounds      = true
        // MARK: Cell's images
        cell.image.image = UIImage(named: AllCountries().getAsiaCountries()[indexPath.row])
        cell.image.contentMode = .scaleToFill
        
        return cell
    }
    
    //MARK: - collectionViewDidSelectItem
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! EuropeCell
        
        //MARK: Values to DetailEuropeVC
        imageText = AllCountries().getAsiaCountries()[indexPath.row]
        imageName = AllCountries().getAsiaCountries()[indexPath.row]
        //MARK: perform segue to DetailEuropeVC
        performSegue(withIdentifier: "asiaToDetail", sender: self)
        
    }
    
    // MARK: - prepare for segue to DetailEuropeVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "asiaToDetail" {
            let dvc = segue.destination as! DetailAsiaVC
            //MARK: set value to DetailEuropeVC
            dvc.labelText = imageText
            dvc.imageName = imageName
        }
    }
    
    
}
