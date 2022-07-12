//
//  TodosTableVC-Deleagte.swift
//  Todos
//
//  Created by yuming zheng on 7/6/22.
//

import UIKit

extension TodosTableVC{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //选择cell时,会闪烁一下阴影
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //编辑状态下,要取消左滑删除功能
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        isEditing ? .none: .delete
    }
    //用来控制是否需要listItem下划线的缩进
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {false}
}

extension TodosTableVC: TodoTableVCDelegate{
    //代理拿回传入的值,塞入tableView数据中
    func didAdd(name: String) {
        //先将值塞入数组中
//        todos.append(Todo(name: name, checked: false))
//        saveData()
        let todo = Todo(context: context)
        todo.name = name
        todo.checked = false
        todos.append(todo)
        appDelegate.saveContext()
        //在tableView中插入值
        tableView.insertRows(at: [IndexPath(row: todos.count - 1, section: 0)], with: .automatic)
        print(name)
    }
    
    func didEdit(name: String) {
        todos[row].name = name
        appDelegate.saveContext()
//        saveData()
        //重新加载(另一写法)
        tableView.reloadData()
        
    }
}
