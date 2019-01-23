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
            login_json json = new login_json();
            string username = txtUsername.Text.ToString();
            string password = txtPassword.Text.ToString();
            string url = "https://mjerenje.info/services/login.php";

            using (WebClient client = new WebClient()) {
                NameValueCollection postData = new NameValueCollection(){
                    { "user", username },
                    { "pass", password }
                };

                richTextBox1.Text += username + "\n" + password + "\n";

                byte[] responseBytes = client.UploadValues(url, "POST", postData);
                string responsefromserver = Encoding.UTF8.GetString(responseBytes);
                richTextBox1.Text += responsefromserver;

                dynamic stuff = JObject.Parse(responsefromserver);
                string message = stuff["message"].ToString();
                string success = stuff["success"].ToString();

                richTextBox1.Text += "\n" + message + "\n" + success;

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
