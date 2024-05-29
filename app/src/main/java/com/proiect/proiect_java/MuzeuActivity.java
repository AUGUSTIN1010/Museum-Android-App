package com.proiect.proiect_java;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.proiect.proiect_java.databinding.ActivityMainBinding;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class MuzeuActivity extends Activity {
    public static ActivityMainBinding binding;

    public MuzeuActivity()
    {

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.muzeu_activity);

        // preluare date trimise din MainActivity - id-ul muzeului
        Bundle extras = getIntent().getExtras();

        String value = null;
        if (extras != null) {
            value = extras.getString("key");    // preluare id-ul muzeului
        }
        Log.i("value", value);

        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        // buton de inapoi, pentru a reveni la MainActivity
        Button button = (Button)findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
                                      @Override
                                      public void onClick(View v) {
                                          Intent intent = new Intent(MuzeuActivity.this, MainActivity.class);
                                          startActivity(intent);
                                      }
                                  }
                                  );

        // Preluare date din baza de date despre muzeul dorit
        String fullString = "";
        URL url = null;
        try {
            url = new URL("https://androidapi23.000webhostapp.com/get_museum_data.php?id=" + value);    // preluare date din baza de date
                                                                                                            // printr-un API scris in php
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        }
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new InputStreamReader(url.openStream()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String line;
        while (true) {
            try {
                if (!((line = reader.readLine()) != null)) break;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            fullString += line; // formatare string cu toate datele
        }
        try {
            reader.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        JSONArray arr;
        try {
            arr = new JSONArray(fullString);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }

        for(int i = 0; i < arr.length(); i++)
        {
            JSONObject obj;
            try {
                obj = arr.getJSONObject(i);
            } catch (JSONException e) {
                throw new RuntimeException(e);
            }
            try {
                ImageView a = (ImageView)findViewById(R.id.imageView);
                Bitmap bitmap = BitmapFactory.decodeStream((InputStream)new URL(obj.getString("image")).getContent());
                a.setImageBitmap(bitmap);

                TextView text = (TextView)findViewById(R.id.textView2);
                text.setText(obj.getString("text"));
            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (JSONException e) {
                throw new RuntimeException(e);
            }
        }

        // setContentView(webview);
    }
}
