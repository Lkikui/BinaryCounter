//  CustomCellDelegate.swift
//  BinaryCounter
//
//  Created by Lisa Ryland on 1/20/18.
//  Copyright © 2018 Lisa Ryland. All rights reserved.
//

protocol CustomCellDelegate : class {
    func customCellDidSubtract(_ sender: CustomCell)
    func customCellDidAdd(_ sender: CustomCell)
}
