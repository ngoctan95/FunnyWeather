//
//  ViewController.swift
//  FunnyWeather
//
//  Created by Tan on 1/3/18.
//  Copyright © 2018 Ngoc Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnRefresh(_ sender: Any) {
        let num = Int(arc4random_uniform(3))
        self.refresh(ranNum: num)
    }
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblQuote: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    var arrayImgs:[String] = ["Blood","Moon","Sun"]
    var arrayQuotes:[String] = ["The great thing about getting older is that you don't lose all the other ages you've been",
                                "It's sad to know I'm done. But looking back, I've got a lot of great memories",
                                "I am blessed to have so many great things in my life - family, friends and God. All will be in my thoughts daily"]
    var arrayCities:[String] = ["HoChiMinh","Singapore","Maxcova"]
//    enum Number{
//        case first,second,third
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblQuote.adjustsFontSizeToFitWidth = true
        lblQuote.sizeToFit()
        lblCity.adjustsFontSizeToFitWidth = true
        lblCity.sizeToFit()
        
        //Add tapGesture to label
        let ges = UITapGestureRecognizer(target: self, action: #selector(ViewController.gesture))
        lblTemp.isUserInteractionEnabled = true
        lblTemp.addGestureRecognizer(ges)
        refresh(ranNum: 0)
        
        
    }
    @objc func gesture(sender : UITapGestureRecognizer) {
        var text:String = lblTemp.text!
        text.remove(at: text.index(before: text.endIndex))
        text.remove(at: text.index(before: text.endIndex))
        
        lblTemp.text = (String("\( changeFrah(temp: Double(text)!))°F"))
    }
    func changeFrah(temp : Double) -> Double {
        return temp*Double(9/5) + 32
    }
    func refresh(ranNum:Int)  {
        //let num = Number.first
        switch ranNum {
        case 0:
            img.image = UIImage(named : arrayImgs[0])
            lblQuote.text = arrayQuotes[0]
            lblCity.text = arrayCities[0]
            
            //Random tempurature
            lblTemp.text = String("\(Double(arc4random_uniform(42) + 23))°C")
            break
        case 1:
            img.image = UIImage(named : arrayImgs[1])
            lblQuote.text = arrayQuotes[1]
            lblCity.text = arrayCities[1]
            
            //Random tempurature
           lblTemp.text = String("\(Double(arc4random_uniform(42) + 23))°C")
            break
        case 2:
            img.image = UIImage(named : arrayImgs[2])
            lblQuote.text = arrayQuotes[2]
            lblCity.text = arrayCities[2]
            
            //Random tempurature
           lblTemp.text = String("\(Double(arc4random_uniform(42) + 23))°C")
            break
            
        default:
            print("hi")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

