//
//  StampViewController.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/16.
//

import UIKit
import RealmSwift

class StampViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet var cardDesign:UIImageView!
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var rewardTextField: UITextField!
    
    
    let imageName = ["selectBlue","selectPink1","selectPink2"]
    var dateArray: [String] = ["5日間","10日間"]
    var cardImageArray = [String]()
    var index = 0
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        
        todoTextField.delegate = self
        rewardTextField.delegate = self
        
        let save: Save? = read()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func read() -> Save? {
        return realm.objects(Save.self).first
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
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
    
    @IBAction func make(){
        let todo: String = todoTextField.text!
        let reward: String = rewardTextField.text!
        let card: String = imageName[index]
        let save = Save()
               save.todo = todo
               save.reward = reward
        save.card = card
               
               try! realm.write {
                   realm.add(save)
               }
        
        let alert: UIAlertController = UIAlertController(title: "成功",message: "保存しました",preferredStyle: .alert)

        alert.addAction(
            UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
        )

        present(alert, animated: true, completion: nil)
        print(todo)
        print(reward)
        print(card)



    }
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
