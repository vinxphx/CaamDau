//Created  on 2019/3/16 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




import UIKit
import CD
import Config
import Assets

class Cell_MineCollectionLabel: UICollectionViewCell {
    
    lazy var lab_icon:UILabel = {
        return UILabel().cd
            .text(NSTextAlignment.center)
            .build
    }()
    
    lazy var lab_title:UILabel = {
        return UILabel().cd
            .text(Config.color.txt_1)
            .text(Config.font.font(12))
            .text(NSTextAlignment.center)
            .build
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.cd
            .add(self.lab_icon)
            .add(self.lab_title)
            .background(UIColor.white)
        
        self.lab_icon.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.width.equalTo(self.lab_icon.snp.height)
        }
        
        self.lab_title.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(self.lab_icon.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension Cell_MineCollectionLabel: CD_RowUpdateProtocol {
    typealias DataSource = (CD_IconFont, UIColor)
    func row_update(_ data: (CD_IconFont, UIColor), id: String, tag: Int, frame: CGRect, callBack: CD_RowCallBack?) {
        self.lab_icon.cd.iconfont(data.0)
        self.lab_title.cd.text("\(data.0)")
    }
}


class Cell_MineCollectionImage: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.img.cd.content(.center)
    }
}
extension Cell_MineCollectionImage: CD_RowUpdateProtocol {
    typealias DataSource = (CD_IconFont, UIColor, UIView.ContentMode)
    func row_update(_ data: (CD_IconFont, UIColor, UIView.ContentMode), id: String, tag: Int, frame: CGRect, callBack: CD_RowCallBack?) {
        self.img.cd
            .iconfont(data.0, color: data.1)
            .content(data.2)
        self.btn.cd.text("\(data.0)")
    }
}



class View_MineCollectionHeader: UICollectionReusableView {
    @IBOutlet weak var btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btn.cd.text(Config.font.fontMedium(15))
        
    }
    
}
extension View_MineCollectionHeader: CD_RowUpdateProtocol {
    typealias DataSource = (CD_IconFont, UIColor, String)
    func row_update(_ data: (CD_IconFont, UIColor, String), id: String, tag: Int, frame: CGRect, callBack: CD_RowCallBack?) {
        self.btn.cd
            //.text(data.0.font)
            .text(data.2)
            .text(data.1)
            .iconfont(data.0, style: .image(.normal, color: data.1))
    }
}


class View_MineCollectionFooter: UICollectionReusableView {
    
    @IBOutlet weak var lab: UILabel!
    @IBOutlet weak var view_line: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        view_line.cd.background(Config.color.bg)
        lab.cd.text(Config.color.warning)
    }
    
}
extension View_MineCollectionFooter: CD_RowUpdateProtocol {
    typealias DataSource = NSAttributedString
    func row_update(_ data: NSAttributedString, id: String, tag: Int, frame: CGRect, callBack: CD_RowCallBack?) {
        lab.cd.text(data)
    }
}


class View_MineCollectionBg: UICollectionReusableView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.red
    }
    
}
