//
//  ViewController.swift
//  BinaryCounter
//
//  Created by Lisa Ryland on 1/20/18.
//  Copyright © 2018 Lisa Ryland. All rights reserved.
//

import UIKit

//MARK: Set up for exponent functionality
precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

//MARK: View Controller Class
class ViewController: UIViewController {
    
    //MARK: variables
    var nums = [Int]()
    var total = 0
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        totalLabel.text = "Total: \(total)"
        for idx in 0..<16 {
            nums.append(10 ^^ idx)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UITableViewDataSource, CustomCellDelegate {
    //MARK: number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
    
    //MARK: cell contents
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.numberLabel.text = "\(nums[indexPath.row])"
        cell.deligate = self
        
        return cell
    }
    
    //MARK: When "-" button is pressed
    func customCellDidSubtract(_ sender: CustomCell) {
        let tappedIndexPath = tableView.indexPath(for: sender)
        total -= nums[tappedIndexPath![1]]
        print("Subtracted \(nums[tappedIndexPath![1]]), Total: \(total)")
        totalLabel.text = "Total: \(total)"
    }
    
    //MARK: When "+" button is pressed
    func customCellDidAdd(_ sender: CustomCell) {
        let tappedIndexPath = tableView.indexPath(for: sender)
        total += nums[tappedIndexPath![1]]
        print("Subtracted \(nums[tappedIndexPath![1]]), Total: \(total)")
        totalLabel.text = "Total: \(total)"
    }
    
}

