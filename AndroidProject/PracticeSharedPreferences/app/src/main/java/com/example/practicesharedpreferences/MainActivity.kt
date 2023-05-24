package com.example.practicesharedpreferences

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.preference.PreferenceManager
import com.example.practicesharedpreferences.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    lateinit var b:ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        b = ActivityMainBinding.inflate(layoutInflater)
        setContentView(b.root)


        // for set the shared preferences for only with this activity
//        getPreferences(MODE_PRIVATE)


        // for set the file name
//        getSharedPreferences("names", MODE_PRIVATE)

        var shared = PreferenceManager.getDefaultSharedPreferences(this)
        var edit = shared.edit()

        b.set.setOnClickListener {
            edit.putString("name",b.name.text.toString())
            edit.apply()
        }

        b.get.setOnClickListener {
            b.txt.text = shared.getString("name","Empty").toString()
        }

        /*
        there is a new wa to stored a values in the shered file
        the nes technology named dataStore

        Jetpack DataStore is a data storage solution that allows you to store key-value pairs or typed objects with protocol buffers. DataStore uses Kotlin coroutines and Flow to store data asynchronously, consistently, and transactionally.

If you're currently using SharedPreferences to store data, consider migrating to DataStore instead.
        */


    }
}