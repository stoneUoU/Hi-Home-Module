//
//  HiSiteViewController.swift
//  Hi-Home-Module
//
//  Created by stone on 2024/4/2.
//

import UIKit
import SwiftyJSON
import HandyJSON
import MBProgressHUD
import Hi_Kit_Module
import Hi_Router_Module
import Hi_Helper_Module
import Hi_Network_Module

class HiSiteViewController:HiBaseViewController {
    
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
        self.setStatusAndNavigationUI(centerLabelTitle: "地方专区", rightButtonTitle: "", ifWhiteIMV: false, navigationColor: .white, centerLabelColor: .black, rightButtonColor: .black, ifLine: false);
        self.setUI()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.fetchDatas { boolean in
                if (boolean) {
                    self.collectionView.reloadData();
                }
            };
//        }
    }
    
    func fetchDatas(callback:@escaping (_ isBoolean:Bool)->()) {
        var params = Dictionary<String,Any>();
        HiAPI.request(.fetchSite(params), success: { json in
            let dataHandyJSON:[String : Any] = JSON(json)["data"].rawValue as! [String : Any];
            if let handyJSON:HiSiteHandyJSONModel = HiSiteHandyJSONModel.deserialize(from: dataHandyJSON) {
                self.hiSiteHandyJSONModel = handyJSON;
                self.hiRefreshNormalHeader.endRefreshing();
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
        self.view.addSubview(self.collectionView);
        self.setMas();
    }
        
    func setMas() {
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(HiStatusBarAndNavigationBarH);
            make.left.right.bottom.equalTo(self.view);
        }
    }
    lazy var hiRefreshNormalHeader:HiRefreshHeader = {
        let hiRefreshNormalHeader = HiRefreshHeader();
        hiRefreshNormalHeader.setRefreshingTarget(self, refreshingAction: #selector(self.toFreshFunc));
        return hiRefreshNormalHeader
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = HiColorWhite;
        collectionView.register(HiSiteCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HiSiteCollectionViewCell.self))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionHeader\(NSStringFromClass(UICollectionReusableView.self))")
        collectionView.register(HiHomeCollectionFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(HiHomeCollectionFooterReusableView.self))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "sectionFooter\(NSStringFromClass(UICollectionReusableView.self))")
        collectionView.showsVerticalScrollIndicator=false
        collectionView.showsHorizontalScrollIndicator=false;
        collectionView.mj_header = self.hiRefreshNormalHeader;
        return collectionView
    }()
}

//MARK: IB-Action
extension HiSiteViewController {
    override func toLeft(_ sender: UIButton) {
        self.callBackParameters?(["deinit": "Hi", "params": "页面参数"])
        super.toLeft(sender);
    }
}
//MARK: Notice
extension HiSiteViewController {
    
}
//MARK: Delegate
extension HiSiteViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ((self.hiSiteHandyJSONModel?.openList.count) != nil) ? 1 : 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hiSiteHandyJSONModel?.openList.count ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let homeModel:HiSiteHandyJSONModelOpenList = self.hiSiteHandyJSONModel!.openList[indexPath.row];
        let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HiSiteCollectionViewCell.self), for: indexPath) as! HiSiteCollectionViewCell;
        homeModel.indexTag = indexPath.row;
        viewCell.model = homeModel;
        return viewCell;
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let collectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"sectionHeader\(NSStringFromClass(UICollectionReusableView.self))" , for: indexPath) as! UICollectionReusableView;
            return collectionReusableView
        } else {
            let collectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "sectionFooter\(NSStringFromClass(UICollectionReusableView.self))", for: indexPath) as! UICollectionReusableView
            return collectionReusableView
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: HiSCREENWIDTH, height: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: HiSCREENWIDTH, height: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (HiSCREENWIDTH - 62)/4, height: 84)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension HiSiteViewController {
    @objc func toFreshFunc(){
        self.fetchDatas { boolean in
            if (boolean) {
                self.collectionView.reloadData();
            }
        };
    }
}


extension HiSiteViewController {
    /**
     重写该方法进行参数获取
     
     - parameter parameters: 传入的参数
     - parameter callBackParameters: 数据回调
     */
    public override class func routerController(_ parameters: [String : Any]? = nil, callBackParameters: (([String : Any]) -> Void)? = nil) -> UIViewController? {
        if let age = parameters?["age"] as? Int,
           let name = parameters?["name"] as? String { // 拿取参数
            let vc = HiSiteViewController();
            vc.name = name;
            vc.age = age;
            vc.callBackParameters = callBackParameters
            return vc
        } else {
            return nil
        }
    }
}


