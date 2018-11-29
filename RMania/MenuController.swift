//
//  MenuController.swift
//  RMania
//
//  Created by Joel Vangente on 29/11/2018.
//  Copyright © 2018 Joel Vangente. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageview1: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!
    @IBOutlet weak var imageview3: UIImageView!
    @IBOutlet weak var imageview4: UIImageView!
    
    @IBOutlet weak var btnToImageView1: UIButton!
    @IBOutlet weak var btnToImageView2: UIButton!
    @IBOutlet weak var btnToImageView3: UIButton!
    @IBOutlet weak var btnImageView4: UIButton!
    
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
    
    @IBOutlet weak var txtAddItemName: UITextField!
    @IBOutlet weak var txtAddDescription: UITextField!
    @IBOutlet weak var txtCondition: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtExtra: UITextField!
    
    @IBOutlet weak var btnItemName: UIButton!
    @IBOutlet weak var btnDescription: UIButton!
    @IBOutlet weak var btnCondition: UIButton!
    @IBOutlet weak var btnPrice: UIButton!
    @IBOutlet weak var btnExtra: UIButton!
    
    var imageNun = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItemName(_ sender: Any) {
        if txtAddItemName.text != nil {
            lblDescription1.text = txtAddItemName.text
        }
    }
    
    @IBAction func addDescription(_ sender: Any) {
        if txtAddDescription.text != nil {
            lblDescription2.text = txtAddDescription.text
        }
    }
    
    @IBAction func addCondition(_ sender: Any) {
        if txtCondition.text != nil {
            lblDescription3.text = txtCondition.text
        }
    }
    
    @IBAction func addPrice(_ sender: Any) {
        if txtPrice.text != nil {
            if let numbers = Int(txtPrice.text!){
                lblDescription4.text = String(numbers)
            }
        }
    }
    
    @IBAction func addExtra(_ sender: Any) {
        if txtExtra.text != nil {
            lblDescription5.text = txtExtra.text
        }
    }
    
    
    @IBAction func Winners(_ sender: Any) {
        let goTo_Winners = self.storyboard?.instantiateViewController(withIdentifier: "HistoricController") as! HistoricController
        self.present(goTo_Winners, animated: true, completion: nil)
    }
    
    @IBAction func btnAddImage1(_ sender: Any) {
        addImage()
        imageNun = 1
    }
    
    @IBAction func btnImageView2(_ sender: Any) {
        addImage()
        imageNun = 2
    }
    @IBAction func btnAddImage3(_ sender: Any) {
        addImage()
        imageNun = 3
    }
    @IBAction func btnAddImage4(_ sender: Any) {
        addImage()
        imageNun = 4
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        if imageNun == 1{
            imageview1.image = image
        }else if imageNun == 2{
            imageview2.image = image
        }else if imageNun == 3{
            imageview3.image = image
        }else if imageNun == 4{
            imageview4.image = image
        }
        imageNun = 0
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func addImage(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }

}
