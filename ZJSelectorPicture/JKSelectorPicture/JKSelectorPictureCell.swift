//
//  JKSelectorPictureCell.swift
//  ZJSelectorPicture
//
//  Created by 周佳 on 2018/1/31.
//  Copyright © 2018年 zhoujia. All rights reserved.
//

import UIKit

@objc
protocol JKSelectorPictureCellDelegate : NSObjectProtocol {
    @objc optional func photoDidAddSelector(cell:JKSelectorPictureCell)
    @objc optional func photoDidDeleteSelector(cell:JKSelectorPictureCell)
}

class JKSelectorPictureCell: UICollectionViewCell {
    weak var JKPhotoCellDelegate: JKSelectorPictureCellDelegate?
    var image:UIImage?
    {
        didSet{
            if image != nil{
                deleteBtn.isHidden = false
                addBtn.setImage(image!, for: UIControlState.normal)
                addBtn.isUserInteractionEnabled = false
            }else
            {
                deleteBtn.isHidden = true
                addBtn.isUserInteractionEnabled = true
                addBtn.setImage(UIImage(named:"compose_pic_add"), for: UIControlState.normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI()
    {
        contentView.backgroundColor = UIColor.purple
        contentView.addSubview(addBtn)
        addBtn.frame = CGRect(x:0,y:0,width:self.frame.size.width,height:self.frame.size.height)
        contentView.addSubview(deleteBtn)
        deleteBtn.frame = CGRect(x:self.frame.size.width - 40,y:-8,width:48,height:48)
        
        // 2.布局子控件
//        addBtn.translatesAutoresizingMaskIntoConstraints =
//        deleteBtn.translatesAutoresizingMaskIntoConstraints = false

    }
    private lazy var addBtn :UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(JKSelectorPictureCell.addClick), for: UIControlEvents.touchUpInside)
        btn.imageView?.contentMode = UIViewContentMode.scaleAspectFill
        btn.setImage(UIImage(named:"compose_pic_add"), for: UIControlState.normal)
        btn.setImage(UIImage(named:"compose_pic_add_highlighted"), for: UIControlState.highlighted)
        return btn
    }()
    
    // MARK: 删除的按钮
    private lazy var deleteBtn: UIButton = {
        
        let btn = UIButton()
        btn.isHidden = true
        btn .addTarget(self, action: #selector(JKSelectorPictureCell.deleteClick), for: UIControlEvents.touchUpInside)
        btn.setImage(UIImage(named:"compose_photo_close"), for: UIControlState.normal)
        return btn
    }()
    

    @objc func addClick() {
        print(#function)
        JKPhotoCellDelegate?.photoDidAddSelector!(cell: self)
    }
    
    @objc func deleteClick() {
        
        print(#function)
        JKPhotoCellDelegate?.photoDidDeleteSelector!(cell: self)
    }

}
