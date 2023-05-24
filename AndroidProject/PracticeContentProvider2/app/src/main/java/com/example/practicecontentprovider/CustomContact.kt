package com.example.practicecontentprovider

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class CustomContact(var lst:ArrayList<ContactItem>): RecyclerView.Adapter<CustomContact.VH>() {
    class VH(item:View): RecyclerView.ViewHolder(item) {
        lateinit var id:TextView
        lateinit var name:TextView
        lateinit var number:TextView
        lateinit var image:ImageView
        init {
            name = item.findViewById(R.id.name)
            id = item.findViewById(R.id.id)
            number = item.findViewById(R.id.number)
            image = item.findViewById(R.id.image)
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): VH {
        var item = LayoutInflater.from(parent.context).inflate(R.layout.custom_item,parent,false)
        return VH(item)
    }

    override fun getItemCount(): Int {
        return lst.size
    }

    override fun onBindViewHolder(holder: VH, position: Int) {

        var pos = lst[position]
        holder.id.text = pos.id
        holder.name.text = pos.name
        holder.number.text = pos.num
        holder.image.setImageResource(pos.pic.toInt())
    }
}