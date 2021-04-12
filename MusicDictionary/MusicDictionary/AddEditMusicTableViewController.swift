//
//  AddEditMusicTableViewController.swift
//  MusicDictionary
//
//  Created by Jungsang Lim on 2021/04/09.
//

import UIKit

class AddEditMusicTableViewController: UITableViewController {

    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var albumTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
    
    var musics: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let music = musics {
            symbolTextField.text = music.symbol
            titleTextField.text = music.title
            artistTextField.text = music.artist
            albumTextField.text = music.album
            
        }
        
        updateSaveButtonState()
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
        // 값이 바뀔때마다 호출해서 확인하는 메소드
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 수정 또는 추가시 데이터 넘겨주기
        super.prepare(for: segue, sender: sender)
        
        // saveUnwind가 아니면 리턴할거야
        guard segue.identifier == "saveUnwind" else { return }
        let symbolText = symbolTextField.text ?? ""
        let titleText = titleTextField.text ?? ""
        let artistText = artistTextField.text ?? ""
        let albumText = albumTextField.text ?? ""
        
        // 새로 만들기
        musics = Music(symbol: symbolText, title: titleText, artist: artistText, album: albumText)
        
    }
    

    func updateSaveButtonState() {
        let symbolText = symbolTextField.text ?? ""
        let titleText = titleTextField.text ?? ""
        let artistText = artistTextField.text ?? ""
        let albumText = albumTextField.text ?? ""
        //text value 가져오기
        
        saveButton.isEnabled = !symbolText.isEmpty && !titleText.isEmpty && !artistText.isEmpty && !albumText.isEmpty
        // 모든 텍스트필드가 차있어야만 세이브버튼이 활성화된다
    }
    
}
