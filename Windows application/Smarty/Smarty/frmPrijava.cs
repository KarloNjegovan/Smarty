using Newtonsoft.Json.Linq;
using System;
using System.Collections.Specialized;
using System.Net;
using System.Text;
using System.Windows.Forms;

namespace Smarty {
    public partial class frmPrijava: Form {
        public frmPrijava() {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e) {
            string username = txtUsername.Text.ToString();
            string password = txtPassword.Text.ToString();

            string url = "https://mjerenje.info/services/login.php?user=" + username + "&pass=" + password;

            using (WebClient client = new WebClient()) {
                string pagesource = client.DownloadString(url);

                dynamic stuff = JObject.Parse(pagesource);
                string message = stuff["message"].ToString();
                string success = stuff["success"].ToString();

                if (success == "1") {
                    frmGlavna glavnaForma = new frmGlavna();
                    this.Hide();
                    glavnaForma.ShowDialog();
                    this.Close();
                }
                else {
                    MessageBox.Show("Greška kod prijave.");
                }
            }
        }

        private void btnRegistracija_Click(object sender, EventArgs e) {
            frmRegistracija reg = new frmRegistracija();
            this.Hide();
            reg.ShowDialog();
            this.Show();
        }
    }
}
