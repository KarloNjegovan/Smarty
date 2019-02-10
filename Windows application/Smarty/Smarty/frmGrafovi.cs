using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using Newtonsoft.Json.Linq;
using System.Text.RegularExpressions;

namespace Smarty {
    public partial class frmGrafovi: Form {
        public frmGrafovi() {
            InitializeComponent();
        }

        public class Stanica {
            public string time { get; set; }
            public string temp { get; set; }
            public string moist { get; set; }
            public string avgTemp { get; set; }
            public string avgMoist { get; set; }
            //public object alarming { get; set; }
        }

        public class RootObject {
            public List<Stanica> data { get; set; }
            public string type { get; set; }
        }

        static Int32 unixF;
        static Int32 unixT;

        private void dateTimePicker1_ValueChanged_1(object sender, EventArgs e) {
            unixF = int.Parse(dateTimePicker1.Value.Subtract(new DateTime(1970, 1, 1)).TotalSeconds.ToString());
            MessageBox.Show(unixF.ToString());
        }

        private void dateTimePicker2_ValueChanged(object sender, EventArgs e) {
            unixT = int.Parse(dateTimePicker2.Value.Subtract(new DateTime(1970, 1, 1)).TotalSeconds.ToString());
        }

        public static DateTime UnixTimeStampToDateTime(double unixTimeStamp) {
            // Unix timestamp is seconds past epoch
            System.DateTime dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
            dtDateTime = dtDateTime.AddSeconds(unixTimeStamp).ToLocalTime();
            return dtDateTime;
        }

        private void btnPrikazi_Click(object sender, EventArgs e) {
            string type = comboBox1.Text.ToString();
            string uuid = comboBox2.Text.ToString();

            uuid.Trim();

            string url2 = "https://mjerenje.info/dev_services/charts.php?type=" + type + "&uuid=" + uuid + "&token=" + User.token + "&unixF=" + unixF + "&unixT=" + unixT;

            url2 = Regex.Replace(url2, @"\s", "");

            using (WebClient client = new WebClient()) {
                string pagesource = client.DownloadString(url2);

                RootObject instance = Newtonsoft.Json.JsonConvert.DeserializeObject<RootObject>(pagesource);

                List<string> time;
                List<string> temp;
                List<string> moist;

                if (comboBox1.Text == "min") {
                    time = instance.data.Select(p => p.time).ToList();
                    temp = instance.data.Select(p => p.temp).ToList();
                    moist = instance.data.Select(p => p.moist).ToList();
                }
                else {
                    time = instance.data.Select(p => p.time).ToList();
                    temp = instance.data.Select(p => p.avgTemp).ToList();
                    moist = instance.data.Select(p => p.avgMoist).ToList();
                }

                List<double> dTemp = temp.Select(x => double.Parse(x, CultureInfo.InvariantCulture)).ToList();
                List<double> dMoist = moist.Select(x => double.Parse(x, CultureInfo.InvariantCulture)).ToList();

                chart1.ChartAreas[0].AxisX.Title = "Time";
                for (int i=0; i < dTemp.Count-1; i++) {
                    var x = UnixTimeStampToDateTime(double.Parse(time[i])).ToString();
                    chart1.Series["Temp"].Points.AddXY(x, dTemp[i]);
                }
                
                foreach (double d in dMoist) {
                    chart1.Series["Moisture"].Points.AddY(d);
                }
            }
        }

        private void frmGrafovi_Load(object sender, EventArgs e) {
            string url = "https://mjerenje.info/dev_services/access.php?token=" + User.token;

            using (WebClient client = new WebClient()) {
                var pagesource = client.DownloadString(url);

                dynamic stuff = JObject.Parse(pagesource);
                string message = stuff["message"].ToString();
                string success = stuff["success"].ToString();
                string stations = stuff["stations"].ToString();
                
                char[] charsToTrim = { ' ', '[', '\"', ']' };
                foreach(char c in charsToTrim) {
                    stations = stations.Replace(c, ' ');
                }
                stations.Trim();
                string[] lista = stations.Split(',');
                
                foreach (string s in lista) {
                    comboBox2.Items.Add(s);
                }

                if (success == "1") { }
                else {
                    MessageBox.Show(message);
                }
            }
        }
    }
}
