//
//  HiHomeView.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/4/28.
//

import UIKit
import SnapKit
import Hi_Router_Module
import Hi_Kit_Module

typealias HiHandle = () -> Void

protocol HiHomeViewDelegate: AnyObject {
    func toOperate(view:HiHomeView)
}
class HiHomeView: UIView {
    var handle: HiHandle?
    weak var homeViewDelegate : HiHomeViewDelegate?
    var homeModels = [HiHomeModel](){
        didSet {
            DispatchQueue.main.async{
                self.collectionView.reloadData();
            }
        }
    }
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
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = HiColorWhite;
        collectionView.register(HiHomeCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HiHomeCollectionViewCell.self))
        collectionView.register(HiHomeMarqueeCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HiHomeMarqueeCollectionViewCell.self))
        collectionView.register(HiHomeCarouselCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HiHomeCarouselCollectionViewCell.self))
        collectionView.register(HiHomeNoticeAreaCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HiHomeNoticeAreaCollectionViewCell.self))
        collectionView.register(HiHomeLeftRightCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HiHomeLeftRightCollectionViewCell.self))
        collectionView.register(HiHomeTopBottomCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HiHomeTopBottomCollectionViewCell.self))
        collectionView.register(HiHomeCollectionHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(HiHomeCollectionHeaderReusableView.self))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionHeader\(NSStringFromClass(UICollectionReusableView.self))")
        collectionView.register(HiHomeCollectionFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(HiHomeCollectionFooterReusableView.self))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "sectionFooter\(NSStringFromClass(UICollectionReusableView.self))")
        collectionView.showsVerticalScrollIndicator=false
        collectionView.showsHorizontalScrollIndicator=false;
        return collectionView
    }()
}
    
//MARK: Public Method
extension HiHomeView {
    func setUI() {
        self.addSubview(self.collectionView);
        self.setMas()
    }
    func setMas() {
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self);
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
extension HiHomeView:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.homeModels.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let homeModel:HiHomeModel = self.homeModels[section];
        if (homeModel.type == 1 || homeModel.type == 3) {
            return homeModel.sonModels.count;
        }
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let homeModel:HiHomeModel = self.homeModels[indexPath.section];
        let sonHomeModel:HiHomeSonModel = homeModel.sonModels[indexPath.row];
        if (homeModel.type == 0) {
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HiHomeCollectionViewCell.self), for: indexPath) as! HiHomeCollectionViewCell;
            sonHomeModel.iconUrl = "易 联 众 民 生";
            sonHomeModel.titleStr = "i O S 项 目 框 架";
            viewCell.model = sonHomeModel;
            return viewCell;
        } else if (homeModel.type == 1) {
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HiHomeTopBottomCollectionViewCell.self), for: indexPath) as! HiHomeTopBottomCollectionViewCell;
            viewCell.model = sonHomeModel;
            return viewCell;
        } else if (homeModel.type == 2) {
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HiHomeNoticeAreaCollectionViewCell.self), for: indexPath) as! HiHomeNoticeAreaCollectionViewCell;
            return viewCell;
        } else if (homeModel.type == 3) {
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HiHomeLeftRightCollectionViewCell.self), for: indexPath) as! HiHomeLeftRightCollectionViewCell;
            viewCell.model = sonHomeModel;
            return viewCell;
        } else if (homeModel.type == 4) {
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HiHomeCarouselCollectionViewCell.self), for: indexPath) as! HiHomeCarouselCollectionViewCell;
            viewCell.model = sonHomeModel;
            return viewCell;
        } else {
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HiHomeMarqueeCollectionViewCell.self), for: indexPath) as! HiHomeMarqueeCollectionViewCell;
            viewCell.model = homeModel;
            return viewCell;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let homeModel:HiHomeModel = self.homeModels[indexPath.section];
            if (homeModel.type == 3) {
                let collectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:NSStringFromClass(HiHomeCollectionHeaderReusableView.self) , for: indexPath) as! HiHomeCollectionHeaderReusableView;
                collectionReusableView.sectionButton.setTitle("医保查询服务", for: .normal);
                return collectionReusableView
            }
            let collectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"sectionHeader\(NSStringFromClass(UICollectionReusableView.self))" , for: indexPath) as! UICollectionReusableView;
            return collectionReusableView
        } else {
            if (indexPath.section == self.homeModels.count - 1) {
                let collectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(HiHomeCollectionFooterReusableView.self), for: indexPath) as! HiHomeCollectionFooterReusableView
                return collectionReusableView
            }
            let collectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "sectionFooter\(NSStringFromClass(UICollectionReusableView.self))", for: indexPath) as! UICollectionReusableView
            return collectionReusableView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let homeModel:HiHomeModel = self.homeModels[section];
        if (homeModel.type == 3) {
            return CGSize(width: HiSCREENWIDTH, height: 52)
        } else {
            return CGSize(width: HiSCREENWIDTH, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if (section == 0 || section == 2) {
            return CGSize.init(width: HiSCREENWIDTH, height: 0)
        }else  if (section == self.homeModels.count - 1) {
            return CGSize.init(width: HiSCREENWIDTH, height: 70)
        }
        return CGSize.init(width: HiSCREENWIDTH, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let homeModel:HiHomeModel = self.homeModels[indexPath.section];
        if (homeModel.type == 0) {
            return CGSize.init(width: HiSCREENWIDTH-8, height: 166)
        } else if (homeModel.type == 1) {
            return CGSize.init(width: (HiSCREENWIDTH - 62)/4, height: 72)
        } else if (homeModel.type == 2) {
            return CGSize.init(width: HiSCREENWIDTH-32, height: 48)
        } else if (homeModel.type == 3) {
            return CGSize.init(width: (HiSCREENWIDTH - 42)/2, height: 54)
        } else if (homeModel.type == 4) {
            return CGSize.init(width: HiSCREENWIDTH-32, height: 88)
        } else {
            return CGSize.init(width: HiSCREENWIDTH-32, height: 59)
        }
    }
    
    //  Converted to Swift 5 by Swiftify v5.0.30213 - https://objectivec2swift.com/
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let homeModel:HiHomeModel = self.homeModels[section];
        if (homeModel.type == 0) {
            return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        }
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10;
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10;
//    }
}
