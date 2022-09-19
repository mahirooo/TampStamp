//
//  StampViewController.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/16.
//

import UIKit
import RealmSwift

class StampViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var cardDesign:UIImageView!
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var rewardTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    var datePicker: UIDatePicker = UIDatePicker()
    
    
    let imageName = ["selectBlue","slectPink1","selectPink2"]
    var cardImageArray = [String]()
    var index = 0
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
//        
//        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
//        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dateChange))
//        
//        toolbar.setItems([spacelItem, doneItem], animated: true)
//        
//        datePicker.datePickerMode = .date
//        datePicker.preferredDatePickerStyle = .wheels
//        
//        datePicker.datePickerMode = UIDatePicker.Mode.date
//        datePicker.timeZone = NSTimeZone.local
//        datePicker.locale = Locale(identifier: "MDY")
//        dateTextField.inputView = datePicker
//        dateTextField.inputView = datePicker
//        
//        dateTextField.inputView = datePicker
//        dateTextField.inputAccessoryView = toolbar

        // Do any additional setup after loading the view.
    }
    func setImage(){
            let name = imageName[index]
            cardDesign.image = UIImage(named: name)
        print(index)
    }
    func reset(){
      if index > 2{
            index = 0
        } else if index < 0 {
            index = 2
                }
            }
    
    @IBAction func mae(){
        index = index - 1
        reset()
        setImage()
    }
    
    @IBAction func tugi(){
        index = index + 1
        reset()
        setImage()
    }
    
//    @IBAction func save(){
//        let todo: String = todoTextField.text!
//        let reward: String = rewardTextField.text!
//        let date: String = dateTextField.text!
//
//        let newSave: () = save()
//                newSave.todo = todo
//                newSave.reward = reward
//                newSave.date = date
//
//        try! realm.write {
//                    realm.add(newSave)
//        }
//        let alert: UIAlertController = UIAlertController(title: "成功",message: "保存しました",preferredStyle: .alert)
//
//        alert.addAction(
//            UIAlertAction(title: "OK", style: .default) { [weak self] _ in
//                self?.navigationController?.popViewController(animated: true)
//            }
//        )
//
//        present(alert, animated: true, completion: nil)
//        print(todo)
//        print(reward)
//
//
//
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
