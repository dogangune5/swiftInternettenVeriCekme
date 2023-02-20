//
//  ViewController.swift
//  internettenVeriCekme
//
//  Created by doğan güneş on 20.02.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    
    
    @IBOutlet weak var tableView: UITableView!
    private var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // table view daki labelleri ayarlamak (bir tanae fonksiyon çağırmalıyız ---- heightForRowAt)
        
        // boyutlar otomatik atanacak
        tableView.rowHeight = UITableView.automaticDimension
        // tahmin edilen yükseklik
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        
        
        veriAl()
        
    }
    
    func veriAl() {
        // url yi alalım
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
      
        Webservice().haberleriIndir(url: url!) { haberler in
            if let haberler = haberler {
             //   print(haberler)
                self.newsTableViewModel = NewsTableViewModel(newsList: haberler)
               
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    // table view işlemleri

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // veri internetten boş gelebilir diye kontrol ettik gelmesse işlemi yapıyoruz
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInsection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! haberlerCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(index: indexPath.row)
        cell.titleLabel.text = newsViewModel.title
        cell.storyLabel.text = newsViewModel.story
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}

