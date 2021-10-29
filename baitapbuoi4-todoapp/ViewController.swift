//
//  ViewController.swift
//  baitapbuoi4-todoapp
//
//  Created by tran truong on 28/10/2021.
//

import UIKit

struct Todo {
    var titleTodo: String
    var timeTodo: String
    var contentTodo: String
}

class ViewController: UIViewController {
    @IBOutlet weak var UITableViewListTodo: UITableView!
    @IBOutlet weak var UIViewButtonCancel: UIButton!
    @IBOutlet weak var UIViewButtonAddTodo: UIButton!
    @IBOutlet weak var UITextFieldTitleTodo: UITextField!
    @IBOutlet weak var UITextFieldDateCreateTodo: UITextField!
    @IBOutlet weak var UITextFieldContentTodo: UITextField!
    var alertCheckValue: UIAlertController!
    
    var dataUser: [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addData()
        
        UIViewButtonCancel.layer.cornerRadius = 10
        UIViewButtonAddTodo.layer.cornerRadius = 10
        
        UITextFieldTitleTodo.placeholder = "Nhap tieu de"
        UITextFieldDateCreateTodo.placeholder = "Nhap thoi gian thuc hien"
        UITextFieldContentTodo.placeholder = "Nhap noi dung"
        
        UITableViewListTodo.delegate = self
        UITableViewListTodo.dataSource = self
        UITableViewListTodo.tableFooterView = UIView()
        
        //Dang ky view cell
        UITableViewListTodo.register(UINib(nibName: "ItemTodoTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTodoTableViewCell")
        
        UITableViewListTodo.reloadData()
    }
    
    func addData() -> Void {
        let todo1 = Todo(titleTodo: "Cong viec 1", timeTodo: "27/10/2021", contentTodo: "content1")
        let todo2 = Todo(titleTodo: "Cong viec 2", timeTodo: "27/10/2021", contentTodo: "content1")
        let todo3 = Todo(titleTodo: "Cong viec 3", timeTodo: "27/10/2021", contentTodo: "content1")
        let todo4 = Todo(titleTodo: "Cong viec 4", timeTodo: "27/10/2021", contentTodo: "content1")
        let todo5 = Todo(titleTodo: "Cong viec 5", timeTodo: "27/10/2021", contentTodo: "content1")
        let todo6 = Todo(titleTodo: "Cong viec 6", timeTodo: "27/10/2021", contentTodo: "content1")
        
        dataUser.append(contentsOf: [todo1, todo2, todo3, todo4, todo5, todo6])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit"){
            (action, view, completion) in print("edit")
        }
        
        let delete = UIContextualAction(style: .normal, title: "Delete"){
            (action, view, completion) in self.dataUser.remove(at: indexPath.row)
            print("delete")
        }
        
        edit.backgroundColor = .blue
        delete.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [edit, delete])
        
        return configuration
    }
    
    func showAlert(titleAlert:String? = nil ) -> Void {
        guard let titleAlertShow = titleAlert else {
            print("titleAlert nil")
            return
        }
        
        alertCheckValue = UIAlertController(title: "Thông báo", message: titleAlertShow, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK")
        }
        
        alertCheckValue.addAction(okAction)
        
        self.present(alertCheckValue!, animated: true) {
            print("Show")
        }
    }
    
    func editTodo() -> Void {
        
    }
    
    func deleteTodo() -> Void {
        
    }
    
    @IBAction func addNewTodo(_ sender: Any) {
        let titleTodo: String = UITextFieldTitleTodo.text ?? ""
        let dateTodo: String = UITextFieldDateCreateTodo.text ?? ""
        let contentTodo: String = UITextFieldContentTodo.text ?? ""
        
        if(titleTodo == ""){
            showAlert(titleAlert: "Ban khong duoc de trong title")
        } else if(dateTodo == ""){
            showAlert(titleAlert: "Ban khong duoc de trong thoi gian")
        } else if(contentTodo == ""){
            showAlert(titleAlert: "Ban khong duoc de trong noi dung")
        } else{
            let todoData = Todo(titleTodo: titleTodo, timeTodo: dateTodo, contentTodo: contentTodo)
            dataUser.append(todoData)
            UITextFieldTitleTodo.text = ""
            UITextFieldDateCreateTodo.text = ""
            UITextFieldContentTodo.text = ""
        }
        print("add todo")
    }
    
    @IBAction func cancelAddTodo(_ sender: Any) {
        UITextFieldTitleTodo.text = ""
        UITextFieldDateCreateTodo.text = ""
        UITextFieldContentTodo.text = ""
        print("add todo")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataUser.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTodoTableViewCell", for: indexPath) as! ItemTodoTableViewCell
        cell.todo = dataUser[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
}

