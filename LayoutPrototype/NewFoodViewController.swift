//
//  NewFoodViewController.swift
//  LayoutPrototype
//
//  Created by Guy Fawkes on 04/09/18.
//  Copyright © 2018 Guy Fawkes. All rights reserved.
//

import UIKit

class NewFoodViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var newFood = Food()
    
    @IBOutlet weak var etFoodTitle: UITextField!
    
    @IBOutlet weak var imgUploadFood: UIImageView!
    
    @IBOutlet weak var etDescFood: UITextField!
    
    @IBAction func saveFoodBtn(_ sender: Any) {
        //showMsg(msg: self.etFoodTitle.text!)
        if (newFood.image == nil || (newFood.foodName?.isEmpty)! || (newFood.foodDescription?.isEmpty)!){
            let alert = UIAlertController(title: "Perhatian", message: "Fill an empty field.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            print("Sukses add data")
            foods.append(newFood)
            navigationController?.popViewController(animated: true)
            let mainViewCtrl = self.navigationController?.topViewController as! MainViewController
            mainViewCtrl.tableview?.reloadData()
            
        }
    }

  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        tapGesture.numberOfTapsRequired = 1
    
        imgUploadFood?.isUserInteractionEnabled = true
        imgUploadFood?.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        print("Please Help! use gesture")
        let pickImage = UIImagePickerController()
        pickImage.delegate = self
        pickImage.allowsEditing = true
        pickImage.sourceType = .photoLibrary
        self.present(pickImage, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let choosenImg: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        imgUploadFood!.image = choosenImg
        newFood.image = choosenImg
        picker.dismiss(animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == etFoodTitle {
        
            print("Enter Foodtitle")
            textField.resignFirstResponder()
            newFood.foodName = etFoodTitle!.text
        } else if textField == etDescFood {
            print("Enter FoodDescription")
            textField.resignFirstResponder()
            newFood.foodDescription = etDescFood!.text
        }
        newFood.rating = 2
        
        return true
    }
    
    
    func showMsg(msg: String) {
        print(msg + "!!")
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        newFood.foodName = textField.text ?? ""
        textField.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
