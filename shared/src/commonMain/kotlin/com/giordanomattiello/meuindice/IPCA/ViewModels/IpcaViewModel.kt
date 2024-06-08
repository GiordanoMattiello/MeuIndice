package com.giordanomattiello.meuindice.IPCA.ViewModels

import com.giordanomattiello.meuindice.IPCA.Models.MonthlyIPCA
import com.giordanomattiello.meuindice.IPCA.Worker.IpcaWorker

class IpcaViewModel {
    val title: String = "Meu IPCA"
    val subtitle: String = "Veja o ipca"
    val ipcaWorker = IpcaWorker()


    suspend fun getMonthlyIPCAs(): List<MonthlyIPCA> {
        return ipcaWorker.getIPCAFromBCdata()
    }
}

