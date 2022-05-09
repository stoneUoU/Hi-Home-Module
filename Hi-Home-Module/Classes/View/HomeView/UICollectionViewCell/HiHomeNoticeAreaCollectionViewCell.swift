//
//  HiHomeNoticeAreaCollectionViewCell.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/5/6.
//

import UIKit
import Hi_Kit_Module

class HiHomeNoticeAreaCollectionViewCell:UICollectionViewCell {
    
    var model = HiHomeSonModel(){
        didSet {
//            self.titleLabel.text = model.titleStr;
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUI()
    }
    
    func setUI() {
        
        self.contentView.addSubview(self.chinaImageView);
        self.contentView.addSubview(self.openAreaImageView);
        self.contentView.addSubview(self.areaLabel);
        self.contentView.addSubview(self.arrowImageView);
        
        self.setMas();
    }
    
    func setMas() {
        self.chinaImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView)
            make.left.equalTo(self.contentView.snp.left).offset(0)
            make.size.equalTo(CGSize.init(width: 104, height: 48))
        }
        self.openAreaImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView)
            make.right.equalTo(self.contentView.snp.right)
            make.size.equalTo(CGSize.init(width: 94, height: 32.0))
        }
        self.arrowImageView.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView.snp.right).offset(-12)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 12.0, height: 12.0))
        }
        self.areaLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.chinaImageView.snp.right).offset(5).priorityLow();
            make.right.equalTo(self.arrowImageView.snp.left).offset( -12);
        }
    }
    
    fileprivate lazy var chinaImageView: UIImageView = {
        let chinaImageView = UIImageView()
        chinaImageView.backgroundColor = UIColor.randomColor;
        return chinaImageView
    }()
    fileprivate lazy var openAreaImageView: UIImageView = {
        let openAreaImageView = UIImageView()
        openAreaImageView.image = UIImage.hi_image(named: "hi_home_icon_area.png", moduled: "Hi_Home_Module");
        return openAreaImageView
    }()
    fileprivate lazy var areaLabel: UILabel = {
        let areaLabel = UILabel()
        areaLabel.font = HiFont.medium(size: 14.0)
        areaLabel.textAlignment = .right
        areaLabel.textColor = HiColorTitleTwo;
        areaLabel.numberOfLines = 0;
        let areaStr:NSMutableAttributedString = NSMutableAttributedString.init(string:"易联众民生科技 作者:Stone")
        areaStr.addAttribute(.foregroundColor, value: HiColorTitleTwo, range:NSRange.init(location: 0, length: 7));
        areaStr.addAttribute(.foregroundColor, value: UIColor .color_HexStr("4285F4"), range:NSRange.init(location: 8, length: 8));
        areaLabel.attributedText = areaStr;
        return areaLabel
    }()
    fileprivate lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage.hi_image(named: "hi_home_color_right.png", moduled: "Hi_Home_Module")
        return arrowImageView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
