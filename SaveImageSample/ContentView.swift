//
//  ContentView.swift
//  SaveImageSample
//
//  Created by cmStudent on 2023/02/28.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    var image = UIImage(named: "inu")!
    
    var body: some View {
        VStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
            } else {
                Text("ないよ〜")
            }
            Button {
                // FIXME: ここのfileNameは、存在するファイルネームである必要がある
                viewModel.load(fileName: "aaa.jpeg")
            } label: {
                Text("タップで呼び出す")
            }
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 120)
            Button {
                // FIXME: ここのfileNameは、毎回違う名前をつける必要がある
                viewModel.save(image: image, fileName: "aaa.jpeg")
            } label: {
                Text("タップでファイル保存する")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
