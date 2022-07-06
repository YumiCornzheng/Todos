//
//  TodoCell.swift
//  Todos
//
//  Created by yuming zheng on 5/19/22.
//

import UIKit

class TodoCell: UITableViewCell {
    
    //cell的button控件
    @IBOutlet weak var checkBoxBtn: UIButton!
    
    //cell的label控件
    @IBOutlet weak var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //button的被选中状态图片
        checkBoxBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        //button的默认图片
        checkBoxBtn.setImage(UIImage(systemName: "circle"), for: .normal)

    }
    
    // Configure the view for the selected state
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
