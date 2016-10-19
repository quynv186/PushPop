//
//  MathController.swift
//  Mp3
//
//  Created by admin on 10/18/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class MathController: UIViewController {
    @IBOutlet weak var lbl_Right: UILabel!
    @IBOutlet weak var lbl_Wrong: UILabel!

    @IBOutlet weak var lbl_Time2: UILabel!
    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    
    @IBOutlet weak var btn_b1: UIButton!
    @IBOutlet weak var btn_b2: UIButton!
    @IBOutlet weak var btn_b3: UIButton!
    @IBOutlet weak var lbl_Math: UILabel!
    
    var dem1: Int = 0, dem2: Int = 0, kq: Int = 0
    var time: Int = 5
    var random3: Int = 0
    var equal: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRandom()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
    }
    func setTime()
    {
        time -= 1
        lbl_Time2.text = String(time)
        if(time == 0)
        {
            dem2 += 1
            lbl_Wrong.text = String(dem2)
            setRandom()
            time = 5
        }
    }
    
    func auto() -> Int
    {
        return Int(arc4random_uniform(4)) + 1
    }
    
    func setRandom() {
        let random1 = auto()
        var random2 = auto()
        
        if random2 == random1
        {
            random2 = auto()
        }
        
        random3 = auto()
        
        if random3 == 1
        {
            lbl_Math.text = "+"
            kq = random1 + random2
        }
        else if random3 == 2
        {
            lbl_Math.text = "-"
            kq = random1 - random2
        }
        else if random3 == 3
        {
            lbl_Math.text = "*"
            kq = random1 * random2
        }
        else if random3 == 4
        {
            lbl_Math.text = "/"
            kq = random1 / random2
        }
        
        
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        
        setResult(randomA: random1, randomB: random2)
    }
    
    // Hien thi ket qua
    func setResult(randomA: Int, randomB: Int) {
        let random: Int = Int(arc4random_uniform(3)) + 1
        let total = sum(p1: randomA, p2: randomB)
        //Loai bo cac ket qua sai không trùng với kết quả đúng
        var so1: Int = auto()
        var so2: Int = auto()
        
        if so1 == so2
        {
            so1 = auto()
            if so1 == total
            {
                so1 = auto()
            }
            if so2 == total
            {
                so2 = auto()
            }
            
        }
        else
        {
            if so1 == total
            {
                so1 = auto()
            }
            if so2 == total
            {
                so2 = auto()
            }
        }
        
        if(random == 1){
            btn_b1.setTitle(String(total), for: .normal)
            btn_b2.setTitle(String(so2), for: .normal)
            btn_b3.setTitle(String(so1), for: .normal)
        } else if (random == 2){
            btn_b1.setTitle(String(so1), for: .normal)
            btn_b2.setTitle(String(total), for: .normal)
            btn_b3.setTitle(String(so2), for: .normal)
        } else {
            btn_b1.setTitle(String(so1), for: .normal)
            btn_b2.setTitle(String(so2), for: .normal)
            btn_b3.setTitle(String(total), for: .normal)
        }
    }
    
    // Tinh tong
    func sum(p1: Int, p2: Int) -> Int {
        if random3 == 1
        {
            equal = p1 + p2
        }
        else if random3 == 2
        {
            equal = p1 - p2
        }
        else if random3 == 3
        {
            equal = p1 * p2
        }
        else if random3 == 4
        {
            equal = p1 / p2
        }
        
        return equal
    }
    
    
    @IBAction func btn_action(_ sender: UIButton) {
        if (kq == Int((sender.titleLabel?.text)!))
        {
            dem1 += 1
            lbl_Right.text = String(dem1)
        }
        else
        {
            dem2 += 1
            lbl_Wrong.text = String(dem2)
        }
        time = 5
        
        setRandom()
    }
    
    @IBAction func btn_exit(_ sender: UIButton) {
        let vLogin = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        self.navigationController?.pushViewController(vLogin!, animated: true)
    }
    

}
