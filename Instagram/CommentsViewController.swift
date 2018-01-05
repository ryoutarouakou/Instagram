//
//  CommentsViewController.swift
//  Instagram
//
//  Created by 赤穂亮太郎 on 2018/01/04.
//  Copyright © 2018年 ryoutarou.akou. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var commentsTextField: UITextField!
    
    var postData: PostData?
    
    // コメント投稿ボタンをタップしたときに呼ばれるメソッド
    @IBAction func commentsPostButton(_ sender: Any) {
        
        //postDataをオプショナル型から非オプショナル型にキャスト
        guard let postData = postData else {
            return
        }
        
        // postDataに必要な情報を取得しておく
        let name = Auth.auth().currentUser?.displayName
        
        // Firebaseに保存するデータの準備
        postData.comments.append([name! : commentsTextField.text!])
        
        // 増えたcommentsをFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child((postData.id!))
        let comments = ["comments": postData.comments]
        postRef.updateChildValues(comments)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメント投稿しました")
        
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // コメントキャンセルボタンをタップしたときに呼ばれるメソッド
    @IBAction func commentsCancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
