//
//  ViewController.swift
//  ExpertRecruitSystem
//
//  Created by P. Chu on 8/17/16.
//  Copyright © 2016 PDC. All rights reserved.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private let reuseIdentifier = "MenuViewControllerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
//        let tbVw = UITableView()
//        self.view.addSubview(tbVw)
//        
//        tbVw.snp_makeConstraints { (make) in
//            make.centerX.equalTo(self.view.snp_centerX)
//            make.centerY.equalTo(self.view.snp_centerY)
//            make.height.equalTo(400)
//            make.width.equalTo(400)
//        }
//        
//        let contentView = UserCell()
//        tbVw.addSubview(contentView)
//        
//        contentView.snp_makeConstraints { (make) in
//            make.
//        }
//        
    }
    
    
    // MARK: - UITableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let navController = self.navigationController! // assert nonnull
        let targetController = User(rawValue: indexPath.row)!.controller()
        
        navController.pushViewController(targetController, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - UITableView Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let userType = User(rawValue: indexPath.row)!
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! UserCell
        
        cell.configureWithType(userType)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.total
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

