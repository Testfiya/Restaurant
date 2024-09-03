//
//  MenuItemDetailViewController.swift
//  Restaruant
//
//  Created by Mobman on 31/08/2024.
//

import UIKit

@MainActor
class MenuItemDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemDetailsLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    let menuItem: MenuItem
    
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        itemNameLabel.text = menuItem.name
        itemPriceLabel.text = menuItem.price.formatted(.currency(code: "usd"))
        itemDetailsLabel.text = menuItem.detailText
    }

    @IBAction func orderButtonTapper(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: [], animations: {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
