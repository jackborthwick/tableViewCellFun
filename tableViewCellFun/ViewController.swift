//
//  ViewController.swift
//  tableViewCellFun
//
//  Created by Jack Borthwick on 8/26/17.
//  Copyright © 2017 Jack Borthwick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView         :UITableView!
    var dataSource =    [ExpandingTableViewCellContent]()
    
    func tableView(_ tableView : UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = dataSource[indexPath.row]
        content.expanded = !content.expanded
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExpandingTableViewCell
            cell.set(content: dataSource[indexPath.row])
            return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = [ExpandingTableViewCellContent(dateTitle: "11-21-17",
                                                    noteContent: "Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note--Crazy long note"),
                      ExpandingTableViewCellContent(dateTitle: "11-22-17",
                                                    noteContent: "Shorter note--Shorter note--Shorter note--Shorter note--Shorter note--Shorter note"),
                      ExpandingTableViewCellContent(dateTitle: "11-23-17",
                                                    noteContent: "Shorter note--Shorter note--Shorter note--Shorter note--Shorter note--Shorter note--with a medium note--with a medium note--with a medium note--with a medium note")
        ]
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class ExpandingTableViewCellContent {
    var dateTitle       :           String?
    var noteContent     :           String?
    var expanded        :           Bool
    
    init(dateTitle: String, noteContent: String) {
        self.dateTitle = dateTitle
        self.noteContent = noteContent
        self.expanded = false
    }
}
class ExpandingTableViewCell: UITableViewCell {
    @IBOutlet var dateTitleLabel    :           UILabel!
    @IBOutlet var noteContentLabel  :           UILabel!
    
    override func awakeFromNib() {
         super.awakeFromNib()
    }
    
    func set(content: ExpandingTableViewCellContent) {
        self.dateTitleLabel.text     = content.dateTitle
        self.noteContentLabel.text   = content.expanded ? content.noteContent : ""
        
    }
}
