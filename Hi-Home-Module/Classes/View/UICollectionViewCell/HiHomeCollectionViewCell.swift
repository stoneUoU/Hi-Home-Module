//
//  HiHomeCollectionViewCell.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/5/6.
//

import UIKit
import Hi_Kit_Module

class HiHomeCollectionViewCell:UICollectionViewCell {
    
    var model = HiHomeSonModel(){
        didSet {
            self.companyLabel.text = model.iconUrl;
            self.projectLabel.text = model.titleStr;
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUI()
    }
    
    func setUI() {
        let bjViewImage = UIImage.hi_image(named: "hi_home_top_bg.png", moduled: "Hi_Home_Module");
        self.contentView.layer.contents = bjViewImage.cgImage;
        
        self.contentView.addSubview(self.companyLabel);
        self.contentView.addSubview(self.projectLabel);
        
        self.setMas();
    }
    
    func setMas() {
        self.companyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(32)
            make.centerX.equalTo(self.contentView)
        }
        self.projectLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-48)
            make.centerX.equalTo(self.contentView)
        }
    }
    
    fileprivate lazy var companyLabel: UILabel = {
        let companyLabel = UILabel()
        companyLabel.font = HiFont.medium(size: 24)
        companyLabel.textAlignment = .center
        companyLabel.textColor = HiColorWhite;
        companyLabel.numberOfLines = 0;
        return companyLabel
    }()
    
    fileprivate lazy var projectLabel: UILabel = {
        let projectLabel = UILabel()
        projectLabel.font = HiFont.medium(size: 24.0)
        projectLabel.textAlignment = .center
        projectLabel.textColor = HiColorWhite;
        projectLabel.numberOfLines = 0;
        return projectLabel
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
