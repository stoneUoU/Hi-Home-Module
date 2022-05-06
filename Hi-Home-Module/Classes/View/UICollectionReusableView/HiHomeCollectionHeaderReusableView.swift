//
//  HiHomeCollectionHeaderReusableView.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/5/6.
//

import UIKit
import SnapKit
import Hi_Kit_Module

public typealias HiHomeCollectionHeaderReusableViewHandle = (_ sender:UIButton)->Void

class HiHomeCollectionHeaderReusableView:UICollectionReusableView {
    
    var handle:HiHomeCollectionHeaderReusableViewHandle?

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUI();
    }
    
    func setUI() {
        self.addSubview(self.sectionButton)
        self.setMas();
    }
    
    func setMas() {
        self.sectionButton.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self.snp.left).offset(16)
        }
    }
    
    lazy var  sectionButton:UIButton = {
        let  sectionButton =  UIButton()
        sectionButton.titleLabel?.font = HiFont.bold(size: 18.0);
        sectionButton.setTitleColor(HiColorTitleOne, for: .normal);
        sectionButton.contentHorizontalAlignment = .left;
        sectionButton.addTarget(self, action: #selector(self.addClickListener(sender:)), for: .touchUpInside)
        return sectionButton
    }()
    
    @objc func addClickListener(sender: UIButton) {
        guard let handle = self.handle else { return }
        handle(sender);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

