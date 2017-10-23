package pokenur.pokenur;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.RetryPolicy;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;
import java.util.Map;

import static pokenur.pokenur.R.id.txtEmailR;

public class Recuperar extends AppCompatActivity {

    EditText txtEmail;
    Button btnEnviar;

    Button btnOnSaveUser;

    RequestQueue mRequestQueue;
    //    private final String url = "http://192.168.43.28:8080/RestApi/public/iniciarSesion";
    // private final String url = "http://192.168.1.134:8080/RestApi/public/registrar";
    private final String url = "http://192.168.43.63:8081/RestApi/public/mail";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recuperar);

        iniciarControles();
    }

    public void iniciarControles(){
        txtEmail = (EditText) findViewById(txtEmailR);
        btnEnviar = (Button) findViewById(R.id.btnEnviarR);
    }

    public void ejecutar_recuperacion(View view){

        mRequestQueue = VolleySingleton.getInstance().getmRequestQueue();
        StringRequest request = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Toast.makeText(getApplicationContext(), "Envio de correo exitoso", Toast.LENGTH_LONG).show();
                startActivity(new Intent(getApplicationContext(), Confirmar.class));

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("TAG", error.toString());
                Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_LONG).show();
            }
        })
        {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> map = new HashMap<String, String>();

                map.put("email", txtEmail.getText().toString());
                return map;
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> params = new HashMap<String, String>();
                params.put("Accept", "application/json");
                params.put("Content-Type", "application/x-www-form-urlencoded");
                return params;
            }

            @Override
            public RetryPolicy getRetryPolicy() {
                return new DefaultRetryPolicy(
                        5000,
                        DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                        DefaultRetryPolicy.DEFAULT_BACKOFF_MULT);
            }
        };
        mRequestQueue.add(request);
        Toast.makeText(getApplicationContext(), request.toString(), Toast.LENGTH_LONG).show();

    }
}
