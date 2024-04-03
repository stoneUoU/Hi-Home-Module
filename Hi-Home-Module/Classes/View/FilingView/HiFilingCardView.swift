//
//  HiFilingCardView.swift
//  Hi-Helper-Module
//
//  Created by stone on 2024/4/3.
//

import UIKit
import Hi_Kit_Module
import Hi_Router_Module


public typealias HiFilingCardViewHandle = (_ index:Int) -> Void

class HiFilingCardView: UIView {
    
    @objc var handle:HiFilingCardViewHandle?
    fileprivate lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage.hi_image(named: "hi_home_bell.png", moduled: "Hi_Home_Module")
        return iconImageView
    }()
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = HiFont.medium(size: 14)
        titleLabel.textAlignment = .center
        titleLabel.textColor = HiColorTitleOne;
        titleLabel.numberOfLines = 0;
        // 创建一个NSAttributedString
        let attributedString = NSMutableAttributedString(string: "已有 3898982 人成功完成异地就医")
        // 给一部分文本设置属性
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: HiColorBlueView,
            .font: HiFont.medium(size: 16)
        ]
        attributedString.addAttributes(attributes, range: NSRange(location: 2, length: 9))
        titleLabel.attributedText = attributedString
        return titleLabel
    }()
    fileprivate lazy var openButton: UIButton = {
        let openButton = UIButton()
        openButton.titleLabel?.font = HiFont.regular(size:18)
        openButton.backgroundColor = UIColor.color_HexStr("#FAB64F");
        openButton.setTitleColor(HiColorWhite, for: .normal)
        openButton.setTitle("自助开通", for: .normal)
        openButton.layer.masksToBounds = true;
        openButton.layer.cornerRadius = 20;
        openButton.tag = 0;
        openButton.addTarget(self, action: #selector(toOperate(_:)), for: .touchUpInside)
        return openButton
    }()
    fileprivate lazy var filingButton: UIButton = {
        let filingButton = UIButton()
        filingButton.titleLabel?.font = HiFont.regular(size:18)
        filingButton.backgroundColor = HiColorCodeBlue;
        filingButton.setTitleColor(HiColorWhite, for: .normal)
        filingButton.setTitle("在线备案", for: .normal)
        filingButton.layer.masksToBounds = true;
        filingButton.layer.cornerRadius = 20;
        filingButton.tag = 1;
        filingButton.addTarget(self, action: #selector(toOperate(_:)), for: .touchUpInside);
        return filingButton
    }()
    fileprivate lazy var toDoBtn: UIButton = {
        let toDoBtn = UIButton()
        toDoBtn.titleLabel?.font = HiFont.regular(size:14)
        toDoBtn.setTitleColor(HiColorTitleTwo, for: .normal)
        toDoBtn.setImageAndTitle(image: UIImage.hi_image(named: "hi_home_arrow.png", moduled: "Hi_Home_Module"), title: "查看操作指南", type: .PositionRight, Space: 12)
        toDoBtn.tag = 2;
        toDoBtn.addTarget(self, action: #selector(toOperate(_:)), for: .touchUpInside);
        return toDoBtn
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        self.setUI()
    }
    func setUI() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.iconImageView)
        self.addSubview(self.openButton)
        self.addSubview(self.filingButton)
        self.addSubview(self.toDoBtn)
        self.setMas()
    }
    
    func setMas() {
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(24)
            make.centerX.equalTo(self)
        }
        self.iconImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.titleLabel)
            make.right.equalTo(self.titleLabel.snp.left).offset(-6);
        }
        self.openButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(19)
            make.left.equalTo(self.snp.left).offset(32)
            make.size.equalTo(CGSize(width: (HiSCREENWIDTH - 112)/2,height: 40))
        }
        self.filingButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(19)
            make.right.equalTo(self.snp.right).offset(-32)
            make.size.equalTo(CGSize(width: (HiSCREENWIDTH - 112)/2,height: 40))
        }
        self.toDoBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-16)
            make.centerX.equalTo(self)
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
