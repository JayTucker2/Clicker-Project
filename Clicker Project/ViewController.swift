//
//  ViewController.swift
//  Clicker Project
//
//  Created by JAYLAN TUCKER on 3/14/22.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    var points = 0
    @IBOutlet weak var pointsLab: UILabel!
    @IBOutlet weak var trashImage: UIImageView!
    let database = Firestore.firestore()
    var highs = [100, 10000, 2000]
    override func viewDidLoad() {
        super.viewDidLoad()
//        time = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    @IBAction func highscoreButton(_ sender: Any) {
        let docRef = database.document("games/highscore")
        docRef.setData(["score" : highs])
    }
    
    @IBAction func didTapImage(_ sender: Any) {
        points = points + 1
        pointsLab.text = "\(points) "
    }
    
}

