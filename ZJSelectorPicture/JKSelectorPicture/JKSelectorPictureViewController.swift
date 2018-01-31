//
//  JKSelectorPictureViewController.swift
//  ZJSelectorPicture
//
//  Created by 周佳 on 2018/1/31.
//  Copyright © 2018年 zhoujia. All rights reserved.
//

import UIKit
private let JKSelectorPictureReuseIdentifier = "JKSelectorPictureReuseIdentifier"

class JKSelectorPictureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUI()
    {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = true
        collectionView.frame = CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height - 20)
    }
    lazy var collectionView : UICollectionView = {
        let clv = UICollectionView(frame:CGRect.zero,collectionViewLayout:JKSelectorPictureFlowLayout())
        clv.register(JKSelectorPictureCell.self, forCellWithReuseIdentifier: JKSelectorPictureReuseIdentifier)
        clv.backgroundColor = UIColor.white
        clv.dataSource = self
        clv.delegate = self
        return clv
    }()
    private lazy var pictureImages = [UIImage]()
    
    
}

extension JKSelectorPictureViewController : UICollectionViewDataSource,UICollectionViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,JKSelectorPictureCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureImages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JKSelectorPictureReuseIdentifier, for: indexPath) as! JKSelectorPictureCell
        cell.image = (pictureImages.count == indexPath.item) ? nil :pictureImages[indexPath.item]
        cell.JKPhotoCellDelegate = self
        return cell
    }
    func photoDidAddSelector(cell: JKSelectorPictureCell) {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            
            print("不能打开相册")
            return
        }
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func photoDidDeleteSelector(cell: JKSelectorPictureCell) {
        let indexPath = collectionView.indexPath(for: cell)
        pictureImages.remove(at: (indexPath?.item)!)
        collectionView.reloadData()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("info=\(info)")

        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        let newImage = image.imageWithScale(width: 300)
        // 1.将当前选中的图片添加到数组中
        pictureImages.append(newImage)
        print("图片的数量=\(pictureImages.count)")
        collectionView.reloadData()
        // 注意: 如果实现了该方法, 需要我们自己关闭图片选择器
        picker.dismiss(animated: true, completion: nil)

    }
    
    
}

