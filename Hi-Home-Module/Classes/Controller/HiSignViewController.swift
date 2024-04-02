//
//  HiSignViewController.swift
//  Hi-Home-Module
//
//  Created by stone on 2024/4/2.
//

import UIKit
import MBProgressHUD
import Hi_Kit_Module
import Hi_Router_Module
import Hi_Helper_Module

class HiSignViewController:UIViewController {
    
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
        
    // 当加载视图结束时调用该方法
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = HiColorWhite;
        self.setUI()
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
        self.view.addSubview(self.statusView);
        self.view.addSubview(self.navigationView);
        self.navigationView.addSubview(self.backButton);
        self.navigationView.addSubview(self.titleLabel);
        self.view.addSubview(self.tableView);
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
        self.backButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.navigationView)
            make.left.equalTo(self.navigationView.snp.left);
            make.size.equalTo(CGSize.init(width:HiNavigationBarH, height: HiNavigationBarH));
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.navigationView);
        }
        self.tableView.snp.makeConstraints { (make) in
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
        titleLabel.text = "签约渠道管理";
        titleLabel.textAlignment = .center
        titleLabel.textColor = HiColorTitleOne;
        titleLabel.font = HiFont.medium(size: 18);
        return titleLabel
    }()
    lazy var backButton: UIButton = {[weak self] in
        let backButton = UIButton(type: .custom)
        backButton.tag = 0;
        backButton.setImage(UIImage.hi_image(named: "hi_back_default.png", moduled: "Hi_Kit_Module"), for: .normal)
        backButton.setTitleColor(HiColorTitleTwo, for: .normal)
        backButton.addTarget(self, action:#selector(self?.toExcute(sender:)), for: .touchUpInside)
        return backButton
    }()
    public lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none;
        tableView.backgroundColor = HiColorWhite;
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude));
        tableView.register(HiUnSignTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HiUnSignTableViewCell.self))
        tableView.register(HiSignedTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HiSignedTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return tableView
    }()
    lazy var homeModels:[HiHomeModel] = {
        var homeModels:[HiHomeModel] = Array<HiHomeModel>();
        for i in 0..<2 {
            var homeModel:HiHomeModel = HiHomeModel();
            homeModel.type = i;
            for j in 0..<(i == 0 ? 1 : 2) {
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
extension HiSignViewController {
    @objc func toExcute(sender: UIButton) {
        self.callBackParameters?(["deinit": "Hi", "params": "页面参数"])
        self.navigationController?.popViewController(animated: true);
    }
}
//MARK: Notice
extension HiSignViewController {
    
}
//MARK: Delegate
extension HiSignViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.homeModels.count;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let homeModel:HiHomeModel = self.homeModels[section];
        return homeModel.sonModels.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let homeModel:HiHomeModel = self.homeModels[indexPath.section];
            let sonModel:HiHomeSonModel = homeModel.sonModels[indexPath.row];
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HiSignedTableViewCell.self)) as? HiSignedTableViewCell
            if viewCell == nil {
                viewCell = HiSignedTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(HiSignedTableViewCell.self))
            }
            viewCell!.selectionStyle = .none
            viewCell!.model = sonModel;
            return viewCell!;
        } else if (indexPath.section == 1) {
            let homeModel:HiHomeModel = self.homeModels[indexPath.section];
            let sonModel:HiHomeSonModel = homeModel.sonModels[indexPath.row];
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HiUnSignTableViewCell.self)) as? HiUnSignTableViewCell
            if viewCell == nil {
                viewCell = HiUnSignTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(HiUnSignTableViewCell.self))
            }
            viewCell!.selectionStyle = .none
            viewCell!.model = sonModel;
            return viewCell!;
        } else {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
            if viewCell == nil {
                viewCell = UITableViewCell(style: .default, reuseIdentifier: NSStringFromClass(UITableViewCell.self))
            }
            viewCell!.selectionStyle = .none
            return viewCell!;
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HiSignTableHeaderView()
        headerView.titleLabel.text = section == 0 ? "已签约渠道" : "未签约渠道";
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50;
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (section == self.homeModels.count - 1) {
            let footerView = HiSignTableFooterView();
            return footerView;
        } else {
            let footerView = UIView()
            return footerView
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == self.homeModels.count - 1)  {
            return UITableView.automaticDimension;
        } else {
            return 16;
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HiSignViewController {
    /**
     重写该方法进行参数获取
     
     - parameter parameters: 传入的参数
     - parameter callBackParameters: 数据回调
     */
    public override class func routerController(_ parameters: [String : Any]? = nil, callBackParameters: (([String : Any]) -> Void)? = nil) -> UIViewController? {
        if let age = parameters?["age"] as? Int,
           let name = parameters?["name"] as? String { // 拿取参数
            let vc = HiSignViewController();
            vc.name = name;
            vc.age = age;
            vc.callBackParameters = callBackParameters
            return vc
        } else {
            return nil
        }
    }
}


