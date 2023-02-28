//
//  ViewModel.swift
//  SaveImageSample
//
//  Created by cmStudent on 2023/02/28.
//

import UIKit

class ContentViewModel: ObservableObject {
    let fileManager = File.shared
    
    // ファイルから読み込んだあと、表示するために使う。書き込みの際は使わない
    @Published var image: UIImage?
    
    /**
     imageを保存する
     @Param image 保存したい画像
     @Param fileName このファイル名で保存する
     @return
     */
    func save(image: UIImage, fileName: String) {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            // TODO: jpegに変換できなかった時の処理
            return
        }
        
        guard let path = fileManager.getLibraryFileURL(fileName: fileName) else {
            // TODO: URLがない時の処理
            return
        }
        
        if fileManager.save(file: imageData, path: path) {
            // 保存先フルパス
            print(path.absoluteString)
            print("Preservation Success!")
        } else {
            print("Failure to save.")
        }
            
    }
    
    /**
     指定された名前のファイルを呼び出す
     @Param fileName 呼び出したいファイル名
     @return
     */
    func load(fileName: String) {
        if let path = fileManager.getLibraryFileURL(fileName: fileName) {
            print(path)
            self.image = fileManager.load(path: path)
        }
    }
    
    
}
