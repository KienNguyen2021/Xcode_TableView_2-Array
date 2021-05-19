//
//  ViewController.swift
//  buoi5_TableView
//
//  Created by Kien Nguyen on 2021-05-18.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource{
    
    @IBOutlet weak var myTable: UITableView!
    
    // neu tao 1 array (mang) :
    
    var mang : [String]!
    
    // Sau khi co mytable2, set up them mang 2 :
    var mang2 : [String]!
    
    
    @IBOutlet weak var myTable2: UITableView!
    // Chua khai bao gi them, myTable2 khong hieu cac functions duoi
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.dataSource = self   // nho ham nay ma 2 functions duoi day moi chay duoc
        
        //Neu tao mang [] :
        mang = [" Adroid","iOS","PHP","React Native"]
        
        // Sau khi co mytable2, set up them mang 2 :
        mang2 = ["Gao","Duong","Sua"]
        
        
        // khai bao them mytable2 :
        myTable2.dataSource = self
        
        // Bat buoc phai identify :CELL cho mytable2
    }
    
    // test thu ham numberOfSection la gi :
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return 1   // print tu: Adroid","iOS","PHP","React Native
        
        // if :
        return 1
        //print 2 lan : Adroid","iOS","PHP","React Native
    }
    
    // test thu tableView titleForHeaderInSection :
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Section" + String(section)
        
        // this function phu thuoc stype, chinh style group thi no se khac
        //on My table : chinh style
    }
    
    
    
// Ham numberOfRowInSection : tra ra bao nhieu dong :
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 5  // se tre ve 5 dong !
        
        // neu mang [] thi se tra lai bay nhieu item, dung ham count :
        //return mang.count
        
        //sau khi them mytable 2:
        // sua tag - mang = 0 - mang1 = 1 :
        
        if tableView.tag == 0{
            return mang.count    // return mang 1
        }
        if tableView.tag == 1{
            return mang2.count    // return mang 2
        }
        return 0 // neu khong de return 0 se bi bao loi
    }

    // Ham nay se chay 5times, tim
    // cellForRowAt tra ra noi dung gi trong cell :
    // indexPath : la array tra ra index item :
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
  
// Khi co mang2 :
        if tableView.tag == 0{
            cell?.textLabel?.text = mang [indexPath.row]
            
            cell?.detailTextLabel?.text = "Dong " + String(indexPath.row)
            
        }
        
        
        if tableView.tag == 1{
            cell?.textLabel?.text = mang2 [indexPath.row]
            
            cell?.detailTextLabel?.text = "Dong " + String(indexPath.row)
            
        }
        
        
        // withIdentifier : la truyen tham so qua lai bang CELL
        // IndexPath : cho biet index so may, tinh tu 0 :
        // ep ve String khi print out :
        
        // Neu mang chay tu index 0 to 4  thi :
        //cell?.textLabel?.text = "Hello ! tai dong so : " + String(indexPath.row)
        
        // print : Adroid","iOS","PHP","React Native:
        
// Khi co mang2 :        //cell?.textLabel?.text = mang [indexPath.row]
        
        // or :
        //cell?.textLabel?.text = mang[0] // ra 5 lan Android
        
        // Trong UITableViewCell, test thu detailTextLable :
        
        // Khi co mang2 :
        
        //cell?.detailTextLabel?.text = "Dong " + String(indexPath.row)
        // Not working, phai vao Cell/custom : chinh style....thi no moi support
        
        
        return cell!  // unwrapped vi o tren cell ?
    }
}

