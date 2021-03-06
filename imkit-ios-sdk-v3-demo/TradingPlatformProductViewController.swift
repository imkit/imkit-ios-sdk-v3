//
//  TradingPlatformProductViewController.swift
//  imkit-ios-sdk-v3-demo
//
//  Created by Sean on 2021/6/23.
//  Copyright © 2021 Howard Sun. All rights reserved.
//

import UIKit
import IMKit
import PromiseKit

class TradingPlatformProductViewController: UIViewController {
    
    
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescLabel: UILabel!    
    @IBOutlet weak var goChatroomButton: UIButton!
    
    var user: User?
    var navBarDefaultColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TradingPlatformProductViewController_title".localized
        navBarDefaultColor = navigationController?.navigationBar.tintColor
        
        productTitleLabel.text = "TradingPlatformProductViewController_mock_product_title".localized
        productPriceLabel.text = "TradingPlatformProductViewController_mock_product_price".localized
        productDescLabel.text = "TradingPlatformProductViewController_mock_product_description".localized
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = navBarDefaultColor
    }
    @IBAction func chatButtonPressed(_ sender: UIButton) {
        guard let user = user else { return }
        IMKit.clear()
        IMFetchTokenTask().perform(uid: user.uuid, nickname: user.nickname)
            .then({ token -> Promise<IMRoom> in
                IMKit.token = token
                IMKit.uid = user.uuid
                return IMCreateDirectChatTask().perform(invitee: "trading_platform_id")
            })
            .done({ [weak self] room in
                self?.navigationController?.pushViewController(
                    TradingPlatformProductChatRoomViewController(roomID: room.id),
                    animated: true
                )
            })
            .catch({ error in
                print(error)
            })
    }
}
