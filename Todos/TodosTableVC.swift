//
//  TodosVC.swift
//  Todos
//
//  Created by yuming zheng on 4/29/22.
//

import UIKit

class TodosTableVC: UITableViewController {
    //对数据进行初始化赋值
    var todos: [Todo] = []
//    Todo(name: "射雕英雄传", checked: false),
//    Todo(name: "鹿鼎记", checked: true),
//    Todo(name: "天龙八部", checked: false),
//    Todo(name: "倚天屠龙记", checked: false),
//    Todo(name: "神雕侠侣", checked: false)
    var row = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //editButtonItem是封装好的专门用于list修改的UI控件.可用于cell的编辑,
        editButtonItem.image = pointIcon(iconname: "arrow.up.arrow.down.circle", pointSize: 22)
        navigationItem.leftBarButtonItem = editButtonItem
        
        //初始化图片,设置图片的大小
        navigationItem.rightBarButtonItem?.image = pointIcon(iconname: "plus.circle.fill", pointSize: 22)

//        if let data = UserDefaults.standard.data(forKey: kTodosKey){
//            if let todos = try? JSONDecoder().decode([Todo].self, from: data){
//                self.todos = todos
//            }else{
//                print("解码失败")
//            }
//        }
        let request = Todo.fetchRequest()
        //对取出的结果进行排序
        request.sortDescriptors = [NSSortDescriptor(key: kOrderID, ascending: true)]
        if let todos = try? context.fetch(request){
            self.todos = todos
        }else{
            print("从SQLite获取数据失败")
        }
    }


    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        //editButtonItemd的title和image只能存在一个,否则会相互影响展示
        //isEditing能实时展示是否在编辑的状态
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


