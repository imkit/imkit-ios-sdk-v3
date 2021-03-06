//
//  NetworkingChatScenarioChatRoomViewController.swift
//  imkit-ios-sdk-v3-demo
//
//  Created by Sean on 2021/7/6.
//  Copyright © 2021 Howard Sun. All rights reserved.
//

import Foundation
import IMKit

class NetworkingChatScenarioChatRoomViewController: IMChatRoomViewController {
    private lazy var topUserView: UIView = {
        let v = UIView()
        v.addSubview(avatarImageView)
        v.addSubview(usernameLabel)
        v.addSubview(userBioLabel)
        avatarImageView.snp.makeConstraints {
            $0.size.equalTo(40.0)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        usernameLabel.snp.makeConstraints {
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(16.0)
            $0.bottom.equalTo(avatarImageView.snp.centerY)
            $0.width.equalTo(UIScreen.main.bounds.width * 0.6)
            $0.trailing.equalToSuperview()
        }
        userBioLabel.snp.makeConstraints {
            $0.leading.width.equalTo(usernameLabel)
            $0.top.equalTo(usernameLabel.snp.bottom)
        }
        return v
    }()
    private lazy var usernameLabel: UILabel = {
        let lb = UILabel()
        lb.font = .demoApp600(size: 14.0)
        lb.textColor = UIColor(hexString: "#3C3C3C")
        return lb
    }()
    private lazy var userBioLabel: UILabel = {
        let lb = UILabel()
        lb.font = .demoApp600(size: 12.0)
        lb.textColor = UIColor(hexString: "#7B7B7B")
        return lb
    }()
    private lazy var avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 40.0 / 2.0
        return iv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = topUserView
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        inputBarView.sendButton.setImage(UIImage(named: "networkingChatSendButtonIcon"), for: .normal)
        inputBarView.audioButton.setImage(UIImage(named: "networkingChatAudioButtonIcon"), for: .normal)
        inputBarView.imageButton.setImage(UIImage(named: "networkingChatImageButtonIcon"), for: .normal)
        inputBarView.cameraButton.setImage(UIImage(named: "networkingChatCameraButtonIcon"), for: .normal)
        inputBarView.stickerButton.isHidden = true
        
        // imkit-customized: 對方的訊息泡泡
        IMStyle.messages.incomingCell.backgroundColor = UIColor(hexString: "#F2F9FF")!
        // imkit-customized: 自己的訊息泡泡
        IMStyle.messages.outgoingCell.backgroundColor = UIColor(hexString: "#5BBFED")!
        IMStyle.messages.outgoingCell.textColor = .white
    }
    override func chatRoomDidUpdate(room: IMRoom) {
        super.chatRoomDidUpdate(room: room)
        
        // the way to fetch other user
        if let otherUser = room.members.filter({ $0.id != IMKit.uid }).first {
            usernameLabel.text = otherUser.displayName
            userBioLabel.text = "I am Lora, product manager of FUNTEK."
            avatarImageView.kf.setImage(with: otherUser.avatarURL)
        }
    }
}
