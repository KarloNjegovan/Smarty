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
            string url = "https://mjerenje.info/services/login.php";

            using (WebClient client = new WebClient()) {
                NameValueCollection postData = new NameValueCollection(){
                    { "user", username },
                    { "pass", password }
                };

                byte[] responseBytes = client.UploadValues(url, "POST", postData);
                string responsefromserver = Encoding.UTF8.GetString(responseBytes);

                if(responsefromserver == "Uspjesno logiranje") {
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
    }
}
