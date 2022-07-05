//
//  TodosVC.swift
//  Todos
//
//  Created by yuming zheng on 4/29/22.
//

import UIKit

class TodosTableVC: UITableViewController {
    
    var todos = [
        Todo(name: "射雕英雄传", checked: false),
        Todo(name: "鹿鼎记", checked: true),
        Todo(name: "天龙八部", checked: false),
        Todo(name: "倚天屠龙记", checked: false),
        Todo(name: "神雕侠侣", checked: false)
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
