//
//  NewsViewModel.swift
//  internettenVeriCekme
//
//  Created by doğan güneş on 20.02.2023.
//

import Foundation

struct NewsTableViewModel {
    
    let newsList : [News]
    
    func numberOfRowsInsection() -> Int {
        return self.newsList.count
    }
    
    // table view cell for kısmı
    func newsAtIndexPath( index: Int ) -> NewsViewModel {
        
        let news = self.newsList[index]
        return NewsViewModel(news: news)
        
    }
}

struct NewsViewModel {
    let news: News
    var title : String {
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
    
}


