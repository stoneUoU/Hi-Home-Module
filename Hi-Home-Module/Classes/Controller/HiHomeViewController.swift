//
//  HiHomeViewController.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/4/28.
//

import UIKit
import SnapKit
import Hi_Router_Module
import SwiftyJSON

public class HiHomeViewController:UIViewController {
    
    //MARK: LifeCycle
    deinit {
            
    }
        
    // 当加载视图结束时调用该方法
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI();
        self.homeView.homeModels = self.homeModels;
    }
    
    open override func viewWillAppear(_ animated: Bool){
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
        
    //MARK: Public Method
      
    //MARK: Private Method

    func setUI() {
        self.view.addSubview(self.homeNavigationView);
        self.view.addSubview(self.homeView);
        self.view.bringSubviewToFront(self.homeNavigationView);
        self.setMas();
    }
        
    func setMas() {
        self.homeNavigationView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view);
            make.height.equalTo(HiStatusBarAndNavigationBarH);
        }
        self.homeView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(self.view);
            make.top.equalTo(self.homeNavigationView.snp.bottom);
        }
    }
        
    //MARK: lazy load
    
    lazy var homeNavigationView: HiHomeNavigationView = {[weak self] in
      let homeNavigationView = HiHomeNavigationView()
        homeNavigationView.handle = {(index) in
            print("index = \(index)");
            let pamras: [String: Any] = ["id": "id123", "name": "name123", "image": UIImage()]
            self?.pushRouterControllerWithUrl("home://routeCode", parameters: pamras, animated: true) { parameters in
                // 页面参数回调
                HiLog("==========")
                HiLog("参数内容: \(parameters)");
                HiLog("==========")
            }
        }
      return homeNavigationView
    }()
    
    lazy var homeView: HiHomeView = {[weak self] in
      let homeView = HiHomeView(frame:.zero)
        homeView.homeViewDelegate = self
        homeView.handle = { [weak self]  in
      }
      return homeView
    }()
    
    lazy var homeModels:[HiHomeModel] = {
        var homeModels:[HiHomeModel] = Array<HiHomeModel>();
        for i in 0..<6 {
            var homeModel:HiHomeModel = HiHomeModel();
            homeModel.type = i;
            for j in 0..<((i == 1) ? 7 : 5) {
                let homeSonModel:HiHomeSonModel = HiHomeSonModel();
                homeSonModel.titleStr = "民生科技";
                homeSonModel.iconUrl = "";
                homeSonModel.type = j;
                homeModel.sonModels.append(homeSonModel);
            }
            homeModels.append(homeModel);
        }
        return homeModels;
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
        self.pushRouterControllerWithUrl("home://routeCode", parameters: pamras, animated: true) { parameters in
            // 页面参数回调
            HiLog("==========")
            HiLog("参数内容: \(parameters)");
            HiLog("==========")
        }
    }
    
    func toDo(indexPath: IndexPath) {
        if (indexPath.section == 0) {
            let pamras: [String: Any] = ["name": "iOS开发工程师","age":29];
            self.pushRouterControllerWithUrl("home://sign", parameters: pamras, animated: true) { parameters in
                // 页面参数回调
                HiLog("==========")
                HiLog("参数内容: \(parameters)");
                HiLog("==========")
            }
        }
    }
}
