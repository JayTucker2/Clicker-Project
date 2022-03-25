//
//  Leaderboards.swift
//  Clicker Project
//
//  Created by JAYLAN TUCKER on 3/23/22.
//

import UIKit

class Leaderboards: UIViewController {

    @IBOutlet weak var scoreLab: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        //scoreLab.text = "\(ViewController.totalHighs[0])"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
