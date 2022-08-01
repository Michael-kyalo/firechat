//
//  TitleRow.swift
//  firechat
//
//  Created by rt on 01/08/2022.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://unsplash.com/photos/4Yv84VgQkRM")
    var name = "Akanji Charles"
    var body: some View {
        HStack(spacing:20){
            AsyncImage(url: imageUrl){
                image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            }placeholder: {
                ProgressView()
            }
            VStack(alignment:.leading) {
                Text(name).font(.title).bold()
                Text("online").font(.caption).foregroundColor(.gray)
            }.frame(maxWidth:.infinity, alignment: .leading)
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }.padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Peach"))
    }
}
