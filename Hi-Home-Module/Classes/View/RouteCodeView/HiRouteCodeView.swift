//
//  HiRouteCodeView.swift
//  SwiftProject
//
//  Created by stone on 2022/4/25.
//

import UIKit
import Hi_Kit_Module
import Hi_Router_Module

typealias HiRouteCodeViewHandle = () -> Void

protocol HiRouteCodeViewDelegate: AnyObject {
    func toOperate(view:HiRouteCodeView)
}

class HiRouteCodeView: UIView {
    var handle:HiRouteCodeViewHandle?
    weak var routeCodeViewDelegate : HiRouteCodeViewDelegate?
    var isLoading:Bool = true;
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: Public Method
    //MARK: Private Method
    //MARK: lazy load
    public lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none;
        tableView.backgroundColor = HiColorRouteCode;
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude));
        tableView.register(HiRouteCodeCell.self, forCellReuseIdentifier: NSStringFromClass(HiRouteCodeCell.self))
        tableView.register(HiRouteCodeLoadingCell.self, forCellReuseIdentifier: NSStringFromClass(HiRouteCodeLoadingCell.self))
        tableView.register(HiRouteCodeRecordCell.self, forCellReuseIdentifier: NSStringFromClass(HiRouteCodeRecordCell.self))
        tableView.register(HiRouteCodeInfoCell.self, forCellReuseIdentifier: NSStringFromClass(HiRouteCodeInfoCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return tableView
    }()
    
    lazy var dataArrays:Array<Array<AnyObject>> = {
        var dataArrays = Array<Array<AnyObject>>();
        for i in 0 ..< 4 {
            if (i == 0 || i == 1) {
                dataArrays.append([]);
            } else if (i == 2) {
                var funcModels:Array<AnyObject> = Array<AnyObject>();
                for j in 0 ..< 7 {
                    let funcModel = HiFunctionModel();
                    if (j == 0) {
                        funcModel.iconName = "hi_error_phone";
                        funcModel.functionName = "有异常要打电话";
                        funcModel.topFillet = true;
                    } else if (j == 1) {
                        funcModel.iconName = "hi_personal_info_setting";
                        funcModel.functionName = "个人信息设置";
                    } else if (j == 2) {
                        funcModel.iconName = "hi_add_or_delete";
                        funcModel.functionName = "添加和删除亲友健康码";
                    } else if (j == 3) {
                        funcModel.iconName = "hi_questions";
                        funcModel.functionName = "有疑问想得到解答";
                    } else if (j == 4) {
                        funcModel.iconName = "hi_download_love_card";
                        funcModel.functionName = "下载福码爱心卡";
                    } else if (j == 5) {
                        funcModel.iconName = "hi_manage_code";
                        funcModel.functionName = "管理张贴码";
                    } else if (j == 6) {
                        funcModel.iconName = "hi_add_desktop";
                        funcModel.functionName = "添加健康码到桌面";
                        funcModel.bottomFillet = true;
                    }
                    funcModels.append(funcModel);
                }
                dataArrays.append(funcModels);
            } else {
                var funcModels:Array<AnyObject> = Array<AnyObject>();
                for j in 0 ..< 4 {
                    let funcModel = HiFunctionModel();
                    if (j == 0) {
                        funcModel.iconName = "hi_detect_map";
                        funcModel.functionName = "核酸检测地图";
                        funcModel.topFillet = true;
                    } else if (j == 1) {
                        funcModel.iconName = "hi_yimiao_pre";
                        funcModel.functionName = "疫苗接种预约";
                    } else if (j == 2) {
                        funcModel.iconName = "hi_yimiao_map";
                        funcModel.functionName = "疫苗接种地图";
                    } else {
                        funcModel.iconName = "hi_elec_code";
                        funcModel.functionName = "医保电子凭证";
                        funcModel.bottomFillet = true;
                    }
                    funcModels.append(funcModel);
                }
                dataArrays.append(funcModels);
            }
        }
        return dataArrays
    }()
}
    
//MARK: Public Method
extension HiRouteCodeView {
    func setUI() {
        self.addSubview(self.tableView)
        self.setMas()
    }
    func setMas() {
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self);
        }
    }
}
 
//MARK: IB-Action
extension HiRouteCodeView {
    
}
    
//MARK: Notice
extension HiRouteCodeView {
    
}
    
//MARK: Delegate
extension HiRouteCodeView:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArrays.count;
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let funcModels:Array<AnyObject> = self.dataArrays[section];
        if (section == 0 || section == 1) {
            return 1
        } else {
            return funcModels.count;
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            if (self.isLoading) {
                var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HiRouteCodeLoadingCell.self)) as? HiRouteCodeLoadingCell
                if viewCell == nil {
                    viewCell = HiRouteCodeLoadingCell(style: .default, reuseIdentifier: NSStringFromClass(HiRouteCodeLoadingCell.self))
                }
                viewCell!.selectionStyle = .none
                return viewCell!;
            } else {
                var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HiRouteCodeCell.self)) as? HiRouteCodeCell
                if viewCell == nil {
                    viewCell = HiRouteCodeCell(style: .default, reuseIdentifier: NSStringFromClass(HiRouteCodeCell.self))
                }
                viewCell!.selectionStyle = .none
                return viewCell!;
            }
        } else if (indexPath.section == 1) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HiRouteCodeRecordCell.self)) as? HiRouteCodeRecordCell
            if viewCell == nil {
                viewCell = HiRouteCodeRecordCell(style: .default, reuseIdentifier: NSStringFromClass(HiRouteCodeRecordCell.self))
            }
            viewCell!.selectionStyle = .none
            return viewCell!;
        } else if (indexPath.section == 2 || indexPath.section == 3) {
            let funcModels:Array<AnyObject> = self.dataArrays[indexPath.section];
            let funcModel:HiFunctionModel = funcModels[indexPath.row] as! HiFunctionModel;
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HiRouteCodeInfoCell.self)) as? HiRouteCodeInfoCell
            if viewCell == nil {
                viewCell = HiRouteCodeInfoCell(style: .default, reuseIdentifier: NSStringFromClass(HiRouteCodeInfoCell.self))
            }
            viewCell!.selectionStyle = .none
            viewCell!.funcModel = funcModel;
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
        if (section == 0) {
            let headerView = HiRouteCodeTableHeaderView()
            return headerView
        }
        let headerView = UIView()
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 72;
        }
        return 0.00001
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (section == self.dataArrays.count - 1) {
            let footerView = HiRouteCodeTableFooterView();
            return footerView;
        } else {
            let footerView = UIView()
            return footerView
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == self.dataArrays.count - 1)  {
            return UITableView.automaticDimension;
        } else {
            return 16;
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            if (self.isLoading) {
                return 400;
            } else {
                return 556;
            }
        } else if (indexPath.section == 1) {
            return 96;
        } else {
            return 64;
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

