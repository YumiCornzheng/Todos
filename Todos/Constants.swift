//
//  Constants.swift
//  Todos
//
//  Created by yuming zheng on 5/16/22.
//
import UIKit
import Foundation

//每个table的cell的id
let kTodoCellID = "TodoCellID"

let KAddTodoID = "AddTodoID"

//
let kTodoTableVCID = "TodoTableVCID"

func pointIcon( iconname: String,pointSize: CGFloat = 22) -> UIImage?{
    let config = UIImage.SymbolConfiguration(pointSize: 22)
    return UIImage(systemName: iconname, withConfiguration: config)
}
