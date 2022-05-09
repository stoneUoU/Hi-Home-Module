//
//  HiRouteCodeCellLoadingView.swift
//  SwiftProject
//
//  Created by stone on 2022/4/25.
//

import UIKit
import Hi_Kit_Module
import Hi_Router_Module

class HiRouteCodeCellLoadingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(self.iconImageView);
        self.addSubview(self.titleLabel);
        
        self.setMas();
    }
    
    func setMas() {
        self.iconImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.snp.top).offset(54);
            make.centerX.equalTo(self);
            make.size.equalTo(CGSize.init(width: 54, height: 54))
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.iconImageView.snp.bottom).offset(24);
            make.centerX.equalTo(self);
        }
    }
    lazy var iconImageView:UIImageView = {[weak self] in
        var iconImageView = UIImageView()
        iconImageView.image = UIImage.hi_image(named: "hi_qrcode_m_logo.png", moduled: "Hi_Home_Module");
        return iconImageView
    }()
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = HiFont.bold(size: 24);
        titleLabel.textColor = HiColorCodeBlue
        titleLabel.text = "点击出示健康码";
        return titleLabel
    }()
}
