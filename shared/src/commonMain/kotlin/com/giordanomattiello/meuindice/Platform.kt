package com.giordanomattiello.meuindice

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform