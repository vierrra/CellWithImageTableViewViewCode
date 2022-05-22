//
//  CellWithImageTableViewCell.swift
//  CellWithImage
//
//  Created by Renato Vieira on 21/05/22.
//

import UIKit

class CellWithImageTableViewCell: UITableViewCell {

    public static let height: CGFloat = 55
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setCell(description: String?,
                        icon: UIImage?,
                        iconColor: UIColor = .darkGray,
                        iconSize: CGSize = CGSize(width: 20, height: 20)) {
        self.textLabel?.text = description
        self.imageView?.image = icon?.reframeImageSize(iconSize)
    }
}

extension UIImage {
    public func reframeImageSize(_ size: CGSize = CGSize(width: 20, height: 20)) -> UIImage {
            UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale);
            self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
            UIGraphicsEndImageContext()
            return newImage
    }
}
