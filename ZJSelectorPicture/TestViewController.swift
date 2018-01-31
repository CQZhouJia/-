//
//  TestViewController.swift
//  ZJSelectorPicture
//
//  Created by 周佳 on 2018/1/31.
//  Copyright © 2018年 zhoujia. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initData()
        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUI()
    {
        addChildViewController(jkSelectorPictureVC)
        view.addSubview(jkSelectorPictureVC.view)
    }
    func initData()
    {
        
    }
 
    lazy var jkSelectorPictureVC : JKSelectorPictureViewController = {
        let vc = JKSelectorPictureViewController()
        vc.view.frame = CGRect(x:0,y:20,width:JKscreenW,height:JKscreenH -  20)
        return vc
    }()

}
