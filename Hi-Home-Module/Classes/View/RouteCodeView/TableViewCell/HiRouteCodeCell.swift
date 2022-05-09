//
//  HiRouteCodeCell.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit
import Hi_Kit_Module
import Hi_Router_Module

class HiRouteCodeCell: UITableViewCell {
    
    /**
     * 0 : 绿码
     * 1 : 橙码
     * 2 : 红码
     */
    var clickNum:Int = 0;
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = HiColorRouteCode;
        self.setUI();
        self.codeView.clickNum = 0;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.codeInfoView);
        self.bgView.addSubview(self.codeView);
        self.bgView.addSubview(self.bottomView);
        
        self.setMas();
    }
    
    func setMas() {
    }
    
    lazy var bgView:UIView = {[weak self] in
        let bgView = UIView()
        bgView.frame = CGRect.init(x: 24, y: 0, width: HiSCREENWIDTH - 48, height: 556)
        bgView.backgroundColor = HiColorWhite;
        bgView.layer.masksToBounds = true;
        bgView.layer.cornerRadius = 12.0;
        bgView.layer.shadowColor = UIColor.init(56/255.0, 136/255.0, 221/255.0, 0.1).cgColor;
        bgView.layer.shadowOffset = CGSize.init(width: 0, height: 6);
        bgView.layer.shadowOpacity = 1;
        bgView.layer.shadowRadius = 12;
        return bgView
    }()
    
    lazy var codeInfoView:HiRouteCodeCellInfoView = {[weak self] in
        var codeInfoView = HiRouteCodeCellInfoView()
        codeInfoView.frame = CGRect.init(x: 0, y: 0, width: HiSCREENWIDTH - 48, height: 76);
        codeInfoView.handle = {
           () -> Void in
//            self?.clickNum = self!.clickNum+1;
//            if (self!.clickNum>2) {
//                self?.clickNum = 0;
//            }
//            self?.codeView.clickNum = self!.clickNum;
        }
        return codeInfoView
    }()
    
    lazy var codeView:HiRouteCodeCellView = {[weak self] in
        var codeView = HiRouteCodeCellView()
        codeView.frame = CGRect.init(x: 16, y: 76, width: HiSCREENWIDTH - (48+32), height: 380);
        return codeView
    }()
    
    lazy var bottomView:HiRouteCodeCellBottomView = {[weak self] in
        var bottomView = HiRouteCodeCellBottomView()
        bottomView.frame = CGRect.init(x: 0, y: 456, width: HiSCREENWIDTH - 48, height: 100);
        return bottomView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension HiRouteCodeCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}


