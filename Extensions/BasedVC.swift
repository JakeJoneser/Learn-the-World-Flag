//
//  BasedVC.swift
//  Learning Countries
//
//  Created by Eduard Sinyakov on 22/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class BasedVC: UIViewController {

    var backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // setupBackgroundImage()
    }
    
    func setupBackgroundImage() {
        backgroundImageView.image = UIImage(named: "flags")
        backgroundImageView.contentMode = .scaleAspectFill
        view.backgroundColor = .black
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
