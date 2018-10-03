//
//  MainViewController.swift
//  LayoutPrototype
//
//  Created by Guy Fawkes on 03/09/18.
//  Copyright © 2018 Guy Fawkes. All rights reserved.
//

import UIKit
import Alamofire
//import ObjectMapper
import AlamofireObjectMapper


class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SongDataDelegate {
 
    
    @IBOutlet weak var tableview: UITableView?
    
    @IBOutlet weak var btnLogout: UIBarButtonItem!

    
    var arrRes = [[String:AnyObject]]()
    var songList = [Songs]()
    var itemSong: Songs? = nil
    var index: Any? = nil
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let show = Utility.getData()
        print(show)
        
    
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubview(toFront: indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        indicator.startAnimating()
        

        getData(url: "Coba extension")
        
        print("\(Utility.getString()) \(Utility.getInt())")
        
        /*
        let test = GetFromAPI.fethingDatabase(url: "https://rallycoding.herokuapp.com/api/music_albums") as [SongsBackup]
        for item in test {
            print(item.artist ?? "more")
        }*/
        
        
        //self.fethingDatabase()
        
        GetFromAPI.getAllData(baseUrl: "https://rallycoding.herokuapp.com/api/music_albums"){
            (arrData) in
            for i in arrData! {
                print(i.title ?? "")
            }
            
            self.songList = arrData!
            self.tableview?.reloadData()
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func loadDetailSongDidFinish(controller: DetailViewController, judul: String, artist: String) {
        print(judul + artist)
        controller.navigationController?.popViewController(animated: true)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
        
        
        if segue.identifier == "DetailSongSegue" {
            if let indexPath = self.tableview?.indexPathForSelectedRow {
                let selectedSong : Songs = songList[indexPath.row]
                let controller = segue.destination as! DetailViewController
                controller.lagu = selectedSong
                controller.delegate = self
            }
        }
        
        
    }
    
    
    
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
    
        if sender.source is DetailViewController {
        
            print("alrite")
        
        }
    }
    

    @IBAction func logout(_ sender: UIBarButtonItem) {
        self.handleLogOut()
    }
    
    
    func handleLogOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)
    
        /* Using Programatically
        let appDelegateTemp = UIApplication.shared.delegate as? AppDelegate
        appDelegateTemp?.window? = UIWindow(frame: UIScreen.main.bounds)
        appDelegateTemp?.window?.makeKeyAndVisible()
        appDelegateTemp?.window?.rootViewController = LoginController()
        */
        

        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }

    
    /*
    func fethingDatabase() {

        
        let urlString = URL(string: "https://rallycoding.herokuapp.com/api/music_albums")

        let task = URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                
               // self.songList = jsonArray.flatMap(Songs.init)

                
                for it in self.songList {
                    print(it.title ?? "Default")
                }
            
                
                self.tableview?.reloadData()
                self.indicator.stopAnimating()
                
            } catch let parsingError {
                print("Error", parsingError) 
            }
        }
        task.resume()
        
    }
    */

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableCell") as! FoodTableViewCell

        let lagu: Songs = songList[indexPath.row]
        cell.nameFoodLabel?.text = lagu.title
        cell.desFoodLabel?.text = lagu.artist
        DispatchQueue.global().async {
            let url = URL(string: lagu.image!)
            let data = try? Data(contentsOf: url! ) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.imageFood?.image = UIImage(data: data!)
            }
        }
        
        return cell
    }

    

}
