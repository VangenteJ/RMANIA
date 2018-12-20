//
//  MenuController.swift
//  RMania
//
//  Created by Joel Vangente on 29/11/2018.
//  Copyright © 2018 Joel Vangente. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class MenuController: UIViewController {
    @IBOutlet weak var imageview1: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!
    @IBOutlet weak var imageview3: UIImageView!
    @IBOutlet weak var imageview4: UIImageView!
    
    @IBOutlet weak var lblItemD1: UILabel!
    @IBOutlet weak var lblItemD2: UIStackView!
    @IBOutlet weak var lblItemD3: UILabel!
    @IBOutlet weak var lblItemD4: UILabel!
    @IBOutlet weak var lblItemD5: UILabel!
    
    @IBOutlet weak var lblDescription1: UILabel!
    @IBOutlet weak var lblDescription2: UILabel!
    @IBOutlet weak var lblDescription3: UILabel!
    @IBOutlet weak var lblDescription4: UILabel!
    @IBOutlet weak var lblDescription5: UILabel!
    
    var ref:DatabaseReference!
    var imge:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        imge = ref.child("Image")
        chechImages()
        
    }
    
    @IBAction func Pay_PayPal(_ sender: Any) {
    }
    
    @IBAction func logOut(_ sender: Any) {
        if Auth.auth().currentUser != nil{
            try? Auth.auth().signOut()
            let log_regPage = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(log_regPage, animated: true, completion: nil)
        }
    }
    
    @IBAction func Winners(_ sender: Any) {
        let goTo_Winners = self.storyboard?.instantiateViewController(withIdentifier: "HistoricController") as! HistoricController
        self.present(goTo_Winners, animated: true, completion: nil)
    }
    
    @IBAction func adminPage(_ sender: Any) {
        self.performSegue(withIdentifier: "adminpage", sender: self)
    }
    
    func chechImages(){
        let image1 = Storage.storage().reference(withPath: "Images/Number1")
        let image2 = Storage.storage().reference(withPath: "Images/Number2")
        let image3 = Storage.storage().reference(withPath: "Images/Number3")
        let image4 = Storage.storage().reference(withPath: "Images/Number4")
        
        image1.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Add logo image if no image found
                self.imageview1.image = UIImage(named: "RManiav1")
            } else {
                // Data for "images"
                self.imageview1.image = UIImage(data: data!)
                
            }
        }
        image2.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Add logo image if no image found
                self.imageview2.image = UIImage(named: "RManiav1")
            } else {
                // Data for "images"
                self.imageview2.image = UIImage(data: data!)
                
            }
        }
        image3.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Add logo image if no image found
                self.imageview3.image = UIImage(named: "RManiav1")
            } else {
                // Data for "images"
                self.imageview3.image = UIImage(data: data!)
                
            }
        }
        image4.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Add logo image if no image found
                self.imageview4.image = UIImage(named: "RManiav1")
            } else {
                // Data for "images"
                self.imageview4.image = UIImage(data: data!)
                
            }
        }
    }
    
    func isLogged(){
        if Auth.auth().currentUser == nil{
            let log_regPage = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(log_regPage, animated: true, completion: nil)
        }
    }

}
