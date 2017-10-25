package pokenur.pokenur;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.RadioButton;
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

public class Principal extends AppCompatActivity {

    RadioButton rbFuego;
    RadioButton rbAgua;
    RadioButton rbPlanta;
    Button btnSeleccion;

    String ataques;

//    Bundle datos = this.getIntent().getExtras();
//    int variable = datos.getInt("token");

    String token;

    RequestQueue mRequestQueue;
        private final String url = MyApplication.SERVER_URL + "seleccionarPokemon";
//    private final String url = "http://192.168.1.134:8080/RestApi/public/seleccionarPokemon";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_principal);

        iniciarControles();
        token = getIntent().getStringExtra("token");
    }

    public void iniciarControles(){
        rbFuego = (RadioButton) findViewById(R.id.rbFuego);
        rbAgua = (RadioButton) findViewById(R.id.rbAgua);
        rbPlanta = (RadioButton) findViewById(R.id.rbPlanta);

        btnSeleccion = (Button) findViewById(R.id.btnSeleccion);
    }

    public void ejecutar_Seleccion(){
        mRequestQueue = VolleySingleton.getInstance().getmRequestQueue();
        StringRequest request = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                //String token = response;
                Toast.makeText(getApplicationContext(), "Seleccion Exitosa! Cuentas cono los sgtes. ataques : " + ataques, Toast.LENGTH_LONG).show();
//                startActivity(new Intent(getApplicationContext(), Login.class));

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

                    //map.put("usuario_id", token);

                if(rbFuego.isChecked()){
                    map.put("pokemon_id", "1");
                    ataques = "Ascuas | Llamarada | Giro de Fuego | V de Fuego";
                }

                if(rbFuego.isChecked()){
                    map.put("pokemon_id", "2");
                    ataques = "Buceo | Burbujas | Hidrobomba | Surf";
                }

                if(rbFuego.isChecked()){
                    map.put("pokemon_id", "3");
                    ataques = "Hojas Navaja | Latigo Sepa | Rayo Solar | Semillas Drenadoras";
                }

                return map;
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> params = new HashMap<String, String>();
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

