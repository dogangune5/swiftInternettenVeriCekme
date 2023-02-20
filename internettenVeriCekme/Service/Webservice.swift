 //
//  Webservice.swift
//  internettenVeriCekme
//
//  Created by doğan güneş on 20.02.2023.
//

import Foundation

class Webservice {
    // bir fonksiyon içerisinde  closure parametre olarak vericeksem ve fonksiyonunun işi bittikten sonra çağırılıcak bir closuer yapıyorsam (tamamlama bloğu) o zaman escapin kullanmamız gerekiyor
    func haberleriIndir(url: URL, completion: @escaping ([News]?) -> ()) {
         // ağdan veri transferi işlemlerini kontrol etme (URLSESSİON)  İNTERNETTEN İSTEK YAPACAĞIMIZ ZAMAAN KULLANIYOPUZ HTTP GET REQUEAST GİBİ
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // hata mesajı varsa completion nil yani bri işlem gerçekleştiremicez
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
                
                // jsonu news dizisine döndürmeliyiz
               let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                if let haberlerDizisi = haberlerDizisi {
                    completion(haberlerDizisi)
                    
                
                }
                
            }
             
        }.resume() // urlsessionun sonuna bunu eklemeliyiz 
        
        }
}
