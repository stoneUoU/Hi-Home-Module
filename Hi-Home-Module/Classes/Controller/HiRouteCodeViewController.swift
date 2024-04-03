//
//  HiRouteCodeViewController.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit
import MBProgressHUD
import Hi_Kit_Module
import Hi_Router_Module
import Hi_Helper_Module

class HiRouteCodeViewController:UIViewController {
    
    /* 传参演示 */
    private var id: String = ""
    private var name: String = ""
    private var image: UIImage?
    
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
        
    // 当加载视图结束时调用该方法
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = HiColorWhite;
        self.setUI()
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        //纯文本模式
        hud.mode = .indeterminate;
//        hud.bezelView.backgroundColor = HiColorTitleTwo;
        //设置提示标题
        hud.label.text = "加载中..."
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            hud.hide(animated: true);
            self.routeCodeView.isLoading = false;
            self.routeCodeView.tableView.reloadData();
        }
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
        self.view.addSubview(self.statusView);
        self.view.addSubview(self.navigationView);
        self.navigationView.addSubview(self.titleLabel);
        self.navigationView.addSubview(self.operateView);
        self.operateView.addSubview(self.moreButton);
        self.operateView.addSubview(self.separatorView);
        self.operateView.addSubview(self.shutButton);
        
        self.view.addSubview(self.routeCodeView);
        self.setMas();
    }
        
    func setMas() {
        self.statusView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH, height: HiStatusBarH))
        }
        self.navigationView.snp.makeConstraints { (make) in
            make.top.equalTo(self.statusView.snp.bottom)
            make.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH, height: HiNavigationBarH))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.navigationView);
        }
        self.operateView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.navigationView)
            make.right.equalTo(self.navigationView.snp.right).offset(-16);
            make.size.equalTo(CGSize.init(width: 80, height: 30))
        }
        self.separatorView.snp.makeConstraints { (make) in
            make.center.equalTo(self.operateView)
            make.size.equalTo(CGSize.init(width: 0.5, height: 16))
        }
        self.moreButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.operateView)
            make.right.equalTo(self.separatorView.snp.left).offset(-8);
        }
        self.shutButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.operateView)
            make.left.equalTo(self.separatorView.snp.right).offset(8);
        }
        self.routeCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navigationView.snp.bottom);
            make.left.right.bottom.equalTo(self.view);
        }
    }
        
    //MARK: lazy load
    lazy var statusView: UIView = {[weak self] in
        let statusView = UIView(frame:.zero)
        statusView.backgroundColor = HiColorWhite;
        return statusView
    }()
    lazy var navigationView: UIView = {[weak self] in
        let navigationView = UIView(frame:.zero)
        navigationView.backgroundColor = HiColorWhite;
        return navigationView
    }()
    lazy var titleLabel: UILabel = {[weak self] in
        let titleLabel = UILabel(frame:.zero)
        titleLabel.text = "福建健康码";
        titleLabel.textAlignment = .center
        titleLabel.textColor = HiColorTitleOne;
        titleLabel.font = HiFont.regular(size: 18);
        return titleLabel
    }()
    lazy var operateView: UIView = {[weak self] in
        let operateView = UIView(frame:.zero)
        operateView.layer.cornerRadius = 15.0
        operateView.layer.masksToBounds = true
        operateView.layer.borderWidth = 0.5
        operateView.layer.borderColor = HiColorTitleThree.cgColor
        return operateView
    }()
    lazy var moreButton: UIButton = {[weak self] in
        let moreButton = UIButton(type: .custom)
        moreButton.tag = 0;
        moreButton.setImage(UIImage.hi_image(named: "hi_mirco_more.png", moduled: "Hi_Home_Module"), for: .normal)
        moreButton.setTitleColor(HiColorTitleTwo, for: .normal)
        moreButton.addTarget(self, action:#selector(self?.toExcute(sender:)), for: .touchUpInside)
        return moreButton
    }()
    lazy var separatorView: UIView = {[weak self] in
        let separatorView = UIView(frame:.zero)
        separatorView.backgroundColor = HiColorTitleThree;
        return separatorView
    }()
    lazy var shutButton: UIButton = {[weak self] in
        let shutButton = UIButton(type: .custom)
        shutButton.tag = 1;
        shutButton.setImage(UIImage.hi_image(named: "hi_mirco_shut.png", moduled: "Hi_Home_Module"), for: .normal)
        shutButton.setTitleColor(HiColorTitleTwo, for: .normal)
        shutButton.addTarget(self, action: #selector(self?.toExcute(sender:)), for: .touchUpInside)
        return shutButton
    }()
    lazy var routeCodeView: HiRouteCodeView = {[weak self] in
        let routeCodeView = HiRouteCodeView(frame:.zero)
        routeCodeView.routeCodeViewDelegate = self;
        routeCodeView.handle = { [weak self]  in
        };
        return routeCodeView
    }()
}

//MARK: IB-Action
extension HiRouteCodeViewController {
    @objc func toExcute(sender: UIButton) {
        if (sender.tag == 0) {
            self.presentRouterControllerWithUrl("home://present")
        } else {
            self.callBackParameters?(["deinit": "Hi", "params": "页面参数"])
            self.navigationController?.popViewController(animated: true);
        }
    }
}
//MARK: Notice
extension HiRouteCodeViewController {
    
}
//MARK: Delegate
extension HiRouteCodeViewController:HiRouteCodeViewDelegate {
    func toOperate(view: HiRouteCodeView) {
    }
}

extension HiRouteCodeViewController {
    /**
     重写该方法进行参数获取
     
     - parameter parameters: 传入的参数
     - parameter callBackParameters: 数据回调
     */
    public override class func routerController(_ parameters: [String : Any]? = nil, callBackParameters: (([String : Any]) -> Void)? = nil) -> UIViewController? {
        if let id = parameters?["id"] as? String,
           let name = parameters?["name"] as? String { // 拿取参数
            let vc = HiRouteCodeViewController();
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

