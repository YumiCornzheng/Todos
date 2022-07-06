//
//  TodoTableVC.swift
//  Todos
//
//  Created by yuming zheng on 7/4/22.
//

import UIKit
protocol TodoTableVCDelegate{
    func didAdd(name: String)
    func didEdit(name: String)
}

class TodoTableVC: UITableViewController {
    
    var delegate : TodoTableVCDelegate?
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        //让页面进入时自动点击textView
        todoTextView.becomeFirstResponder()
        todoTextView.text = name
        
        if name != nil{
            navigationItem.title = "编辑待办事项"
        }
        
        //修改图片大小,实际上是将图片重新初始化了一遍
        navigationItem.leftBarButtonItem?.image = pointIcon(iconname: "chevron.backward.circle.fill", pointSize: 22)
        navigationItem.rightBarButtonItem?.image = pointIcon(iconname: "checkmark.circle.fill", pointSize: 22)
    }
    
    @IBAction func back(_ sender: Any) {
        //将页面pop出去,也就是返回原页面
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        //判断输入是否为空,不为空则将值传出
        if !todoTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let name = todoTextView.text!
            if self.name == nil{
                delegate?.didAdd(name: todoTextView.text)
            }else{
                delegate?.didEdit(name: todoTextView.text)
            }
            
        }
        
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var todoTextView: UITextView!
}


extension TodoTableVC: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
//        tableView.beginUpdates()
//        tableView.endUpdates()
        tableView.performBatchUpdates{        }
    }
}
