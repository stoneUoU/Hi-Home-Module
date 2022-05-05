//
//  HiHomeView.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/4/28.
//

import UIKit
import SnapKit
import Hi_Router_Module

typealias HiHandle = () -> Void

protocol HiHomeViewDelegate: AnyObject {
    func toOperate(view:HiHomeView)
}
class HiHomeView: UIView {
    var handle: HiHandle?
    weak var homeViewDelegate : HiHomeViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white;
        self.setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: Public Method
    //MARK: Private Method
    //MARK: lazy load
    
    @objc lazy var excuteButton: UIButton = {
        let excuteButton = UIButton.init(type: UIButton.ButtonType.custom)
        excuteButton.setTitle("Hi-Home-Module", for: UIControl.State.normal)
        excuteButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        excuteButton.setTitleColor(.black, for: .normal)
        excuteButton.layer.borderWidth = 0.5;
        excuteButton.layer.borderColor = UIColor.lightGray.cgColor;
        excuteButton.layer.cornerRadius = 22;
        excuteButton.layer.masksToBounds = true;
        excuteButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return excuteButton;
    }()
    
}
    
//MARK: Public Method
extension HiHomeView {
    func setUI() {
        self.addSubview(self.excuteButton);
        self.setMas()
    }
    func setMas() {
        self.excuteButton.snp.makeConstraints { make in
            make.center.equalTo(self);
            make.size.equalTo(CGSize.init(width: SCREENWIDTH - 32, height: 44));
        }
    }
}


//MARK: IB-Action
extension HiHomeView {
    @objc func toExcute(_ sender: UIButton) {
//        print(sender.titleLabel?.text);
        self.homeViewDelegate?.toOperate(view: self);
    }
}
    
//MARK: Notice
extension HiHomeView {
    
}
    
//MARK: Delegate
extension HiHomeView {

}
