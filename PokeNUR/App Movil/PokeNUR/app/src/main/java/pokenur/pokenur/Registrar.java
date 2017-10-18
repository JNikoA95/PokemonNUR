package pokenur.pokenur;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.android.volley.RequestQueue;
import com.android.volley.toolbox.JsonObjectRequest;

public class Registrar extends AppCompatActivity {

    JsonObjectRequest array;
    RequestQueue mRequestQueue;
    //    private final String url = "http://192.168.43.28:8080/RestApi/public/iniciarSesion";
    private final String url = "http://192.168.0.143:8080/RestApi/public/iniciarSesion";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registrar);
    }
}
