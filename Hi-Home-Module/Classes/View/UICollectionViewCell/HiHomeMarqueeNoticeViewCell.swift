//
//  HiHomeMarqueeNoticeView.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/5/6.
//

import Foundation
import Hi_Kit_Module

class HiHomeMarqueeNoticeViewCell:HiMarqueeViewCell {
    
    var model = HiHomeSonModel(){
        didSet {
            self.titleLabel.text = model.iconUrl;
            self.projectLabel.text = model.titleStr;
        }
    }
    
    override required init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier);
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(self.titleLabel);
        self.addSubview(self.projectLabel);
        self.addSubview(self.arrowImageView);
        
        self.setMas();
    }
    
    func setMas() {
        self.arrowImageView.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-12)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize.init(width: 12.0, height: 12.0))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(8)
            make.left.equalTo(self.snp.left).offset(16);
        }
        self.projectLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-8)
            make.left.equalTo(self.snp.left).offset(16);
        }
    }
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = HiFont.medium(size: 14)
        titleLabel.textAlignment = .center
        titleLabel.textColor = HiColorTitleOne;
        titleLabel.numberOfLines = 0;
        return titleLabel
    }()
    
    fileprivate lazy var projectLabel: UILabel = {
        let projectLabel = UILabel()
        projectLabel.font = HiFont.medium(size: 12.0)
        projectLabel.textAlignment = .center
        projectLabel.textColor = HiColorTitleThree;
        projectLabel.numberOfLines = 0;
        return projectLabel
    }()
    
    fileprivate lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage.hi_image(named: "hi_home_arrow.png", moduled: "Hi_Home_Module")
        return arrowImageView
    }()
}
