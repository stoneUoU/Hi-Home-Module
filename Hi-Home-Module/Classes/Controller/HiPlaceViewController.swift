//
//  HiPlaceViewController.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/4/29.
//

import UIKit
import SnapKit
import Hi_Kit_Module
import Hi_Router_Module

public class HiPlaceViewController:HiBaseViewController {
    
    /* 传参演示 */
    private var id: String = ""
    private var name: String = ""
    private var image: UIImage?
    
    /* 参数回调 */
    private var callBackParameters: (([String : Any]) -> Void)?
    
    //MARK: LifeCycle
    deinit {
            
    }
        
    // 当加载视图结束时调用该方法
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        self.setUI();
    }
        
    //MARK: Public Method
      
    //MARK: Private Method

    func setUI() {
        self.setStatusAndNavigationUI(centerLabelTitle: "Hi-Home-Module", rightButtonTitle: "", ifWhiteIMV: false, navigationColor: .white, centerLabelColor: .black, rightButtonColor: .black, ifLine: true);
        self.view.addSubview(self.excuteImageView)
        self.view.addSubview(self.excuteButton)
        self.setMas();
    }
        
    func setMas() {
        self.excuteButton.snp.makeConstraints { make in
            make.center.equalTo(self.view);
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH - 32, height: 44));
        }
        self.excuteImageView.snp.makeConstraints { make in
            make.bottom.equalTo(self.excuteButton.snp.top).offset(-32);
            make.centerX.equalTo(self.view);
        }
    }
    
    @objc lazy var excuteButton: UIButton = {
        let excuteButton = UIButton.init(type: UIButton.ButtonType.custom)
        excuteButton.setTitle("跳转", for: UIControl.State.normal)
        excuteButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        excuteButton.setTitleColor(.black, for: .normal)
        excuteButton.layer.borderWidth = 0.5;
        excuteButton.layer.borderColor = UIColor.lightGray.cgColor;
        excuteButton.layer.cornerRadius = 22;
        excuteButton.layer.masksToBounds = true;
        excuteButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return excuteButton;
    }()
    @objc lazy var excuteImageView: UIImageView = {
        let excuteImageView = UIImageView();
        excuteImageView.image = UIImage.hi_image(named: "hi_qrcode.png", moduled: "Hi_Home_Module");
        return excuteImageView;
    }()
}

//MARK: IB-Action
extension HiPlaceViewController {
    
    open override func toLeft(_ sender :UIButton) {
        self.callBackParameters?(["deinit": "Hi", "params": "页面参数"])
        self.navigationController?.popViewController(animated: true);
    }
    
    @objc func toExcute(_ sender: UIButton) {
        
        self.presentRouterControllerWithUrl("home://present")
    }
}
//MARK: Notice
extension HiPlaceViewController {
    /**
     重写该方法进行参数获取
     
     - parameter parameters: 传入的参数
     - parameter callBackParameters: 数据回调
     */
    public override class func routerController(_ parameters: [String : Any]? = nil, callBackParameters: (([String : Any]) -> Void)? = nil) -> UIViewController? {
        if let id = parameters?["id"] as? String,
           let name = parameters?["name"] as? String { // 拿取参数
            let vc = HiPlaceViewController();
            vc.id = id;
            vc.name = name;
            vc.image = parameters?["image"] as? UIImage
            vc.callBackParameters = callBackParameters
            return vc
        } else {
            return nil
        }
    }
}

//MARK: Delegate
extension HiPlaceViewController {
    
}

