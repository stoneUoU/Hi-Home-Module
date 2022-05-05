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

class HiPlaceViewController:UIViewController {
    
    /* 传参演示 */
    private var id: String = ""
    private var name: String = ""
    private var image: UIImage?
    
    /* 参数回调 */
    private var callBackParameters: (([String : Any]) -> Void)?
    
    //MARK: LifeCycle
    deinit {
            
    }

    //视图初始化
    override func loadView() {
        super.loadView()
    }
        
    // 当加载视图结束时调用该方法
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green;
        self.setUI();
        print(id);
    }
        
    // 视图将要显示时调用该方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
    // 当视图已经显示时调用该方法
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
        
    // 当视图将要消失时调用该方法
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
        
    // 当时图已经消失时调用该方法
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
        
    // 当接收到内存警告时会执行这个方法
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    //MARK: Public Method
      
    //MARK: Private Method

    func setUI() {
        self.view.addSubview(self.excuteButton)
        self.setMas();
    }
        
    func setMas() {
        self.excuteButton.snp.makeConstraints { make in
            make.center.equalTo(self.view);
            make.size.equalTo(CGSize.init(width: SCREENWIDTH - 32, height: 44));
        }
    }
    
    @objc lazy var excuteButton: UIButton = {
        let excuteButton = UIButton.init(type: UIButton.ButtonType.custom)
        excuteButton.setTitle("返回", for: UIControl.State.normal)
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

//MARK: IB-Action
extension HiPlaceViewController {
    @objc func toExcute(_ sender: UIButton) {
        self.callBackParameters?(["deinit": "A_DetailController", "params": "页面参数"])
    }
}
//MARK: Notice
extension HiPlaceViewController {
    
}

//MARK: Delegate
extension HiPlaceViewController {
    
}

