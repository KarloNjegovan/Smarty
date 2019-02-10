using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json.Linq;

namespace Smarty {
    public partial class frmRegistracijaStanica: Form {
        public frmRegistracijaStanica() {
            InitializeComponent();
        }

        private void btnRegistriraj_Click(object sender, EventArgs e) {
            string name = txtIme.Text.ToString();
            string location = txtLokacija.Text.ToString();
            string temp = txtTemp.Text.ToString();
            string humid = txtHumid.Text.ToString();
            string type = "station";

            Guid g;
            g = Guid.NewGuid();
            string uuid = g.ToString();

            string url = "https://mjerenje.info/dev_services/registration.php?token=" + User.token + "&type=" + type + "&name=" + name + "&location=" + location + "&temp=" + temp + "&humid=" + humid;

            MessageBox.Show(url);

            using (WebClient client = new WebClient()) {
                string pagesource = client.DownloadString(url);

                dynamic stuff = JObject.Parse(pagesource);
                string message = stuff["message"].ToString();
                string success = stuff["success"].ToString();

                if (success == "1") {
                    MessageBox.Show(message);
                }
                else {
                    MessageBox.Show(message);
                }
            }
        }
    }
}
