/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class PlayersViewController: UITableViewController {
  
  // MARK: - Properties

  var players = SampleData.generatePlayersData()
}

// MARK: - IBActions
extension PlayersViewController {
  
  @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
  }
  
  @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
    
    guard let playerDetailsViewController = segue.source as? PlayerDetailsViewController,
      let player = playerDetailsViewController.player else {
        return
    }
    
    // add the new player to the players array
    players.append(player)
    
    // update the tableView
    let indexPath = IndexPath(row: players.count - 1, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic) 
  }
}

// MARK: - UITableViewDataSource
extension PlayersViewController {
	override func viewDidAppear(_ animated:Bool)
	{
		let alertController = UIAlertController(title: "Welcome to My First App", message: SampleData.mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
		super.viewDidAppear(_ animated:animated)
	}  

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return players.count
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell",
                                             for: indexPath) as! PlayerCell
    
    let player = players[indexPath.row]
    cell.player = player
    return cell
  }
/*
  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
	let player = players[indexPath.row]
	//performSegue(withIdentifier:"Zsg-bI-zZp",sender:self);
  }
*/
// "?." is for optional chaining, and fails gracefully on nil dereference; "!." is for forced unwrapping, and would cause a crash on nil dereference
	override func prepare(for segue: UIStoryboardSegue, 
      sender: Any?)
	{
		let controller = segue.destination as? PlayerDetailsViewController
		let thePath = tableView.indexPathForSelectedRow
		if(thePath != nil && controller != nil)
		{
			controller?.player = players[thePath!.row]
		}
		controller?.goods = "HIT!";

	}
}
