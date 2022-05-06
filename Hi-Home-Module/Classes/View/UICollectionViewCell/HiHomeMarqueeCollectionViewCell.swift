//
//  HiHomeMarqueeCollectionViewCell.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/5/6.
//

import UIKit
import Hi_Kit_Module

class HiHomeMarqueeCollectionViewCell:UICollectionViewCell {
    
    var model = HiHomeModel(){
        didSet {
            self.marqueeView.reloadDataAndStartRoll()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.contentView.backgroundColor = HiColorBackGround;
        self.layer.cornerRadius = 3.0;
        self.layer.masksToBounds = true;
        self.setUI()
    }
    
    func setUI() {
        
        self.contentView.addSubview(self.frontView);
        self.frontView.addSubview(self.newLabel);
        self.frontView.addSubview(self.trendLabel);
        self.contentView.addSubview(self.marqueeView);
        
        self.setMas();
    }
    
    func setMas() {
        self.frontView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(self.contentView)
            make.width.equalTo(55)
        }
        self.newLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.frontView);
            make.bottom.equalTo(self.frontView).offset(-27.5);
        }
        self.trendLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.frontView);
            make.top.equalTo(self.newLabel.snp.bottom);
        }
        self.marqueeView.snp.makeConstraints { (make) in
            make.left.equalTo(self.frontView.snp.right);
            make.top.right.bottom.equalTo(self.contentView)
        }
    }
    
    fileprivate lazy var frontView: UIView = {
        let frontView = UIView()
        frontView.backgroundColor = UIColor.color_HexStr("EFF4FB");
        return frontView
    }()
    
    fileprivate lazy var newLabel: UILabel = {
        let newLabel = UILabel()
        newLabel.font = HiFont.medium(size: 16)
        newLabel.textAlignment = .center
        newLabel.textColor = UIColor.color_HexStr("3B71E8");
        newLabel.numberOfLines = 0;
        newLabel.text = "民生";
        return newLabel
    }()
    
    fileprivate lazy var trendLabel: UILabel = {
        let trendLabel = UILabel()
        trendLabel.font = HiFont.medium(size: 16)
        trendLabel.textAlignment = .center
        trendLabel.textColor = HiColorTitleOne;
        trendLabel.numberOfLines = 0;
        trendLabel.text = "科技";
        return trendLabel
    }()
    
    fileprivate lazy var marqueeView: HiMarqueeView = {
        var marqueeView = HiMarqueeView.init(frame: .zero)
        marqueeView.dataSource = self;
        marqueeView.delegate = self;
        marqueeView.tag = 0;
        marqueeView.register(HiHomeMarqueeNoticeViewCell.self, forCellReuseIdentifier: NSStringFromClass(HiHomeMarqueeNoticeViewCell.self));
        return marqueeView;
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HiHomeMarqueeCollectionViewCell:HiMarqueeViewDelegate,HiMarqueeViewDataSource {
    func numberOfRowsFor(roolingView: HiMarqueeView) -> Int {
        return model.sonModels.count;
    }
    
    func rollingNoticeView(roolingView: HiMarqueeView, cellAtIndex index: Int) -> HiMarqueeViewCell {
        let viewCell:HiHomeMarqueeNoticeViewCell = roolingView.dequeueReusableCell(withIdentifier: NSStringFromClass(HiHomeMarqueeNoticeViewCell.self)) as! HiHomeMarqueeNoticeViewCell;
        let model:HiHomeSonModel = model.sonModels[index];
        model.iconUrl = "民生科技____\(index)";
        model.titleStr = "易联众民生iOS项目框架____\(index)";
        viewCell.model = model;
        return viewCell;
    }
    
    func rollingNoticeView(_ roolingView: HiMarqueeView, didClickAt index: Int) {
        
    }
}

