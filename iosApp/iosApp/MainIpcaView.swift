//
//  MainIpcaView.swift
//  iosApp
//
//  Created by Giordano Mattiello on 31/05/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import shared

struct MainIpcaView: View {
    @ObservedObject var viewModel: MainIpcaViewModel
    
    init(viewModel: MainIpcaViewModel = MainIpcaViewModel()) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            if viewModel.monthlyIPCAs.count == 0 {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                } else {
                    Text("Loading...")
                }
            } else {
                List {
                    ForEach(viewModel.monthlyIPCAs.reversed(), id: \.self) { ipca in
                        Text("Em \(ipca.numberMonth) o IPCA foi \(ipca.value)%")
                    }
                }
            }
        }.onAppear() {
            viewModel.getIPCAData()
        }
    }
}

struct MainIpcaViewPreviews: PreviewProvider {
    static var previews: some View {
        MainIpcaView()
    }
}
