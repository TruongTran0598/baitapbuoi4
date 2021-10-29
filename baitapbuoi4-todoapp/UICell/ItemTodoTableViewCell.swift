//
//  ItemTodoTableViewCell.swift
//  baitapbuoi4-todoapp
//
//  Created by tran truong on 28/10/2021.
//

import UIKit

class ItemTodoTableViewCell: UITableViewCell {
    @IBOutlet weak var UIViewNameOfJob: UILabel!
    @IBOutlet weak var UIViewTimeCreateTodo: UILabel!
    @IBOutlet weak var UIViewImportanItem: UIImageView!
    
    var todo:Todo?{
        didSet {
            if let todo = todo {
                UIViewNameOfJob.text = todo.titleTodo
                UIViewTimeCreateTodo.text = todo.timeTodo
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
