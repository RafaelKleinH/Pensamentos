//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Rafael Hartmann on 10/03/21.
//

import UIKit

class QuotesViewController: UIViewController {
    
    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let quotesanager = QuoteManager()
    var timer: Timer?
    
    let config = Configuration.shared
    
    func formatView(){
        view.backgroundColor =  config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        
        lbQuote.textColor =  config.colorScheme == 0 ? .black : .white
        
        lbAuthor.textColor =  config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        prepareQuotes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        formatView()
    }
    func prepareQuotes(){
        timer?.invalidate()
        if config.autoRefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    func showRandomQuote(){
        let quote = quotesanager.getRandomQuote()
        lbQuote.text = quote.quote
        lbAuthor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBg.image = UIImage(named: quote.image)
        
        lbQuote.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBg.alpha = 0.0
        ctTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 1.5) {
            self.lbQuote.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ivPhoto.alpha = 1.0
            self.ivPhotoBg.alpha = 1.0
            self.ctTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuotes()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}
