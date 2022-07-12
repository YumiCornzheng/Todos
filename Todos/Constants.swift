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

//点击加号添加内容的segue的id
let KAddTodoID = "AddTodoID"

//TodoTableVC页面的storyBoard的id,用于代码找到TodoTableVC页面,传值或跳转
let kTodoTableVCID = "TodoTableVCID"

//点击cell的segue的id
let kEditTodoID = "EditTodoID"

//userdefaults的key
let kTodosKey = "TodoKey"

//Todo数组排序的id
let kOrderID = "orderID"

//初始化图片的方法,主要用于修改图片的大小
func pointIcon( iconname: String,pointSize: CGFloat = 22) -> UIImage?{
    let config = UIImage.SymbolConfiguration(pointSize: 22)
    return UIImage(systemName: iconname, withConfiguration: config)
}
