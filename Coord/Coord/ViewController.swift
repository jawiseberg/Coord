//
//  ViewController.swift
//  Coord
//
//  Created by Jake Wiseberg on 10/24/20.
//

import FSCalendar
import UIKit

class ViewController: UIViewController {

    var calendar = FSCalendar()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendar.frame = CGRect(x: 0,
                                y: 0,
                                width: view.frame.size.width,
                                height: view.frame.size.width)
        view.addSubview(calendar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

