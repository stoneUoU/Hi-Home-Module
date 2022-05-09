//
//  HiHomeTopBottomCollectionViewCell.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/5/6.
//

import UIKit
import Hi_Kit_Module

class HiHomeTopBottomCollectionViewCell:UICollectionViewCell {
    
    var model = HiHomeSonModel(){
        didSet {
            self.titleLabel.text = model.titleStr;
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUI()
    }
    
    func setUI() {
        
        self.contentView.addSubview(self.iconImageView);
        self.contentView.addSubview(self.titleLabel);
        
        self.setMas();
    }
    
    func setMas() {
        self.iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top)
            make.centerX.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 36.0, height: 36.0))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.iconImageView.snp.bottom).offset(10)
            make.centerX.equalTo(self.contentView)
        }
    }
    
    fileprivate lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.layer.cornerRadius = 18.0;
        iconImageView.layer.masksToBounds = true;
        iconImageView.backgroundColor = UIColor.randomColor;
        return iconImageView
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = HiFont.regular(size: 14.0)
        titleLabel.textAlignment = .center
        titleLabel.textColor = HiColorTitleOne;
        titleLabel.numberOfLines = 0;
        return titleLabel
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
