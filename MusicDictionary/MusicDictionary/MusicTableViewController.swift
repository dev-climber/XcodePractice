//
//  MusicTableViewController.swift
//  MusicDictionary
//
//  Created by Jungsang Lim on 2021/04/09.
//

import UIKit

class MusicTableViewController: UITableViewController {
    
    var musics: [Music] = [
        Music(symbol: "๐ฟ", title: "์๋ฆ๋ค์ด ๊ฒ", artist: "์ธ๋๋ค์ด๋ฐ๊ด", album: "๊ฐ์ฅ ๋ณดํต์ ์กด์ฌ"),
        Music(symbol: "๐ฟ", title: "Dynamite", artist: "BTS", album: "BE"),
        Music(symbol: "๐ฟ", title: "์๋ฅธ ์ฆ์์", artist: "๊น๊ด์", album: "๊น๊ด์ ๋ค๋ฒ์งธ"),
        Music(symbol: "๐ฟ", title: "Goodbye Aluminium", artist: "๋ฌ๋น์์ ์ญ์ ๋ง๋ฃจํ๋ฐ", album: "Sophomore Jinx"),
        Music(symbol: "๐ฟ", title: "Destiny", artist: "๋ถ๋๋งจ์", album: "Funk")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return musics.count
        // musics array์ ๊ฐ์๋งํผ ๋ฆฌํด
        // ํ ์น์์ ๋ก์ฐ๊ฐ ๋ช๊ฐ ํ์ํ์ง ์๋ ค์ค๋ค
        
        
        
        // ์ปจํธ๋กค๋ฌ๊ฐ ํ์ด๋ธ๋ทฐ์๊ฒ ํ์ํ ์น์์ ๊ฐ์๋ฅผ ์๋ ค์ค๋ค = numberOfSectionsInTableView
       
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! MusicTableViewCell
        
        let music = musics[indexPath.row] // ์ฐพ์๋ธ ๊ฐ์ ๊ฐ์ง๊ณ  ๋ก์ฐ์ ๋ง๊ฒ ์ฑ์ด๋ค
        cell.update(with: music)
        
        // 0๋ฒ ์น์์ 0๋ฒ ๋ก์ฐ์ ๋ญ ๋ฃ์ด์ผ ๋ผ? ํ๊ณ  ํ์ด๋ธ๋ทฐ๊ฐ ๋ฌผ์ด๋ณด๋ฉด ์ปจํธ๋กค๋ฌ๊ฐ ์๋ ค์ค๋ค
        
        // update ํจ์์ ์๋ ๋ด์ฉ์ ๋ง๋ค์๋ค
        
        
//        cell.textLabel?.text = music.title
//        cell.detailTextLabel?.text = music.artist
        cell.showsReorderControl = true // ํธ์ง ์ปจํธ๋กค ํ์ฑํ
        

        return cell
    }
    
    
    // indexPath ํ๋ฆฐํธ ํด๋ณด๊ธฐ
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let music = musics[indexPath.row]
//        print("\(music.title) \(indexPath)")
//    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // ๋ฐ์ดํฐ ๋ฐ๊ฟ์น๊ธฐ ํ๊ณ  ์๋ก ๋ทฐ๋ฅผ ๋ก๋ํด๋ผ
        let movedMusic = musics.remove(at: sourceIndexPath.row)
        musics.insert(movedMusic, at: destinationIndexPath.row)
        tableView.reloadData()
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // ์ญ์  ๊ฐ๋ฅ ์คํ์ผ๋ก ๋ณ๊ฒฝ
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            musics.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
    // ๋ค๋ฅธ๋ทฐ๋ก ์๋ฃ ๋๊ธฐ๊ธฐ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "editSegue" {
            let indexPath = tableView.indexPathForSelectedRow!
            let music = musics[indexPath.row]
            let navigationController = segue.destination as! UINavigationController
            let addEditMusicTableViewController = navigationController.topViewController as! AddEditMusicTableViewController
            
            addEditMusicTableViewController.musics = music
        }
        
        
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
        // ์์  ๊ฐ๋ฅํ ์ํ๋ก ๋ฐ๊พธ๋ ๋ฒํผ
        
    }
    
    @IBAction func unwindToMusicTableViewController(_ unwindSegue: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
        guard unwindSegue.identifier == "saveUnwind",
            let sourceViewController = unwindSegue.source as? AddEditMusicTableViewController,
            let music = sourceViewController.musics else { return }
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                musics[selectedIndexPath.row] = music
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: musics.count, section: 0)
                musics.append(music)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            
            }
    }
    
}

