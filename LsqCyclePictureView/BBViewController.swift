//
//  BBViewController.swift
//  LsqCyclePictureView
//
//  Created by DayHR on 2019/2/12.
//  Copyright © 2019年 zhcx. All rights reserved.
//

import UIKit

class BBViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    private var myTabView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "我是一个小提莫"
       
        self.navigationItem.largeTitleDisplayMode = .never
        
        myTabView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        myTabView?.delegate = self
        myTabView?.dataSource = self
        self.view.addSubview(myTabView!)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        let nav = self.navigationController
//        nav?.navigationBar.prefersLargeTitles = false
//        nav?.navigationItem.largeTitleDisplayMode = .never
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        let nav = self.navigationController
//        nav?.navigationBar.prefersLargeTitles = true
//        nav?.navigationItem.largeTitleDisplayMode = .automatic
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 33
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idf = "sdfsdf"
        var cell = tableView.dequeueReusableCell(withIdentifier: idf)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: idf)
        }
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let bb = CCViewController()
        self.navigationController?.pushViewController(bb, animated: true)
        
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
