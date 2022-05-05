//
//  HiHomeViewController.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/4/28.
//

import UIKit
import SnapKit

class HiHomeViewController:UIViewController {
    
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
        self.setUI();
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
        self.view.addSubview(self.homeView);
        self.setMas();
    }
        
    func setMas() {
        self.homeView.snp.makeConstraints { make in
            make.edges.equalTo(self.view);
        }
    }
        
    //MARK: lazy load
    lazy var homeView: HiHomeView = {[weak self] in
      let homeView = HiHomeView(frame:.zero)
        homeView.homeViewDelegate = self
        homeView.handle = { [weak self]  in
      }
      return homeView
    }()
}

//MARK: IB-Action
extension HiHomeViewController {
    
}
//MARK: Notice
extension HiHomeViewController {
    
}

//MARK: Delegate
extension HiHomeViewController:HiHomeViewDelegate {
    func toOperate(view: HiHomeView) {
        let pamras: [String: Any] = ["id": "id123", "name": "name123", "image": UIImage()]
        self.pushRouterControllerWithUrl("home://place", parameters: pamras, animated: true) { parameters in
            // 页面参数回调
            print("==========")
            print("页面参数回调")
            print("当前页面: A_Controller")
            print("参数来自: apps://pathA_Detail")
            print("参数内容: \(parameters)")
            print("==========")
        }
    }
}
