//
//  HiSignedTableViewCell.swift
//  Hi-Home-Module
//
//  Created by stone on 2024/4/2.
//

import UIKit
import Hi_Kit_Module
import Hi_Router_Module

class HiSignedTableViewCell: UITableViewCell {
    
    var model = HiHomeSonModel(){
        didSet {
            self.titleLabel.text = model.titleStr;
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.iconImageView);
        self.bgView.addSubview(self.titleLabel)
        self.bgView.addSubview(self.excuteButton);
        
        self.setMas();
    }
    
    func setMas() {
        self.bgView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH - 32, height: 50))
        }
        self.iconImageView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.bgView);
            make.left.equalTo(self.bgView).offset(16);
            make.size.equalTo(CGSize.init(width: 22, height: 22))
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.bgView);
            make.left.equalTo(self.iconImageView.snp.right).offset(12);
        }
        self.excuteButton.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.bgView);
            make.right.equalTo(self.bgView.snp.right).offset(-16);
            make.size.equalTo(CGSize.init(width: 59, height: 20));
        }
    }
    
    lazy var bgView:UIView = {[weak self] in
        let bgView = UIView()
        bgView.backgroundColor = HiColorBackGround;
        bgView.layer.masksToBounds = true;
        bgView.layer.cornerRadius = 8.0;
        return bgView
    }()
    
    lazy var iconImageView:UIImageView = {[weak self] in
        var iconImageView = UIImageView()
        iconImageView.layer.masksToBounds = true;
        iconImageView.layer.cornerRadius = 11;
        iconImageView.backgroundColor = UIColor.randomColor;
        return iconImageView
    }()
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = HiFont.regular(size:16)
        titleLabel.textColor = HiColorTitleOne;
        return titleLabel
    }()

    lazy var excuteButton:UIButton = {[weak self] in
        var excuteButton = UIButton(type: .custom)
        excuteButton.titleLabel?.font = HiFont.regular(size:14)
        excuteButton.layer.cornerRadius = 10
        excuteButton.layer.masksToBounds = true
        excuteButton.layer.borderWidth = 0.5;
        excuteButton.layer.borderColor = HiColorFEB70F.cgColor;
        excuteButton.setTitleColor(HiColorFEB70F, for: .normal)
        excuteButton.tag = 0;
        excuteButton.setTitle("去解约", for: .normal)
        excuteButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return excuteButton
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension HiSignedTableViewCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}


