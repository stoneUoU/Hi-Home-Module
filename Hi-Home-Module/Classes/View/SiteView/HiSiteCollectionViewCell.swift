//
//  HiSiteCollectionViewCell.swift
//  Hi-Home-Module
//
//  Created by stone on 2024/4/2.
//

import UIKit
import Hi_Kit_Module

class HiSiteCollectionViewCell:UICollectionViewCell {
    
    var model = HiSiteHandyJSONModelOpenList(){
        didSet {
            self.titleLabel.text = model.areaName;
//            if (model.indexTag == 8) {
                self.arrowImageView.image =  UIImage.hi_image(named: "hi_highlight_arrow.png", moduled: "Hi_Home_Module")
                self.currentImageView.image =  UIImage.hi_image(named: "hi_highlight.png", moduled: "Hi_Home_Module")
//            } else {
//                self.arrowImageView.image =  UIImage.hi_image(named: " ", moduled: "Hi_Home_Module")
//                self.currentImageView.image =  UIImage.hi_image(named: " ", moduled: "Hi_Home_Module")
//            }
            self.startAnimation();
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUI()
    }
    
    func setUI() {
        self.contentView.addSubview(self.arrowImageView);
        self.contentView.addSubview(self.currentImageView);
        self.contentView.addSubview(self.iconImageView);
        self.contentView.addSubview(self.titleLabel);
        
        self.setMas();
    }
    
    func setMas() {
        self.arrowImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top)
            make.centerX.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 62, height: 62))
        }
        self.currentImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top)
            make.centerX.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 62, height: 62))
        }
        self.iconImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self.currentImageView)
            make.size.equalTo(CGSize.init(width: 42, height: 42))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.iconImageView.snp.bottom).offset(12)
            make.left.equalTo(self.contentView.snp.left).offset(3)
            make.right.equalTo(self.contentView.snp.right).offset(-3)
        }
    }
    
    func startAnimation() {
        let basicAnimation = CABasicAnimation(keyPath:"transform.rotation.z");
        basicAnimation.toValue = M_PI*2.0;
        basicAnimation.duration = 2.0;
        basicAnimation.isCumulative = true;
        basicAnimation.repeatCount = HUGE
        self.currentImageView.layer.add(basicAnimation, forKey: "rotationAnimation");
    }
    
//    - (void)startAnimation {
//        CABasicAnimation* rotationAnimation;
//        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
//        rotationAnimation.duration = 2.0;
//        rotationAnimation.cumulative = YES;
//        rotationAnimation.repeatCount = ULLONG_MAX;
//        [self.currentImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
//    }
    
    fileprivate lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        return arrowImageView
    }()
    fileprivate lazy var currentImageView: UIImageView = {
        let currentImageView = UIImageView()
        return currentImageView
    }()
    fileprivate lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.layer.cornerRadius = 21.0;
        iconImageView.layer.masksToBounds = true;
        iconImageView.backgroundColor = UIColor.randomColor;
        return iconImageView
    }()
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = HiFont.regular(size: 14.0)
        titleLabel.textAlignment = .center
        titleLabel.textColor = HiColorTitleOne;
        titleLabel.numberOfLines = 1;
        return titleLabel
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

