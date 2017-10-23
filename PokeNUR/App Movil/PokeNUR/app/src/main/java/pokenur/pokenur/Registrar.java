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
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;
import java.util.Map;

public class Registrar extends AppCompatActivity {

    EditText txtNombre;
    EditText txtNombreUsuario;
    EditText txtEmail;
    EditText txtPassword;

    Button btnOnSaveUser;

    RequestQueue mRequestQueue;
        private final String url = "http://192.168.43.63:8081/RestApi/public/registrar";
//    private final String url = "http://192.168.1.134:8080/RestApi/public/registrar";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registrar);

        iniciarControles();
    }

    private void iniciarControles(){
        txtNombre = (EditText) findViewById(R.id.txtNombre);
        txtNombreUsuario = (EditText) findViewById(R.id.txtNombreUsuario);
        txtEmail = (EditText) findViewById(R.id.txtEmail);
        txtPassword = (EditText) findViewById(R.id.txtPassword);
        btnOnSaveUser = (Button) findViewById(R.id.btnSaveUser);

    }

    public void ejecutar_REgistro(View view){

        if(txtEmail.getText().toString().equals("") || txtNombre.getText().toString().equals("") ||
                txtNombreUsuario.getText().toString().equals("") || txtPassword.getText().toString().equals("")){
            Toast.makeText(getApplicationContext(), "Falta rellenar algun campo, por favor verfique que todos los campos han sido llenados", Toast.LENGTH_LONG).show();
            return;
        }

        mRequestQueue = VolleySingleton.getInstance().getmRequestQueue();
        StringRequest request = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                String token = response;
                Toast.makeText(getApplicationContext(), "Registro Exitoso de : " + txtNombreUsuario.getText().toString(), Toast.LENGTH_LONG).show();
                startActivity(new Intent(getApplicationContext(), Login.class));

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("TAG", error.toString());
                Toast.makeText(getApplicationContext(), "hubo alguna falla, intente nuevamente", Toast.LENGTH_LONG).show();
            }
        })
        {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> map = new HashMap<String, String>();
                map.put("name", txtNombre.getText().toString());
                map.put("nameUser", txtNombreUsuario.getText().toString());
                map.put("email", txtEmail.getText().toString());
                map.put("password", txtPassword.getText().toString());
                map.put("cantDinero", "0");

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
