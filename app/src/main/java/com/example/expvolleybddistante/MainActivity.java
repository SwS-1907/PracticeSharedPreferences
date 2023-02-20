package com.example.expvolleybddistante;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
RequestQueue queue ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        String url="http://172.16.1.78/pecheur/addPecheur.php";
        queue= Volley.newRequestQueue(MainActivity.this);
        StringRequest sr = new StringRequest(
                Request.Method.POST,
                url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
Log.i("aa",response);
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
Log.i("aa",error.getMessage());
            }
        }){
            @Nullable
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> m= new HashMap<>();

                m.put("cin","A-Test");
                m.put("nom","N-Test");
                m.put("age","30");
                m.put("tech","1");
               // m.put("btnAj","true");
                return m;
            }
        }

        ;
        queue.add(sr);
    }
}