package pokenur.pokenur;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.RetryPolicy;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;
import java.util.Map;

public class Login extends AppCompatActivity {

    String token;

    EditText txtemail;
    EditText txtpassword;
    ProgressBar pbprogreso;
    Button btningresar;
    Button btnRegistrar;
    Button btnRecuperar;

    JsonObjectRequest array;
    RequestQueue mRequestQueue;
    private final String url = MyApplication.SERVER_URL + "iniciarSesion";
//    private final String url = "http://192.168.1.134:8080/RestApi/public/iniciarSesion";
    private final String TAG = "PRUEBITA";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        iniciarControles();
        pbprogreso.setVisibility(View.INVISIBLE);

    }

    private void iniciarControles(){
        txtemail = (EditText) findViewById(R.id.txtemail);
        txtpassword = (EditText) findViewById(R.id.txtpassword);
        pbprogreso = (ProgressBar) findViewById(R.id.pbprogreso);
        btningresar = (Button) findViewById(R.id.btningresar);
        btnRegistrar = (Button) findViewById(R.id.btnRegistrar);
        btnRecuperar = (Button) findViewById(R.id.btnRecContraseña);
    }

    public void ejecutar_Login(View view){

        if(txtemail.getText().toString().equals("")){
            Toast.makeText(getApplicationContext(), "el email no puede esta en blanco para ingresar.", Toast.LENGTH_LONG).show();
            return;
        }
        if(txtpassword.getText().toString().equals("")){
            Toast.makeText(getApplicationContext(), "la contraseña es obligatoria para poder entrar", Toast.LENGTH_LONG).show();
            return;
        }

        mRequestQueue = VolleySingleton.getInstance().getmRequestQueue();
        pbprogreso.setVisibility(View.VISIBLE);
        StringRequest request = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                String token = response;
                pbprogreso.setVisibility(View.INVISIBLE);
                Toast.makeText(getApplicationContext(), "Token = " + token, Toast.LENGTH_LONG).show();
//                startActivity(new Intent(getApplicationContext(), Principal.class));
                Intent i = new Intent(getApplicationContext(), Principal.class);
                i.putExtra("token", token);
                startActivity(i);

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                pbprogreso.setVisibility(View.INVISIBLE);
                Log.d("TAG", error.toString());
                Toast.makeText(getApplicationContext(), "usuario o contraseña incorrectos", Toast.LENGTH_LONG).show();
            }
        })
        {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> map = new HashMap<String, String>();
                map.put("email", txtemail.getText().toString());
                map.put("password", txtpassword.getText().toString());

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
//        Toast.makeText(getApplicationContext(), request.toString(), Toast.LENGTH_LONG).show();

    }

    public void ejecutar_Registro(View view){
        Intent registro = new Intent(this, Registrar.class);
        startActivity(registro);
    }

    public void ejecutar_Recuperacion(View view){
        Intent recuperar = new Intent(this, Recuperar.class);
        startActivity(recuperar);
    }
}
