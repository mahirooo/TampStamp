//
//  ViewController.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/16.
//

import UIKit
import RealmSwift
import SwiftUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet var horizontalTableView: UITableView!
    
    

    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!
    
    let realm = try! Realm()
    var saveItem: Results<Save>!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewWidth = view.frame.width
        viewHeight = view.frame.height
        navHeight = self.navigationController?.navigationBar.frame.size.height

        horizontalTableView.delegate = self
        horizontalTableView.dataSource = self
        UITabBar.appearance().tintColor = UIColor(red: 0.945, green: 0.356, blue: 0.411, alpha: 1.0)
        horizontalTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customTableView")
        let realm = try! Realm()
        self.saveItem = realm.objects(Save.self)
        horizontalTableView.reloadData()
        
//        horizontalTableView.estimatedRowHeight = 66
//        horizontalTableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(Save())
        self.horizontalTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userData = realm.objects(Save.self)
        
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableView", for: indexPath) as! TableViewCell
        let save: Save = self.saveItem[indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 30
        cell.layer.masksToBounds = false
        cell.rewardLabel.text = "ご褒美：\(save.reward)"
        cell.todoLabel.text = "目標：\(save.todo)"
        
        cell.backgroundImageView.image = UIImage(named: save.card)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
     
            // 別の画面に遷移
            performSegue(withIdentifier: "toNextViewController", sender: saveItem[indexPath.row])
        print("選択しました: \(indexPath.row)")
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            let nextVC = segue.destination as! PushViewController
            let item = sender as! Save
            nextVC.todo = item.todo
            nextVC.reward = item.reward
        nextVC.card = item.card
        }

}


