//
//  ViewController.swift
//  Learning Countries
//
//  Created by Eduard Sinyakov on 22/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class MainVC: BasedVC {
    //MARK: - Outlets asd actions buttons
    @IBOutlet weak var europeBO: UIButton!
    @IBOutlet weak var asiaBO: UIButton!
    
    @IBAction func europeBA(_ sender: UIButton) {
    }
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    } // end of viewDidiLoad
    
    
    //MARK: - ViewWillAppead
    override func viewWillAppear(_ animated: Bool) {
        setupButtons()
    } // end of viewWillAppear
    
    //MARK: Внешниый вид кнопок
    func setupButtons() {
        
        europeBO.layer.cornerRadius = 62
        europeBO.layer.borderWidth  = 4
        europeBO.layer.borderColor  = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        europeBO.clipsToBounds      = true
        europeBO.pulsate()
        
        asiaBO.layer.cornerRadius = 62
        asiaBO.layer.borderWidth  = 4
        asiaBO.layer.borderColor  = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        asiaBO.clipsToBounds      = true
        asiaBO.pulsate()
        
    } // end of setupButtonsFunc

    //MARK: - DID UNWIND SEGUE
    @IBAction func didUnwindSegue(_ segue: UIStoryboardSegue) {
        
    } // end of didUnwindSegue

} // end of class

