//
//  ViewController.swift
//  Clicker Project
//
//  Created by JAYLAN TUCKER on 3/14/22.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    static var points = 0
    static var totalHighs : [Int] = []
    
    @IBOutlet weak var timerLab: UILabel!
    var seconds = 15
    var timer = Timer()
    var isTimerRunning = false
    func resetTimer() {
        timer.invalidate()
        seconds = 15
        timerLab.text = "\(seconds)"
    }
    func write(){
        let docRef = database.document("games/highscore")
        docRef.setData(["score" : highs])
    }
     func read() {
        let docRef = database.document("games/highscore")
         docRef.getDocument{ snapshot, error in
             guard let data = snapshot?.data(), error == nil else{
                 print("error1")
                 return
             }
             guard let score = data["blah"] as? Int else {
                 print(data)
                 print("error2")
                 return
             }
             print(data)
             print("read works")
         }
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            highs.append(ViewController.points)
            print(highs)
    } else {
            seconds -= 1
            timerLab.text = "\(seconds)"
        }
    }
    //firestore
    @IBOutlet weak var pointsLab: UILabel!
    @IBOutlet weak var trashImage: UIImageView!
    let database = Firestore.firestore()
    var highs : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trashImage.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        resetTimer()
        runTimer()
        ViewController.points = 0
        pointsLab.text = "\(ViewController.points)"
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        highs.sort()
        highs.reverse()
        write()
        read()
        print(ViewController.totalHighs)
    }
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        ViewController.points = ViewController.points + 1
        pointsLab.text = "\(ViewController.points)"
    }
    @IBAction func resetBut(_ sender: Any) {
        resetTimer()
        runTimer()
        ViewController.points = 0
        pointsLab.text = "\(ViewController.points)"
    }
    @IBAction func readBut(_ sender: Any) {
        read()
    }
    @IBAction func writeBut(_ sender: Any) {
        write()
    }
    
}


    
