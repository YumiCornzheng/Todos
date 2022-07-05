//
//  TodoTableVC.swift
//  Todos
//
//  Created by yuming zheng on 7/4/22.
//

import UIKit
protocol TodoTableVCDelegate{
    func didAdd(name: String)
}

class TodoTableVC: UITableViewController {
    
    var delegate : TodoTableVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        todoTextView.becomeFirstResponder()
        navigationItem.leftBarButtonItem?.image = pointIcon(iconname: "chevron.backward.circle.fill", pointSize: 22)
        navigationItem.rightBarButtonItem?.image = pointIcon(iconname: "checkmark.circle.fill", pointSize: 22)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        
        if !todoTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            delegate?.didAdd(name: todoTextView.text)
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
