//
//  TodoCell.swift
//  Todos
//
//  Created by yuming zheng on 5/19/22.
//

import UIKit

class TodoCell: UITableViewCell {
    @IBOutlet weak var checkBoxBtn: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        if
        checkBoxBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        checkBoxBtn.setImage(UIImage(systemName: "circle"), for: .normal)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
