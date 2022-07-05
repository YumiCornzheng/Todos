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
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化图片,设置图片的大小
        navigationItem.rightBarButtonItem?.image = pointIcon(iconname: "plus.circle.fill", pointSize: 22)
    }

    //显示几段
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //每段显示几行
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    //每行显示的内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTodoCellID, for: indexPath) as! TodoCell
        let checkBoxBtn = cell.checkBoxBtn!
        let todoLabel = cell.todoLabel!
        checkBoxBtn.isSelected = todos[indexPath.row].checked
        
        todoLabel.text = todos[indexPath.row].name
        todoLabel.textColor = todos[indexPath.row].checked ? .tertiaryLabel : .label
        
        checkBoxBtn.addAction(UIAction(handler: { action in
            //bool值进行切换
            self.todos[indexPath.row].checked.toggle()
            let checked = self.todos[indexPath.row].checked
            checkBoxBtn.isSelected = checked
            todoLabel.textColor = checked ? .tertiaryLabel: .label
        }), for: .touchUpInside)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //选择cell时,会闪烁一下阴影
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "TodoTableVCID") as! TodoTableVC
        navigationController?.pushViewController(vc, animated: true)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == KAddTodoID{
            let vc = segue.destination as! TodoTableVC
            vc.delegate = self
        }
    }

}

extension TodosTableVC: TodoTableVCDelegate{
    func didAdd(name: String) {
        todos.append(Todo(name: name, checked: false))
        tableView.insertRows(at: [IndexPath(row: todos.count - 1, section: 0)], with: .automatic)
        print(name)
    }
}

