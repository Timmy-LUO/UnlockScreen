//
//  ViewController.swift
//  UnlockScreen
//
//  Created by 羅承志 on 2021/5/4.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passcodeImageView1: UIImageView!
    @IBOutlet weak var passcodeImageView2: UIImageView!
    @IBOutlet weak var passcodeImageView3: UIImageView!
    @IBOutlet weak var passcodeImageView4: UIImageView!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    let passcode = "1234"
    var entercode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 數字鍵全部拉在同一個 IBAction
    @IBAction func numberButton(_ sender: UIButton) {
        
        entercode.append("\(sender.tag)")
        
        passcodeImage()
        codeCorrect()
        
    }
    
    // 刪除密碼
    @IBAction func deleteButton(_ sender: Any) {
        if entercode.count > 0 && entercode.count < 5 {
                    
            entercode.removeLast()
        }
                
            deletecode()
    }
    
    
    
    // 判斷輸入的密碼是否正確
    func codeCorrect() {
        if entercode.count == 4 {
            if entercode == passcode {
                resultLabel.text = "密 碼 正 確"
                clearCode()
            } else {
                resultLabel.text = "密碼錯誤，重新輸入"
                clearCode()
            }
        }
    }
    
    
    // 清除輸入的密碼
    func clearCode() {
        entercode = ""
        passcodeImageView1.image = UIImage(systemName: "circle")
        passcodeImageView2.image = UIImage(systemName: "circle")
        passcodeImageView3.image = UIImage(systemName: "circle")
        passcodeImageView4.image = UIImage(systemName: "circle")
    }
    
    
    // 輸入密碼的圖片
    func passcodeImage() {
        let imageIndex = entercode.count
        switch imageIndex {
            case 1:
                passcodeImageView1.image = UIImage(systemName: "circle.fill")
            case 2:
                passcodeImageView2.image = UIImage(systemName: "circle.fill")
            case 3:
                passcodeImageView3.image = UIImage(systemName: "circle.fill")
            case 4:
                passcodeImageView4.image = UIImage(systemName: "circle.fill")
            default:
                codeCorrect()
                
            
        }
    }
    
    // 刪除密碼的圖片
    func deletecode() {
            
        let Delcode = entercode.count + 1
            
        switch Delcode {
            
            case 3:
                passcodeImageView3.image = UIImage(systemName: "circle")
            case 2:
                passcodeImageView2.image = UIImage(systemName: "circle")
            case 1:
                passcodeImageView1.image = UIImage(systemName: "circle")
            default:
                    break
            }
        }
    
}

