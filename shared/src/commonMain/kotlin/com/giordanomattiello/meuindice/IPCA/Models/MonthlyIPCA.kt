package com.giordanomattiello.meuindice.IPCA.Models
import kotlinx.datetime.LocalDate
import kotlinx.datetime.monthsUntil


data class MonthlyIPCA(
    val dateString: String,
    val percentageValue: Double) {
    val numberMonth: Int
    val value: Double
    val date: LocalDate
    val dayNumber:Int
    val monthNumber:Int
    val yearNumber:Int

    init {
        if (isValidDate(dateString) == false){
            throw Exception("Date format is invalid")
        }
        val dateAuxArray = dateString.split("/")
        dayNumber = dateAuxArray[0].toInt()
        monthNumber = dateAuxArray[1].toInt()
        yearNumber = dateAuxArray[2].toInt()
        date = LocalDate(yearNumber, monthNumber, dayNumber)
        numberMonth = LocalDate(1980, 1, 1).monthsUntil(date)
        value = percentageValue / 100
    }

    fun isValidDate(date: String): Boolean {
        val dateRegex = Regex("""^([1-9]|0[1-9]|[12][0-9]|3[01])/([1-9]|0[1-9]|1[0-2])/\d{4}$""")
        return dateRegex.matches(date)
    }
}
