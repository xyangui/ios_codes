//
//  ViewController.swift
//  PhotoVideo
//
//  Created by q on 2017/1/29.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    1.在项目中找到info.plist文件，右键点击以 Source Code形式打开
//    2.添加以下键值对，这里以 PhotoLibrary 作为例子
//    
//    <key>NSPhotoLibraryUsageDescription</key>
//    <string>此 App 需要您的同意才能读取媒体资料库</string>
//    
//    另外附送几个 key/value
//    <key>NSCameraUsageDescription</key>
//    <string>cameraDesciption</string>
//    
//    <key>NSContactsUsageDescription</key>
//    <string>contactsDesciption</string>
//    
//    <key>NSMicrophoneUsageDescription</key>
//    <string>microphoneDesciption</string>
    
    
    @IBAction func selectAction(_ sender: Any) {
        
        let alertSheet = UIAlertController(title: "请选择", message: nil, preferredStyle: .actionSheet)
        
        let actionTakePicture = UIAlertAction.init(title: "拍照", style: .default, handler: { (UIAlertAction) -> Void in
            
            self.initWithImagePickView(type: "拍照")
        })
        let actionChoosePicture = UIAlertAction.init(title: "相册", style: .default, handler: { (UIAlertAction) -> Void in
            
            self.initWithImagePickView(type: "相册")
        })
        let actionMovie = UIAlertAction.init(title: "录像", style: .default, handler: { (UIAlertAction) -> Void in
            
            self.initWithImagePickView(type: "录像")
        })
        let actionCancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        
        alertSheet.addAction(actionTakePicture)
        alertSheet.addAction(actionChoosePicture)
        alertSheet.addAction(actionMovie)
        alertSheet.addAction(actionCancel)
        
        self.present(alertSheet, animated: true, completion: nil)
    }

    var imagePicker: UIImagePickerController!
    
    func initWithImagePickView(type: NSString){
        
        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate      = self;
        self.imagePicker.allowsEditing = true;
        
        switch type{
        case "拍照":
            self.imagePicker.sourceType = .camera
            break
        case "相册":
            self.imagePicker.sourceType = .photoLibrary
            break
        case "录像":
            self.imagePicker.sourceType = .camera
            self.imagePicker.videoMaximumDuration = 60 * 3
            self.imagePicker.videoQuality = .type640x480
            self.imagePicker.mediaTypes = [String("kUTTypeMovie")]
            break
        default:
            print("error")
        }
        
        present(self.imagePicker, animated: true, completion: nil)
    }
    
    weak var imageView: UIImageView!
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        let compareResult = CFStringCompare(mediaType as NSString!, String("kUTTypeMovie") as CFString!, CFStringCompareFlags.compareCaseInsensitive)
        
        if compareResult == CFComparisonResult.compareEqualTo {
            
            let moviePath = info[UIImagePickerControllerMediaURL] as? NSURL
            //获取路径
            let moviePathString = moviePath!.relativePath
            
            if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePathString!){
                
                UISaveVideoAtPathToSavedPhotosAlbum(moviePathString!, nil, nil, nil)
            }
            
            print("视频")
        } else {
            
            print("图片")
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            self.imageView.image =  image;
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
}

