package hr.foi.aplikacija;

import android.content.Context;
import android.graphics.Color;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.TextView;

import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Trenutno_stanje extends AppCompatActivity {

    String bs;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_trenutno_stanje);
        Bundle extras = getIntent().getExtras();
        String BrojStanice;
        BrojStanice = extras.getString("idGumba");
        Pattern p = Pattern.compile("\\d+");
        Matcher m = p.matcher(BrojStanice);

        while (m.find()) {
            bs = m.group();
        }
        Podaci_sec();
    }

    public void Podaci_sec() {
        Podaci_grafovi Podaci_grafovi= new Podaci_grafovi(this);
        Podaci_grafovi.execute(bs);
    }
}

