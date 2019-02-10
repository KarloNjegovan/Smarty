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
    public partial class frmRegistracija: Form {
        public frmRegistracija() {
            InitializeComponent();
        }
        
        private void btnRegistriraj_Click(object sender, EventArgs e) {
            string username = txtKorIme.Text.ToString();
            string pass = txtLozinka.Text.ToString();
            string email = txtEmail.Text.ToString();

            Guid g;
            g = Guid.NewGuid();
            string uuid = g.ToString();

            string url = "https://mjerenje.info/dev_services/registration.php?type=user" + "&token=" + User.token + "&user=" + username + "&pass=" + pass + "&email=" + email;

            using (WebClient client = new WebClient()) {
                var pagesource = client.DownloadString(url);

                dynamic stuff = JObject.Parse(pagesource);
                string message = stuff["message"].ToString();
                string success = stuff["success"].ToString();

                if(success == "1") {
                    MessageBox.Show(message);
                }
                else {
                    MessageBox.Show(message);
                }
            }
        }

        private void btnZatvori_Click(object sender, EventArgs e) {
            this.Close();
        }
    }
}
