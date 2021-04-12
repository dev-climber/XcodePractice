//
//  MusicTableViewController.swift
//  MusicDictionary
//
//  Created by Jungsang Lim on 2021/04/09.
//

import UIKit

class MusicTableViewController: UITableViewController {
    
    var musics: [Music] = [
        Music(symbol: "💿", title: "아름다운 것", artist: "언니네이발관", album: "가장 보통의 존재"),
        Music(symbol: "💿", title: "Dynamite", artist: "BTS", album: "BE"),
        Music(symbol: "💿", title: "서른 즈음에", artist: "김광석", album: "김광석 네번째"),
        Music(symbol: "💿", title: "Goodbye Aluminium", artist: "달빛요정역전만루홈런", album: "Sophomore Jinx"),
        Music(symbol: "💿", title: "Destiny", artist: "불독맨션", album: "Funk")
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
        // musics array의 개수만큼 리턴
        // 한 섹션에 로우가 몇개 필요한지 알려준다
        
        
        
        // 컨트롤러가 테이블뷰에게 필요한 섹션의 개수를 알려준다 = numberOfSectionsInTableView
       
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! MusicTableViewCell
        
        let music = musics[indexPath.row] // 찾아낸 값을 가지고 로우에 맞게 채운다
        cell.update(with: music)
        
        // 0번 섹션에 0번 로우에 뭐 넣어야 돼? 하고 테이블뷰가 물어보면 컨트롤러가 알려준다
        
        // update 함수에 아래 내용을 만들었다
        
        
//        cell.textLabel?.text = music.title
//        cell.detailTextLabel?.text = music.artist
        cell.showsReorderControl = true // 편집 컨트롤 활성화
        

        return cell
    }
    
    
    // indexPath 프린트 해보기
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let music = musics[indexPath.row]
//        print("\(music.title) \(indexPath)")
//    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 데이터 바꿔치기 하고 새로 뷰를 로드해라
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

    // 삭제 가능 스타일로 변경
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
    // 다른뷰로 자료 넘기기
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
        // 수정 가능한 상태로 바꾸는 버튼
        
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

