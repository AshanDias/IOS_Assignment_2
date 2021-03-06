//
//  LocationViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import UIKit
class LocationViewController: UIViewController {

    @IBOutlet weak var locationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonStyle();
        
      
      
    }
    
    
    func setupButtonStyle(){
    
        locationButton.layer.cornerRadius = 20
        
    }
    
    @IBAction func btnAllowLocation(_ sender: Any) {
        let locationService=LocationService()
      //  locationService.getLocation()
        
      
           locationService.getLocation()
           locationService.requestLocationAuthrization()
       
        performSegue(withIdentifier: "mainSC", sender: self)
 
        
    }
    override func viewDidAppear(_ animated: Bool) {
//        let location=LocationService()
//        location.isLocationAccessEnabled()
      
       // performSegue(withIdentifier: "mainSC", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
