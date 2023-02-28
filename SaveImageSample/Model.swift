//
//  Model.swift
//  SaveImageSample
//
//  Created by cmStudent on 2023/02/28.
//

import UIKit

// フォルダに保存するためのやつ
class File {
    // 何個もインスタンス作られても鬱陶しいので、シングルトン。
    static let shared: File = .init()
    private init() {}
    
    /**
     ライブラリフォルダURLを取得する
     @Param fileName 任意のファイル名
     @return ライブラリフォルダURL
     */
    func getLibraryFileURL(fileName: String) -> URL? {
        guard let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first else {
            print("Library URL does not exist")
            return nil
        }
        
        return libraryURL.appendingPathComponent(fileName)
        
    }
    
    /**
     ファイルを指定の場所に保存する
     @Param file 保存したいデータ
     @Param path 保存先URL
     @return 保存できたかどうか
     */
    func save(file: Data, path: URL) -> Bool {
        do {
            try file.write(to: path)
            return true
            
        } catch {
            print("Failed to save the image")
        }
        return false
    }
    
    /**
     指定したファイルを呼び出す
     @Param path 呼び出したいファイルのフルパス
     @return UIImage?
     */
    func load(path: URL) -> UIImage? {
        do {
            let image = try Data(contentsOf: path)
            return UIImage(data: image)
        } catch {
            print("Failed to load.")
        }
        return nil
    }
}
