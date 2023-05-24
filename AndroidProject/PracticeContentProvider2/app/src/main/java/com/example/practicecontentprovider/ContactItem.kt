package com.example.practicecontentprovider

class ContactItem(var id :String, var name:String ,var num :String,var pic:String) {
    companion object{
        var lst = ArrayList<ContactItem>()
        fun getlst():ArrayList<ContactItem>{
            return lst
        }
    }
}