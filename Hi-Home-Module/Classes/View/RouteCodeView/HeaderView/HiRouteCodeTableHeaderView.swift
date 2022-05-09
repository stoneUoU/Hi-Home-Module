//
//  HiRouteCodeTableHeaderView.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit
import Hi_Kit_Module
import Hi_Router_Module

class HiRouteCodeTableHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Public Method
    //MARK: Private Method
    //MARK: lazy load
    lazy var picImageView: UIImageView = {[weak self] in
        let picImageView = UIImageView()
        picImageView.image = UIImage.hi_image(named: "hi_top_pic.png", moduled: "Hi_Home_Module");
        return picImageView
    }()
    
}
    
//MARK: Public Method
extension HiRouteCodeTableHeaderView {
    func setUI() {
        self.addSubview(self.picImageView)
        
        self.setMas()
    }
    func setMas() {
        self.picImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}
 
