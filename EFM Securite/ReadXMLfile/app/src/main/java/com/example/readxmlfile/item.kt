package com.example.readxmlfile

class Item() {
    lateinit var title :String
    lateinit var description :String

    constructor(title :String , description :String) : this() {
        this.title = title
        this.description = description
    }

    override fun toString(): String {
        return "Title :$title / Description :$description"
    }
}