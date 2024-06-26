//
//  MainIpcaViewModel.swift
//  iosApp
//
//  Created by Giordano Mattiello on 06/06/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import shared

class MainIpcaViewModel: ObservableObject {
    private let ipcaModel: IpcaViewModel = IpcaViewModel()
    let indices = ["IPCA", "INPC", "IGPM"]
    let pikerMonths = ["jan.", "fev.", "mar.", "abr.", "mai.", "jun.", "jul.", "ago.", "set.", "out.", "nov.", "dez."]
    let pikerYears = [1,2,3,4,5,6,7,8,9]
    @Published var monthlyIPCAs: [MonthlyIPCA] = []
    @Published var errorMessage: String? = nil
    
    func getIPCAData() {
        ipcaModel.getMonthlyIPCAs(completionHandler: { [weak self] data, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            guard let data = data, data.count > 0 else {
                self?.errorMessage = "getMonthlyIPCAs data is nil or are empty"
                return
            }
            DispatchQueue.main.async {
                self?.monthlyIPCAs = data
            }
        })
    }
}
