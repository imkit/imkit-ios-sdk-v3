//
//  BusinessChatScenarioRoomsViewController.swift
//  imkit-ios-sdk-v3-demo
//
//  Created by Sean on 2021/7/6.
//  Copyright © 2021 Howard Sun. All rights reserved.
//

import Foundation
import IMKit

class BusinessChatScenarioRoomsViewController: IMRoomsViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Business Chat"
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
             
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func didSelectRoom(room: IMRoom) {
        let room = BusinessChatScenarioChatRoomViewController(roomID: room.id)
        navigationController?.pushViewController(room, animated: true)
    }
}
