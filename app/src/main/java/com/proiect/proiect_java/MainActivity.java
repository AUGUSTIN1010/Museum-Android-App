package com.proiect.proiect_java;

import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.TableLayout;
import android.widget.TableRow;
import androidx.appcompat.app.AppCompatActivity;
import com.proiect.proiect_java.databinding.ActivityMainBinding;
import android.widget.TextView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class MainActivity extends AppCompatActivity {
    public static ActivityMainBinding binding;

    public MainActivity() {

    }

    @Override
    // onCreate e folosoita pentru realizarea interfetei grafice a aplicatiei
    // + realizarea altor prelucrari/adaugare de callback-uri (un eveniment pentru un item din interfata grafica)
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // iti ofera posibilitatea de a prelua date din URL/link
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        // Inceput cod pentru a prelua date din URL
        String fullString = "";
        URL url = null;
        try {
            url = new URL("https://androidapi23.000webhostapp.com/get_data.php");
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
            fullString += line;
        }
        try {
            reader.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        // Sfarsit cod pentru a prelua date din URL

        // Prelucrare JSON pe baza datelor preluate de la URL
        JSONArray arr;
        try {
            arr = new JSONArray(fullString);    // popularea unui array json pentru prelucrare mai usoara a datelor
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }

        JSONObject obj;
        TableLayout table = binding.tablelay;
        try {
            for (int i = 0; i < arr.length(); i++) {
                obj = arr.getJSONObject(i); // trecerea prin array json pentru a utiliza datele pentru fiecare muzeu
                // Creeaza o linie in tabel
                TableRow content1 = new TableRow(this);
                TextView text1 = new TextView(this);
                TextView text2 = new TextView(this);
                text1.setHeight(100);
                text1.setPadding(0, 10, 0, 0);
                text2.setHeight(100);
                text2.setPadding(0, 10, 0, 0);
                try {
                    text1.setText(obj.getString("id"));
                } catch (JSONException A) {
                    throw new RuntimeException(A);
                }
                text1.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                text2.setText(obj.getString("nume_muzeu"));
                text2.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                content1.addView(text1);
                content1.addView(text2);
                // Sfarsit creeare linie in tabel

                int finalI = i;
                // Callback atunci cand se apasa pe o linie din tabel
                content1.setOnClickListener(new View.OnClickListener(){
                    @Override
                    public void onClick(View view) {
                        Intent nextScreen = new Intent(getApplicationContext(), MuzeuActivity.class);
                        if(view instanceof TableRow) {  // verificare daca view-ul este o linie
                            TableRow row = (TableRow) view;
                            TextView textView = (TextView) row.getChildAt(0);   // preluarea primului element din linie (textview - id)
                            nextScreen.putExtra("key", textView.getText()); // trimitere id catre pagina cu date despre muzeu
                            startActivity(nextScreen);  // afisare pagina muzeu
                        }
                    }
                });
                // Sfarsit callback

                table.addView(content1);    // adaugare linie in tabel
            }
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        // Sfarsit prelucrare JSON
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }


}