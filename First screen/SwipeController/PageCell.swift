//
//  PageCell.swift
//  First screen
//
//  Created by Кирилл on 5/7/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
      
     var myImageView: UIImageView = {
     let imageView = UIImageView()
     imageView.translatesAutoresizingMaskIntoConstraints = false
     imageView.contentMode = .scaleAspectFit
     return imageView
   }()
  
    var descriptionTextView: UITextView = {
    let textView = UITextView()
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.isEditable = false
    textView.isSelectable = false
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
     let topImageContainerView = UIView()
     addSubview(topImageContainerView)
     topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
     topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
     topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
     topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
     topImageContainerView.addSubview(myImageView)
     myImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
     myImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
     myImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
     topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
     addSubview(descriptionTextView)
     descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
     descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
     descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
     descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
   }
  
  func configurePage(page: Page) {
    myImageView.image = UIImage(named: page.imageName)
    setAttributes(text: page.headerText, bodyText: page.bodyText)
  }
  
  private func setAttributes(text: String, bodyText: String) {
    let attributedText = NSMutableAttributedString(string: text,
                                                   attributes: [NSMutableAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
    
    attributedText.append(NSAttributedString(string: "\n\n\n \(bodyText)",
                                             attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 17),
                                                          NSAttributedString.Key.foregroundColor : UIColor.gray]))
    descriptionTextView.attributedText = attributedText
    descriptionTextView.textAlignment = .center
  }
  
}


