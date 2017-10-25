package pokenur.pokenur;

import android.app.Application;

/**
 * Created by COCCO on 09/10/2017.
 */

import android.app.Application;
import android.content.Context;
public class MyApplication extends Application {
    private static MyApplication mInstance;
    private static Context mAppContext;


    public static final String SERVER_URL = "http://192.168.43.28:8080/RestApi/public/";

    @Override
    public void onCreate() {
        super.onCreate();
        mInstance = this;

        this.setAppContext(getApplicationContext());
    }

    public static MyApplication getInstance(){
        return mInstance;
    }
    public static Context getAppContext() {
        return mAppContext;
    }
    public void setAppContext(Context mAppContext) {
        this.mAppContext = mAppContext;
    }
}