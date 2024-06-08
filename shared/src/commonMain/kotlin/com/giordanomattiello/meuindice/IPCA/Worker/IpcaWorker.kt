package com.giordanomattiello.meuindice.IPCA.Worker

import com.giordanomattiello.meuindice.IPCA.Models.BcIpcaDTOData
import com.giordanomattiello.meuindice.IPCA.Models.MonthlyIPCA
import io.ktor.client.*
import io.ktor.client.call.body
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.request.*
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json

class IpcaWorker {
    private val httpClient = HttpClient {
        install(ContentNegotiation) {
            json(Json {
                prettyPrint = true
                isLenient = true
                ignoreUnknownKeys = true
            })
        }
    }

    suspend fun getIPCAFromBCdata(): List<MonthlyIPCA> {
        val response: List<BcIpcaDTOData> = httpClient.get("http://api.bcb.gov.br/dados/serie/bcdata.sgs.433/dados").body()
        var convertedData: List<MonthlyIPCA> = emptyList<MonthlyIPCA>()
        for ( data in response ) {
            try {
                convertedData += MonthlyIPCA(data.date,data.value)
            } catch (e: Exception) {}
        }
        return convertedData
    }

}