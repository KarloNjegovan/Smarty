package hr.foi.aplikacija;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.os.AsyncTask;
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

import static java.security.AccessController.getContext;

public class Podaci_grafovi extends AsyncTask<String, Void, String> {


    private LineChart[] mCharts=new LineChart[2];
    private int[] mColors=new int[]{
            Color.rgb(137, 236, 81), Color.rgb(240, 230, 30), Color.rgb(89, 199, 250),
            Color.rgb(250, 104, 119)
    };
    Context con;
    String JSON_STRING;
    String json_url;
    Podaci_grafovi(Context ctx){
        con=ctx;

    }

    @Override
    protected void onPreExecute() {
        json_url="http://mjerenje.info/services/MjerenjeSat.php";
    }

    @Override
    protected String doInBackground(String... params) {
        String bs= params[0];

        /*    URL url=new URL(json_url);
            HttpURLConnection httpURLConnection=(HttpURLConnection)url.openConnection();
            httpURLConnection.setRequestMethod("GET");
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            OutputStream outputStream =httpURLConnection.getOutputStream();
            BufferedWriter bufferedWriter =new BufferedWriter(new OutputStreamWriter(outputStream,"UTF-8"));
            String post_data= URLEncoder.encode("bs", "UTF-8")+"="+URLEncoder.encode(bs, "UTF-8");
            bufferedWriter.write(post_data);
            bufferedWriter.flush();
            bufferedWriter.close();
            outputStream.close();
            InputStream InputStream = httpURLConnection.getInputStream();
            BufferedReader bufferedReader= new BufferedReader(new InputStreamReader(InputStream));
            StringBuilder stringBuilder=new StringBuilder();
            while((JSON_STRING = bufferedReader.readLine())!=null){

                stringBuilder.append(JSON_STRING+"\n");

            }
            while((JSON_STRING = bufferedReader.readLine())!=null){

                stringBuilder.append(JSON_STRING+"\n");

            }
            bufferedReader.close();
            InputStream.close();
            httpURLConnection.disconnect();
            return stringBuilder.toString().trim();*/
        String result="63,58,63,45,86,38,56,37,56,83,75,83,76,57,36,57";
        return  result;

    }

    @Override
    protected void onProgressUpdate(Void... values) {
        super.onProgressUpdate(values);
    }



    @Override

    protected void onPostExecute(String result) {


        String bla= result.replaceAll("[|?*<\">+\\{\\}\\[\\]/]", "");
       View pogled1  = (View) ((Activity) con).findViewById(R.id.chart1);
        View pogled2  = (View) ((Activity) con).findViewById(R.id.chart2);


        mCharts[0]=(LineChart) pogled1;
        mCharts[1]=(LineChart) pogled2;



        for(int i=0; i<mCharts.length; i++){
            LineData data= getData(bla, i);
            setupChart(mCharts[i], data, mColors[i]);


        }

    }



    private LineData getData(String count, int brojGrafa) {
        ArrayList<Entry> yVals=new ArrayList<>();
        String[] polje = count.split(",");
        if(brojGrafa==0){
            for(int i=0; i<10; i++){

                float val=(float) (Float.parseFloat(polje[i]));
                yVals.add(new Entry(i, val));
            }
        }

        else{
            int j=0;
            for(int i=0; i<polje.length; i++){

                float val=(float) (Float.parseFloat(polje[i]));
                yVals.add(new Entry(j, val));
                j++;
            }

        }



        LineDataSet set1=new LineDataSet(yVals, "test");
        set1.setLineWidth(3f);
        set1.setCircleRadius(5f);
        set1.setCircleHoleRadius(2.5f);
        set1.setColor(Color.LTGRAY);
        set1.setCircleColor(Color.WHITE);
        set1.setHighLightColor(Color.WHITE);
        set1.setDrawValues(false);

        LineData data= new LineData(set1);
        return data;
    }

    private void setupChart(LineChart chart, LineData data, int color) {

        ((LineDataSet) data.getDataSetByIndex(0)).setCircleHoleColor(color);
        chart.getDescription().setEnabled(false);
        chart.setDrawGridBackground(false);

        chart.setTouchEnabled(true);
        chart.setDragEnabled(true);
        chart.setScaleEnabled(true);
        chart.setPinchZoom(false);
        chart.setBackgroundColor(color);
        chart.setViewPortOffsets(10,0,10,0);
        chart.setData(data);
    }


}
