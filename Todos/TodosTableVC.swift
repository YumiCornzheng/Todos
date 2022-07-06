//
//  TodosVC.swift
//  Todos
//
//  Created by yuming zheng on 4/29/22.
//

import UIKit

class TodosTableVC: UITableViewController {
    //对数据进行初始化赋值
    var todos = [
        Todo(name: "射雕英雄传", checked: false),
        Todo(name: "鹿鼎记", checked: true),
        Todo(name: "天龙八部", checked: false),
        Todo(name: "倚天屠龙记", checked: false),
        Todo(name: "神雕侠侣", checked: false)
    
    ]
    var row = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        editButtonItem.image = pointIcon(iconname: "arrow.up.arrow.down.circle", pointSize: 22)
        navigationItem.leftBarButtonItem = editButtonItem
        
        //初始化图片,设置图片的大小
        navigationItem.rightBarButtonItem?.image = pointIcon(iconname: "plus.circle.fill", pointSize: 22)
    }


    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if isEditing{
            editButtonItem.image = nil
            editButtonItem.title = "完成"
        }else{
            editButtonItem.title = nil
            editButtonItem.image = pointIcon(iconname: "arrow.up.arrow.down.circle.fill", pointSize: 22)
        }
    }



    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //利用segue的id判断点击的控件,从而进行不同的操作
        let vc = segue.destination as! TodoTableVC
        vc.delegate = self
        if segue.identifier == kEditTodoID{
            let cell = sender as! TodoCell
            row = tableView.indexPath(for: cell)!.row
            vc.name = todos[row].name
        }
    }

}


