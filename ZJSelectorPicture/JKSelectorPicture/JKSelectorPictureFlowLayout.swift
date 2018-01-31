//
//  JKSelectorPictureFlowLayout.swift
//  ZJSelectorPicture
//
//  Created by 周佳 on 2018/1/31.
//  Copyright © 2018年 zhoujia. All rights reserved.
//

import UIKit

// MARK: 屏幕的宽高
let JKscreenW: CGFloat = UIScreen.main.bounds.width
let JKscreenH: CGFloat = UIScreen.main.bounds.height
class JKSelectorPictureFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        itemSize = CGSize(width:(JKscreenW - 41)/3.0,height:100)
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
        sectionInset = UIEdgeInsets(top:10,left:10,bottom:10,right:10)
    }
}
