//
//  MovieViewController.swift
//  Tving
//
//  Created by 임재현 on 5/13/25.
//

import UIKit
import SnapKit

class MovieViewController: UIViewController {
    
    private let boxOfficeService = BoxOfficeService.shared
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "날짜 입력 (예: 20250513)"
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("영화 검색", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.separatorColor = .darkGray
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseIdentifier)
        return tableView
    }()
    
    private var movieList: [MovieInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupUI()
        
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        tableView.dataSource = self
    }
    
    private func setupUI() {
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(tableView)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(44)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc private func searchButtonTapped() {
        guard let dateText = searchTextField.text, !dateText.isEmpty else { return }
        fetchMovies(for: dateText)
    }
    
    private func fetchMovies(for date: String) {
        Task {
            do {
                movieList = try await boxOfficeService.fetchBoxOffice(date: date)
                tableView.reloadData()
            } catch {
                print("영화 목록 가져오기 실패:", error)
            }
        }
    }
}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as! MovieCell
        cell.configure(with: movieList[indexPath.row])
        return cell
    }
}

class MovieCell: UITableViewCell {
    
    static let reuseIdentifier = "MovieCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        contentView.addSubview(titleLabel)
        contentView.addSubview(rankLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        rankLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: MovieInfo) {
        titleLabel.text = movie.title
        rankLabel.text = "순위: \(movie.rank) | 개봉일: \(movie.openDate)"
    }
}
