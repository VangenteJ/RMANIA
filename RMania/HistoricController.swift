//
//  HistoricController.swift
//  RMania
//
//  Created by Joel Vangente on 29/11/2018.
//  Copyright © 2018 Joel Vangente. All rights reserved.
//

import UIKit

class HistoricController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageNun = 0
    
    @IBOutlet weak var imageview1: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!
    @IBOutlet weak var imageview3: UIImageView!
    @IBOutlet weak var imageview4: UIImageView!
    @IBOutlet weak var imageview5: UIImageView!
    @IBOutlet weak var imageview6: UIImageView!
    @IBOutlet weak var imageview7: UIImageView!
    @IBOutlet weak var imageview8: UIImageView!
    
    @IBOutlet weak var btnAdd1: UIButton!
    @IBOutlet weak var btnAdd2: UIButton!
    @IBOutlet weak var btnAdd3: UIButton!
    @IBOutlet weak var btnAdd4: UIButton!
    @IBOutlet weak var btnAdd5: UIButton!
    @IBOutlet weak var btnAdd6: UIButton!
    @IBOutlet weak var btnAdd7: UIButton!
    @IBOutlet weak var btnAdd8: UIButton!
    
    @IBOutlet weak var lblDes1: UILabel!
    @IBOutlet weak var lblDes2: UILabel!
    @IBOutlet weak var lblDes3: UILabel!
    @IBOutlet weak var lblDes4: UILabel!
    @IBOutlet weak var lblDes5: UILabel!
    @IBOutlet weak var lblDes6: UILabel!
    @IBOutlet weak var lblDes7: UILabel!
    @IBOutlet weak var lblDes8: UILabel!
    
    @IBOutlet weak var txtDes1: UITextField!
    @IBOutlet weak var txtDes2: UITextField!
    @IBOutlet weak var txtDes3: UITextField!
    @IBOutlet weak var txtDes4: UITextField!
    @IBOutlet weak var txtDes5: UITextField!
    @IBOutlet weak var txtDes6: UITextField!
    @IBOutlet weak var txtDes7: UITextField!
    @IBOutlet weak var txtDes8: UITextField!
    
    @IBOutlet weak var btnAddDes1: UIButton!
    @IBOutlet weak var btnAddDes2: UIButton!
    @IBOutlet weak var btnAddDes3: UIButton!
    @IBOutlet weak var btnAddDes4: UIButton!
    @IBOutlet weak var btnAddDes5: UIButton!
    @IBOutlet weak var btnAddDes6: UIButton!
    @IBOutlet weak var btnAddDes7: UIButton!
    @IBOutlet weak var btnAddDes8: UIButton!
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isImage()
        is_admin()
        checkContent()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Back(_ sender: Any) {
        let goBack = self.storyboard?.instantiateViewController(withIdentifier: "MenuController") as! MenuController
        self.present(goBack, animated: true, completion: nil)
    }
    
    @IBAction func addDes1(_ sender: Any) {
        is_admin()
        if txtDes1.text != ""{
           lblDes1.text = txtDes1.text
            txtDes1.isHidden = true
            btnAddDes1.isHidden = true
            btnAdd1.isHidden = true
        }else{
            
        }
        
    }
    @IBAction func addDes2(_ sender: Any) {
        if txtDes2.text != nil{
            lblDes2.text = txtDes2.text
        }
    }
    @IBAction func addDes3(_ sender: Any) {
        if txtDes3.text != nil{
            lblDes3.text = txtDes3.text
        }
    }
    @IBAction func addDes4(_ sender: Any) {
        if txtDes4.text != nil{
            lblDes4.text = txtDes4.text
        }
    }
    @IBAction func addDes5(_ sender: Any) {
        if txtDes5.text != nil{
            lblDes5.text = txtDes5.text
        }
    }
    @IBAction func addDes6(_ sender: Any) {
        if txtDes6.text != nil{
            lblDes6.text = txtDes6.text
        }
    }
    @IBAction func addDes7(_ sender: Any) {
        if txtDes7.text != nil{
            lblDes7.text = txtDes7.text
        }
    }
    @IBAction func addDes8(_ sender: Any) {
        if txtDes8.text != nil{
            lblDes8.text = txtDes8.text
        }
    }
    
    
    
    @IBAction func addImage1(_ sender: Any) {
        imageNun = 1
        addImage()
    }
    @IBAction func addImage2(_ sender: Any) {
        imageNun = 2
        addImage()
    }
    @IBAction func addImage3(_ sender: Any) {
        imageNun = 3
        addImage()
    }
    @IBAction func addImage4(_ sender: Any) {
        imageNun = 4
        addImage()
    }
    @IBAction func addImage5(_ sender: Any) {
        imageNun = 5
        addImage()
    }
    @IBAction func addImage6(_ sender: Any) {
        imageNun = 6
        addImage()
    }
    @IBAction func addImage7(_ sender: Any) {
        imageNun = 7
        addImage()
    }
    @IBAction func addImage8(_ sender: Any) {
        imageNun = 8
        addImage()
    }
    
    func isImage(){
        let image1:UIImage? = imageview1.image
        let image2:UIImage? = imageview2.image
        let image3:UIImage? = imageview3.image
        let image4:UIImage? = imageview4.image
        let image5:UIImage? = imageview5.image
        let image6:UIImage? = imageview6.image
        let image7:UIImage? = imageview7.image
        let image8:UIImage? = imageview8.image
        if image1 == nil {
            imageview1.image = UIImage(named: "RManiav1")
        }
        if image2 == nil {
            imageview2.image = UIImage(named: "RManiav1")
        }
        if image3 == nil {
            imageview3.image = UIImage(named: "RManiav1")
        }
        if image4 == nil {
            imageview4.image = UIImage(named: "RManiav1")
        }
        if image5 == nil {
            imageview5.image = UIImage(named: "RManiav1")
        }
        if image6 == nil {
            imageview6.image = UIImage(named: "RManiav1")
        }
        if image7 == nil {
            imageview7.image = UIImage(named: "RManiav1")
        }
        if image8 == nil {
            imageview8.image = UIImage(named: "RManiav1")
        }
    }
    
    func checkContent(){
        if imageview1 != UIImage(named: "RManiav1"){
            lblDes1.isHidden = false
        }
        
        if lblDes2.text == "Label"{
            imageview2.isHidden = true
            lblDes2.isHidden = true
        }
        
        if lblDes3.text == "Label"{
            imageview3.isHidden = true
            lblDes3.isHidden = true
        }
        
        if lblDes4.text == "Label"{
            imageview4.isHidden = true
            lblDes4.isHidden = true
        }
        
        if lblDes4.text == "Label"{
            imageview4.isHidden = true
            lblDes4.isHidden = true
        }
        
        if lblDes5.text == "Label"{
            imageview5.isHidden = true
            lblDes5.isHidden = true
        }
        
        if lblDes6.text == "Label"{
            imageview6.isHidden = true
            lblDes6.isHidden = true
        }
        
        if lblDes7.text == "Label"{
            imageview7.isHidden = true
            lblDes7.isHidden = true
        }
        
        if lblDes8.text == "Label"{
            imageview8.isHidden = true
            lblDes8.isHidden = true
        }
    }
    
    func is_admin(){
        btnAdd1.isHidden = true
        btnAdd2.isHidden = true
        btnAdd3.isHidden = true
        btnAdd4.isHidden = true
        btnAdd5.isHidden = true
        btnAdd6.isHidden = true
        btnAdd7.isHidden = true
        btnAdd8.isHidden = true
        txtDes1.isHidden = true
        txtDes2.isHidden = true
        txtDes3.isHidden = true
        txtDes4.isHidden = true
        txtDes5.isHidden = true
        txtDes6.isHidden = true
        txtDes7.isHidden = true
        txtDes8.isHidden = true
        btnAddDes1.isHidden = true
        btnAddDes2.isHidden = true
        btnAddDes3.isHidden = true
        btnAddDes4.isHidden = true
        btnAddDes5.isHidden = true
        btnAddDes6.isHidden = true
        btnAddDes7.isHidden = true
        btnAddDes8.isHidden = true
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
        }else if imageNun == 5{
            imageview5.image = image
        }else if imageNun == 6{
            imageview6.image = image
        }else if imageNun == 7{
            imageview7.image = image
        }else if imageNun == 8{
            imageview8.image = image
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
