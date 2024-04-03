//
//  HiFilingViewController.swift
//  Hi-Helper-Module
//
//  Created by stone on 2024/4/3.
//

import UIKit
import SwiftyJSON
import HandyJSON
import MBProgressHUD
import Hi_Kit_Module
import Hi_Router_Module
import Hi_Helper_Module
import Hi_Network_Module

class HiFilingViewController:HiBaseViewController {
    
    /* 传参演示 */
    private var age: Int = 0
    private var name: String = ""
    
    /* 参数回调 */
    private var callBackParameters: (([String : Any]) -> Void)?
    
    //MARK: LifeCycle
    deinit {
            
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
        
    //视图初始化
    override func loadView() {
        super.loadView()
    }
    
    var hiSiteHandyJSONModel:HiSiteHandyJSONModel?
        
    // 当加载视图结束时调用该方法
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = HiColorWhite;
        self.setStatusAndNavigationUI(centerLabelTitle: "", rightButtonTitle: "", ifWhiteIMV: true, navigationColor: UIColor.color_HexStr("#3CA0F6"), centerLabelColor: .black, rightButtonColor: .black, ifLine: false);
        self.setUI()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.fetchDatas { boolean in
            };
//        }
    }
    
    func fetchDatas(callback:@escaping (_ isBoolean:Bool)->()) {
        var params = Dictionary<String,Any>();
        HiAPI.request(.fetchSite(params), success: { json in
            let dataHandyJSON:[String : Any] = JSON(json)["data"].rawValue as! [String : Any];
            if let handyJSON:HiSiteHandyJSONModel = HiSiteHandyJSONModel.deserialize(from: dataHandyJSON) {
            }
            callback(true);
        }, error: { statusCode in
            callback(true);
        }, failure: { error in
            callback(true);
        })
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
        super.viewDidDisappear(animated)
    }
        
    // 当接收到内存警告时会执行这个方法
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    //MARK: Public Method
      
    //MARK: Private Method

    func setUI() {
        self.view.addSubview(self.topImageView);
        self.view.addSubview(self.hiFilingCardView);
        self.setMas();
    }
        
    func setMas() {
        self.topImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(HiStatusBarAndNavigationBarH);
            make.left.right.equalTo(self.view);
        }
        self.hiFilingCardView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(HiStatusBarAndNavigationBarH+90);
            make.centerX.equalTo(self.view);
            make.size.equalTo(CGSize(width: HiSCREENWIDTH - 32, height: 154))
        }
    }
    lazy var topImageView:UIImageView = {
        let topImageView = UIImageView();
        topImageView.image = UIImage.hi_image(named: "hi_filing.png", moduled: "Hi_Home_Module")
        return topImageView
    }()
    lazy var hiFilingCardView:HiFilingCardView = {
        let hiFilingCardView = HiFilingCardView();
        hiFilingCardView.backgroundColor = HiColorWhite;
        hiFilingCardView.layer.cornerRadius = 8;
        hiFilingCardView.layer.shadowColor = HiColorBackGround.cgColor;
        hiFilingCardView.layer.shadowOffset = CGSize.init(width: 0, height: 6);
        hiFilingCardView.layer.shadowOpacity = 1;
        hiFilingCardView.layer.shadowRadius = 8;
        return hiFilingCardView
    }()
}

//MARK: IB-Action
extension HiFilingViewController {
    override func toLeft(_ sender: UIButton) {
        self.callBackParameters?(["deinit": "Hi", "params": "页面参数"])
        super.toLeft(sender);
    }
}
//MARK: Notice
extension HiFilingViewController {
    
}
//MARK: Delegate
extension HiFilingViewController{
    
}

extension HiFilingViewController {
    @objc func toFreshFunc(){
    }
}

extension HiFilingViewController {
    /**
     重写该方法进行参数获取
     
     - parameter parameters: 传入的参数
     - parameter callBackParameters: 数据回调
     */
    public override class func routerController(_ parameters: [String : Any]? = nil, callBackParameters: (([String : Any]) -> Void)? = nil) -> UIViewController? {
        if let age = parameters?["age"] as? Int,
           let name = parameters?["name"] as? String { // 拿取参数
            let vc = HiFilingViewController();
            vc.name = name;
            vc.age = age;
            vc.callBackParameters = callBackParameters
            return vc
        } else {
            return nil
        }
    }
}



