//
//  ViewController.swift
//  QRCode
//
//  Created by Asesoftware on 19/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewQRCode: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = "https://docs.google.com/forms/u/5/d/e/1FAIpQLSfSS2TCkhIyC048Ft1o6HLdVBcQaoiNcvjYhk4ALR2B-r2_vQ/viewform?usp=send_form"
        
        let image = generateQRCode(from: url)
        
        imageViewQRCode.image = image
    }

    func generateQRCode(from string: String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3.0, y: 3.0)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
    
}

