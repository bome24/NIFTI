//
//  ViewController.swift
//  QRCodeMaker
//
//  Created by 김태우 on 2022/07/28.
//

import UIKit
import PinLayout
import QRCode

class QRCodeMakerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        var qrCode = QRCode(string: "www.google.com")
        qrCode!.color = UIColor.black
        qrCode!.backgroundColor = UIColor.white
        qrCode!.size = CGSize(width: 200, height: 200)
        qrCode!.scale = 1.0
        qrCode!.inputCorrection = .quartile
        
        let imageView = UIImageView.init(qrCode: qrCode! as QRCode)
        
        self.view.addSubview(imageView)
        
        imageView.pin.horizontally().top(30%).width(200).justify(.center)
        
        imageView.pin.height(200)
    }

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIImageView {
    convenience init(qrCode: QRCode) {
        self.init(image: qrCode.unsafeImage)
    }
}


