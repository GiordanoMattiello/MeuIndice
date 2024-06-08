package com.giordanomattiello.meuindice.IPCA.Models

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class BcIpcaDTOData (
    @SerialName("data")
    val date: String,
    @SerialName("valor")
    val value: Double,
)