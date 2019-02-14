//
//  JSUserPageViewController.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/14.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit

class JSUserPageViewController: UIViewController {
    let presenter:JSUserPresentings
    init(presenter: JSUserPresentings) {
        self.presenter = presenter
        super.init(nibName: "JSUserPageViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    deinit {
        print("controller deinit")
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
