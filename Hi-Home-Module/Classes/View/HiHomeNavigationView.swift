//
//  HiHomeNavigationView.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/5/6.
//

import UIKit
import Hi_Kit_Module
import Hi_Router_Module


public typealias HiHomeNavigationViewHandle = () -> Void

class HiHomeNavigationView: UIView {
    
    @objc var handle:HiHomeNavigationViewHandle?
    fileprivate lazy var statusView: UIView = {
        let statusView = UIView()
        statusView.backgroundColor = HiColorWhite;
        return statusView
    }()
    fileprivate lazy var navigationView: UIView = {
        let navigationView = UIView()
        navigationView.backgroundColor = HiColorWhite;
        return navigationView
    }()
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = HiFont.medium(size: 18.0)
        titleLabel.textAlignment = .center
        titleLabel.textColor = HiColorTitleOne;
        titleLabel.numberOfLines = 0;
        titleLabel.text = "易联众民生";
        return titleLabel
    }()
    fileprivate lazy var scanButton: UIButton = {
        let scanButton = UIButton()
        scanButton.setImage(UIImage.hi_image(named: "hi_home_scan.png", moduled: "Hi_Home_Module"), for: .normal);
        scanButton.tag = 0;
        scanButton.addTarget(self, action: #selector(toOperate(_:)), for: .touchUpInside)
        return scanButton
    }()
    
    fileprivate lazy var noticeButton: UIButton = {
        let noticeButton = UIButton()
        noticeButton.setImage(UIImage.hi_image(named: "hi_home_notice.png", moduled: "Hi_Home_Module"), for: .normal);
        noticeButton.tag = 0;
        noticeButton.addTarget(self, action: #selector(toOperate(_:)), for: .touchUpInside)
        return noticeButton
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        self.setUI()
    }
    func setUI() {
        self.addSubview(self.statusView)
        self.addSubview(self.navigationView)
        self.navigationView.addSubview(self.scanButton)
        self.navigationView.addSubview(self.noticeButton)
        self.navigationView.addSubview(self.titleLabel)
        self.setMas()
    }
    
    func setMas() {
        self.statusView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self)
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH, height: HiStatusBarH))
        }
        self.navigationView.snp.makeConstraints { (make) in
            make.top.equalTo(self.statusView.snp.bottom)
            make.left.equalTo(self);
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH, height: HiNavigationBarH))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.navigationView);
        }
        self.scanButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.navigationView.snp.top)
            make.right.equalTo(self.navigationView.snp.right)
            make.size.equalTo(CGSize.init(width: HiNavigationBarH, height: HiNavigationBarH))
        }
        self.noticeButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.navigationView.snp.top)
            make.right.equalTo(self.scanButton.snp.left)
            make.size.equalTo(CGSize.init(width: HiNavigationBarH, height: HiNavigationBarH))
        }
    }
    
    @objc func toOperate(_ sender : UIButton) {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
