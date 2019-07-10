//
//  EuropeVC.swift
//  Learning Countries
//
//  Created by Eduard Sinyakov on 22/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class EuropeVC: BasedVC {

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
extension EuropeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - collectionViewCells count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //TODO: сделать массив и из него выдавать количество флагов, накачать флагов
        return AllCountries().getEuropeCountries().count
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
        cell.image.image = UIImage(named: AllCountries().getEuropeCountries()[indexPath.row])
        cell.image.contentMode = .scaleToFill
        
        return cell
    }
    
    //MARK: - collectionViewDidSelectItem
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! EuropeCell
        
        //MARK: Values to DetailEuropeVC
        imageText = AllCountries().getEuropeCountries()[indexPath.row]
        imageName = AllCountries().getEuropeCountries()[indexPath.row]
        //MARK: perform segue to DetailEuropeVC
        performSegue(withIdentifier: "europeToDetail", sender: self)
        
    }
    
    // MARK: - prepare for segue to DetailEuropeVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "europeToDetail" {
        let dvc = segue.destination as! DetailEuropeVC
        //MARK: set value to DetailEuropeVC
            dvc.labelText = imageText
            dvc.imageName = imageName
        }
    }
    
    
}
