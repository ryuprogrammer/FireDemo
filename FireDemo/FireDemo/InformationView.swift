//
//  InformationView.swift
//  FireDemo
//
//  Created by トム・クルーズ on 2024/04/12.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("本日の出店")
                        .font(.title2)
                    
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.orange)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                    
                    HStack {
                        Text("生田 小田急 OX")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("17:00 ~ 21:00")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding(.trailing)
                    }
                }
                
                Text("天候等によって出店できない場合がございます。\n正確な情報はインスタのストーリーをご覧ください。")
                    .font(.callout)
                    .foregroundStyle(Color.gray)
                    .padding(.bottom)
                
                HStack {
                    Text("2024年02月 スケジュール")
                        .font(.title2)
                    
                    Spacer()
                }
                
                Image("scheImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
            .navigationBarTitle("出店情報", displayMode: .inline)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    InformationView()
}
