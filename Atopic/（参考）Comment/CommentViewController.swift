//
//  CommentViewController.swift
//  Instagram
//
//  Created by 赤穂亮太郎 on 2018/01/04.
//  Copyright © 2018年 ryoutarou.akou. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        //tableView.register(nib, forCellReuseIdentifier:"postCell")
        
        let nib2 = UINib(nibName: "CommentTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier:"commentCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
