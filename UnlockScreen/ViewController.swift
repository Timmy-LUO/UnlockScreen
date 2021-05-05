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
    
    var passcode = ""
    var entercode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 數字鍵全部拉在同一個 IBAction
    @IBAction func numberButton(_ sender: UIButton) {
        
        passcode.append("\(sender.tag)")
        
        passcodeImage()
        codeCorrect()
        
    }
    
    // 刪除密碼
    @IBAction func deleteButton(_ sender: Any) {
        if (passcode.count > 0) && (passcode.count < 5) {
                    
            passcode.removeLast()
        }
                
            deletecode()
    }
    
    
    
    // 判斷輸入的密碼是否正確
    func codeCorrect() {
        if passcode.count == 4{
            if passcode == entercode {
                resultLabel.text = "密 碼 正 確"
                // 密碼正確就跳入下一頁指定的畫面
                performSegue(withIdentifier: "pass", sender: self)
            } else {
                resultLabel.text = "密碼錯誤，請重新輸入"
                clearCode()
            }
        }
    }
    
    
    // 清除輸入的密碼
    func clearCode() {
        passcode = ""
        passcodeImageView1.image = UIImage(systemName: "circle")
        passcodeImageView2.image = UIImage(systemName: "circle")
        passcodeImageView3.image = UIImage(systemName: "circle")
        passcodeImageView4.image = UIImage(systemName: "circle")
    }
    
    
    // 輸入密碼的圖片
    func passcodeImage() {
        let imageIndex = passcode.count
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
            
        let Delcode = passcode.count + 1
            
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

