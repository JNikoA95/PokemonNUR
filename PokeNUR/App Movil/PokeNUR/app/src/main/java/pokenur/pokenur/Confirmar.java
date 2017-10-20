package pokenur.pokenur;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.Button;
import android.widget.EditText;

/**
 * Created by Toshiba on 19/10/2017.
 */

public class Confirmar extends AppCompatActivity {

    EditText txtEmail;
    EditText txtPassword;
    EditText txtPasswordConfirm;
    Button btnGuardar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_confirmar);
        iniciarControles();
    }

    public void iniciarControles(){
        txtEmail = (EditText) findViewById(R.id.txtEmailC);
        txtPassword = (EditText) findViewById(R.id.txtPasswordC);
        txtPasswordConfirm = (EditText) findViewById(R.id.txtPasswordCC);
        btnGuardar = (Button) findViewById(R.id.btnGuardarC);
    }
}
