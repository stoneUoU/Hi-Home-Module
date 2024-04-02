//
//  HiSignTableHeaderView.swift
//  Hi-Home-Module
//
//  Created by stone on 2024/4/2.
//

import UIKit
import Hi_Kit_Module
import Hi_Router_Module

public typealias HiSignTableHeaderViewHandle = (_ index:Int) -> Void

class HiSignTableHeaderView: UIView {
    
    @objc var handle:HiSignTableHeaderViewHandle?
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = HiFont.medium(size: 14.0)
        titleLabel.textAlignment = .center
        titleLabel.textColor = HiColorTitleOne;
        titleLabel.numberOfLines = 0;
        return titleLabel
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        self.setUI()
    }
    func setUI() {
        self.addSubview(self.titleLabel)
        self.setMas()
    }
    
    func setMas() {
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self);
            make.left.equalTo(self.snp.left).offset(16);
        }
    }
    
    @objc func toOperate(_ sender : UIButton) {
        print("\(sender.tag)");
        guard let handle = self.handle else {
            return
        }
        handle(sender.tag);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

