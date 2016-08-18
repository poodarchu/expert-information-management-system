//
//  UserCell.swift
//  ExpertRecruitSystem
//
//  Created by P. Chu on 8/17/16.
//  Copyright © 2016 PDC. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var subtitleLabel: UILabel!
    
    override convenience init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.init(reuseIdentifier: reuseIdentifier!)
    }
    
    init(reuseIdentifier: String) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
//        subtitleLabel.lineBreakMode = .ByWordWrapping
        subtitleLabel.numberOfLines = 0
    }
    
    convenience init(type: User, reuseIdentifier: String) {
        self.init(reuseIdentifier: reuseIdentifier)
        
        self.configureWithType(type)
    }
    
    func configureWithType(type: User) {
        let labels = type.labels
        self.titleLabel.text = labels.title
        self.subtitleLabel.text = labels.subtitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
