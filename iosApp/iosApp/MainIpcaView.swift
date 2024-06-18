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
    @State private var selectedColor = "Escolha um indice"
    @State private var inicialMonth: String? = nil
    @State private var inicialYear: Int? = nil
    @State private var finalMonth: String = ""
    @State private var finalYear: Int = -1
    
    init(viewModel: MainIpcaViewModel = MainIpcaViewModel()) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        NavigationView {
                VStack {
                    // Bleeds into NavigationView
                    Rectangle()
                        .frame(height: 0)
                    Divider()
                    Picker("Escolha o indice", selection: $selectedColor) {
                        ForEach(viewModel.indices, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.menu)
                    Divider()
                    HStack(alignment: .center) {
                        Text("Data Inicial")
                        Picker("Mês", selection: $inicialMonth) {
                            ForEach(viewModel.pikerMonths, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.wheel)
                        Picker("Ano", selection: $inicialYear) {
                            ForEach(viewModel.pikerYears, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.wheel)
                    }.frame(height: 100)
                    .padding([.leading,.trailing])
                    Divider()
                    HStack(alignment: .center) {
                        Text("Data Final")
                        Picker("Mês", selection: $finalMonth) {
                            ForEach(viewModel.pikerMonths, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.wheel)
                        Picker("Ano", selection: $finalYear) {
                            ForEach(viewModel.pikerYears, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.wheel)
                    }.frame(height: 100)
                    .padding([.leading,.trailing])
                    Spacer()
                }
                .background(Color.white)
                .navigationTitle(
                    Text("Meu Indice").font(.title)
                )
            }
//        HStack {
//            VStack {

//                if viewModel.monthlyIPCAs.count == 0 {
//                    if let errorMessage = viewModel.errorMessage {
//                        Text(errorMessage)
//                    } else {
//                        Text("Loading...")
//                    }
//                } else {
//                    Text("Ok")
//                    //                List {
//                    //                    ForEach(viewModel.monthlyIPCAs.reversed(), id: \.self) { ipca in
//                    //                        Text("Em \(ipca.numberMonth) o IPCA foi \(ipca.value)%")
//                    //                    }
//                    //                }
//                }
//            }
//        }.background(Color.purple)
//        
//        .onAppear() {
//            viewModel.getIPCAData()
//        }
        
    }
}

struct MainIpcaViewPreviews: PreviewProvider {
    static var previews: some View {
        MainIpcaView()
    }
}
