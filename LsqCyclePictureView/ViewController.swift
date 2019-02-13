//
//  ViewController.swift
//  LsqCyclePictureView
//
//  Created by DayHR on 2019/2/12.
//  Copyright © 2019年 zhcx. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var myTabView: UITableView?
    
    // 数据源
    let pictures: [String] = ["http://pic27.nipic.com/20130225/4746571_081826094000_2.jpg", "http://img02.tooopen.com/images/20150507/tooopen_sy_122395947985.jpg","http://pic3.nipic.com/20090702/918855_174429094_2.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "呵呵呵"
        
        let nav = self.navigationController
        nav?.navigationBar.prefersLargeTitles = true
        nav?.navigationItem.largeTitleDisplayMode = .automatic
        
        myTabView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        myTabView?.delegate = self
        myTabView?.dataSource = self
        self.view.addSubview(myTabView!)
        
//        self.createCyclePicture1()
        
//        self.createCyclePicture2()
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
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
        
        let bb = BBViewController()
        self.navigationController?.pushViewController(bb, animated: true)
        
    }
    
    
    func createCyclePicture1() {
        
        let cyclePictureView = LsqCyclePictureView(frame: CGRect(x: 0, y: 40, width: self.view.frame.width, height: 150), pictures: pictures)
        
        // 滚动方向
        cyclePictureView.direction = .left
        
        // 自动滚动时间
        cyclePictureView.autoScrollDelay = 3
        
        // pageControl 位置
        cyclePictureView.pageControlStyle = .center
        
        // 默认显示图
        cyclePictureView.placeholderImage = nil
        
        cyclePictureView.imageContentMode = UIView.ContentMode.scaleAspectFill
        // 高亮圆点
        cyclePictureView.pageControl.currentPageIndicatorTintColor = UIColor.red
        //        cyclePictureView.pageControl.currentPageIndicatorImage
        
        // 默认圆点
        cyclePictureView.pageControl.pageIndicatorTintColor = UIColor.blue
        //        cyclePictureView.pageControl.pageIndicatorImage
        
        // 点击回调
        cyclePictureView.didTapAtIndexHandle = { index in
            
            print("点击了第 \(index) 张图片")
        }
        
        self.view.addSubview(cyclePictureView)
    }
    
    func createCyclePicture2() {
        
        let cyclePictureView = LsqCyclePictureView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 150), pictures: pictures)
        
        // 滚动方向
        cyclePictureView.direction = .right
        
        // 自动滚动时间
        cyclePictureView.autoScrollDelay = 5
        
        // 标题
        cyclePictureView.titles = ["标题1", "标题2", "标题3", "标题4", "标题5", "标题6", "标题7"]
        
        // 点击回调
        cyclePictureView.didTapAtIndexHandle = { index in
            
            print("点击了第 \(index + 1) 张图片")
        }
        
        // 自定义 cell
//        cyclePictureView.register([CustomCell.self], identifiers: ["CustomCell"]) { (collectionView, indexPath, picture) -> UICollectionViewCell in
//
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
//
//            if picture.hasPrefix("http") {
//
//                cell.imageView.kf.setImage(with: URL(string: picture), placeholder: nil)
//
//            } else {
//
//                cell.imageView.image = UIImage(named: picture)
//            }
//
//            cell.label.text = "自定义 cell"
//
//            cell.label.textColor = UIColor.white
//
//            return cell
//        }
        
        // 自定义 nib cell
        //        cyclePictureView.register(<#T##nibs: [UINib?]##[UINib?]#>, identifiers: <#T##[String]#>, customCellHandle: <#T##JCyclePictureViewCustomCellHandle##JCyclePictureViewCustomCellHandle##(UICollectionView, IndexPath) -> UICollectionViewCell#>)
        
        self.view.addSubview(cyclePictureView)
    }

}

