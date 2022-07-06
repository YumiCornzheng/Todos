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
        //利用代码完成tableCell点击的跳转
//        let vc = storyboard?.instantiateViewController(withIdentifier: kTodoTableVCID) as! TodoTableVC
//        navigationController?.pushViewController(vc, animated: true)
    }
//    自定义删除的文本
//    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "点击可以删除"
//    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {.none}
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {false}
}

extension TodosTableVC: TodoTableVCDelegate{
    //代理拿回传入的值,塞入tableView数据中
    func didAdd(name: String) {
        //先将值塞入数组中
        todos.append(Todo(name: name, checked: false))
        //在tableView中插入值
        tableView.insertRows(at: [IndexPath(row: todos.count - 1, section: 0)], with: .automatic)
        print(name)
    }
    
    func didEdit(name: String) {
        todos[row].name = name
        
//        let indexPath = IndexPath(row: row, section: 0)
//        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
//        cell.todoLabel.text = name
        //重新加载(另一写法)
        tableView.reloadData()
        
    }
}
