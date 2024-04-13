//
//  HomeView.swift
//  FireDemo
//
//  Created by トム・クルーズ on 2024/04/12.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("ホームページ")
                    Text("インスタ")
                } header: {
                    Text("SNS")
                }
                
                Section {
                    Text("こだわり")
                    Text("メニュー紹介")
                    Text("スタッフ募集")
                } header: {
                    Text("店舗情報")
                }
                
                Section {
                    Text("お問合せ")
                } header: {
                    Text("お問合せ")
                }
                
                Section {
                    Text("プライバシーポリシー")
                    Text("利用規約")
                } header: {
                    Text("アプリ情報")
                }
            }
            .background(Color("backColor"))
            .navigationBarTitle("ホーム", displayMode: .inline)
        }
    }
}

#Preview {
    HomeView()
}
