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
        todos[indexPath.row].orderID = Int16(indexPath.row)
        appDelegate.saveContext()
        let checkBoxBtn = cell.checkBoxBtn!
        let todoLabel = cell.todoLabel!
        checkBoxBtn.isSelected = todos[indexPath.row].checked
        todoLabel.text = todos[indexPath.row].name
        //label颜色选中加灰处理
        todoLabel.textColor = todos[indexPath.row].checked ? .tertiaryLabel : .label
        
//        if !isEditing{
//            //选框点击切换处理
//            checkBoxBtn.addAction(UIAction(handler: { action in
//                //bool值进行切换
//                self.todos[indexPath.row].checked.toggle()
//                let checked = self.todos[indexPath.row].checked
//                checkBoxBtn.isSelected = checked
//                todoLabel.textColor = checked ? .tertiaryLabel: .label
//            }), for: .touchUpInside)
//        }
        checkBoxBtn.tag = indexPath.row
        //button的点击方法
        checkBoxBtn.addTarget(self, action: #selector(toggleCheck), for: .touchUpInside)
        
        return cell
    }
    //cell的右滑删除功能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            context.delete(todos[indexPath.row])
            todos.remove(at: indexPath.row)
            appDelegate.saveContext()
//            saveData()
            tableView.reloadData()
        }
    }
    //cell移动位置的时候触发,需要修改数据源
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todoToRemove = todos[sourceIndexPath.row]
        todos.remove(at: sourceIndexPath.row)
        todos.insert(todoToRemove, at: destinationIndexPath.row)
//        saveData()
//        appDelegate.saveContext()
        tableView.reloadData()
    }
}


extension TodosTableVC{
    @objc func toggleCheck(checkBoxBtn: UIButton){
        
        let row = checkBoxBtn.tag
        print("tag:\(checkBoxBtn.tag)")
        todos[row].checked.toggle()
//        saveData()
        appDelegate.saveContext()
        let checked = todos[row].checked
        checkBoxBtn.isSelected = checked
        print("orderID:\(todos[row].orderID)")
        let cell = tableView.cellForRow(at: IndexPath(row: Int(todos[row].orderID), section: 0)) as! TodoCell
        cell.todoLabel.textColor = checked ? .tertiaryLabel: .label
    }
}
