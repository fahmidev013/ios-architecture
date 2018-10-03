//
//  DetailViewController.swift
//  LayoutPrototype
//
//  Created by Guy Fawkes on 06/09/18.
//  Copyright © 2018 Guy Fawkes. All rights reserved.
//

import UIKit

protocol SongDataDelegate{
    func loadDetailSongDidFinish(controller:DetailViewController, judul:String,artist:String)
}

class DetailViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tvValue: UITextField!
    
    var delegate:SongDataDelegate? = nil
    var data: String? = "Hello WOlrd"
    var lagu: Songs? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
	
        tvValue.text = lagu?.title
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backtoHome(_ sender: UIButton) {
        if (delegate != nil) {
            delegate?.loadDetailSongDidFinish(controller: self, judul: "Ini Judul", artist: tvValue.text!)
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
