//
//  ViewController.swift
//  swiftDemo
//
//  Created by qingfengiOS_2 on 16/5/17.
//  Copyright © 2016年 qingfengiOS_2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView:UITableView? = nil
    var dataArray:NSArray? = nil
    let cellIndentifier = "cellIndentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "hello world"
        whileUse()
        
        dataArrayInit()
        tableViewInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func whileUse() -> Void {
        // 5.2 while
        var index = 1
        while index <= 3 {
            print("\(index)")
            index += 1
        }
    }
    
    func tableViewInit() {
        self.tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.self , forCellReuseIdentifier: cellIndentifier)
        self.view.addSubview(self.tableView!)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.dataArray?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier, forIndexPath: indexPath)
        cell.textLabel?.text = self.dataArray?.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        var  vc = UIViewController()
        if indexPath.row == 0 {
            vc = ButtonViewController()
        }else if indexPath.row == 1 {
            vc = LabelViewController()
        }else if indexPath.row == 2 {
            vc = TextInputViewController()
        }else if indexPath.row == 3 {
            
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func dataArrayInit() {
        if self.dataArray == nil {
            self.dataArray = NSArray(array: ["button", "label", "textInput", "collectionview"])
        }
    }

}

