//
//  HiHomeCollectionFooterReusableView.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/5/6.
//

import Foundation
import Hi_Kit_Module

class HiHomeCollectionFooterReusableView:UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUI();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(self.sectionLabel)
        self.setMas();
    }
    
    func setMas() {
        self.sectionLabel.snp.makeConstraints { make in
            make.edges.equalTo(self);
        }
    }
    
    lazy var sectionLabel:UILabel = {
        let sectionLabel =  UILabel()
        sectionLabel.font = HiFont.regular(size: 12.0)
        sectionLabel.textColor = HiColorTitleThree;
        sectionLabel.numberOfLines = 1;
        sectionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping;
        sectionLabel.textAlignment = NSTextAlignment.center
        sectionLabel.text = "易联众（民生）科技出品";
        return sectionLabel
    }()
}
