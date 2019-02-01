//
//  ViewController.swift
//  MovieDB
//
//  Created by Cristian Torres on 1/31/19.
//  Copyright © 2019 Uesebe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    final let url  = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=34738023d27013e6d1b995443764da44")
    let urlTop      = "https://api.themoviedb.org/3/movie/top_rated?api_key=34738023d27013e6d1b995443764da44"
    var myIndex = 0
    
    
    private var movies = [Result]()
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var movieNameLbl: UILabel!
    @IBOutlet var movieImgView: UIImageView!
    @IBOutlet var voteAvg: UILabel!
    @IBOutlet var moviePopLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var overLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        //tableView.tableFooterView = UIView()
        
    }

    func downloadJson() {
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) {data, URLResponse, error in
            guard let data = data, error == nil, URLResponse != nil else {
                print("Algo salió mal")
                return
            }
            print("descargado")
            do{
                let decoder = JSONDecoder()
                let downloadedResults = try decoder.decode(Results.self, from: data)
                //print(downloadedResults.results[0].original_title)
                self.movies = downloadedResults.results
                print(self.movies[0].title)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UITableViewCell() }
        //print(cell.nameLbl.text!)
        cell.nameLbl.text = movies[indexPath.row].original_title
        cell.popularLbl.text = "Espectadores: " + String(movies[indexPath.row].popularity)
        
        if let imageURL = URL(string: "http://image.tmdb.org/t/p/w500" + movies[indexPath.row].poster_path){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*let cell = tableView.cellForRow(at: indexPath)
        print(cell?.contentView)*/
        
        if let url = URL(string: "\(movies[indexPath.row].title)") {
            UIApplication.shared.open(url, options: [:]) { (success) in
                print("Hemos visto \(self.movies[indexPath.row].poster_path)")
                
                DispatchQueue.main.async {
                    self.view.reloadInputViews()
                }
                
                
                let movieName = self.movies[indexPath.row].title
                let movieImg = URL(string: "http://image.tmdb.org/t/p/w500" + self.movies[indexPath.row].poster_path)
                    
                let vote = self.movies[indexPath.row].vote_average
                let moviePop = self.movies[indexPath.row].popularity
                let date = self.movies[indexPath.row].release_date
                let over = self.movies[indexPath.row].overview
                
                
                let miMovie = self.movies[indexPath.row]
                let miAlerta = UIAlertController(title: "Película elegida", message: "Elegiste la película \(miMovie.title) \(miMovie.original_language)", preferredStyle: .alert)
                miAlerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                self.present(miAlerta, animated: true, completion: nil)
                
                self.movieNameLbl.text = movieName
                //self.movieImgView.image = image
                self.voteAvg.text = String(vote)
                self.moviePopLbl.text = String(moviePop)
                self.dateLbl.text = date
                self.overLbl.text = over
                
            }
        }
    
        
        self.myIndex = indexPath.row
        self.performSegue(withIdentifier: "detailView", sender: self)
        
        
    }
    
    
    
}

