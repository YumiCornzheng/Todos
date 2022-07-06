//
//  TodosTableVC-DataSource.swift
//  Todos
//
//  Created by yuming zheng on 7/6/22.
//

import UIKit


extension TodosTableVC{
    //显示几段
    override func numberOfSections(in tableView: UITableView) -> Int {1}
    
    //每段显示几行
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {todos.count}

    //每行显示的内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //每一行的每一个cell都会经过一遍加载
        let cell = tableView.dequeueReusableCell(withIdentifier: kTodoCellID, for: indexPath) as! TodoCell
        let checkBoxBtn = cell.checkBoxBtn!
        let todoLabel = cell.todoLabel!
        checkBoxBtn.isSelected = todos[indexPath.row].checked
        todoLabel.text = todos[indexPath.row].name
        //label颜色选中加灰处理
        todoLabel.textColor = todos[indexPath.row].checked ? .tertiaryLabel : .label
        
        //选框点击切换处理
        checkBoxBtn.addAction(UIAction(handler: { action in
            //bool值进行切换
            self.todos[indexPath.row].checked.toggle()
            let checked = self.todos[indexPath.row].checked
            checkBoxBtn.isSelected = checked
            todoLabel.textColor = checked ? .tertiaryLabel: .label
        }), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todoToRemove = todos[sourceIndexPath.row]
        todos.remove(at: sourceIndexPath.row)
        todos.insert(todoToRemove, at: destinationIndexPath.row)
    }
}
