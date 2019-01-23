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

namespace Smarty {
    public partial class frmRegistracija: Form {
        public frmRegistracija() {
            InitializeComponent();
        }

        private void btnRegistriraj_Click(object sender, EventArgs e) {
            string ime = txtIme.Text.ToString();
            string prezime = txtPrezime.Text.ToString();
            string korIme = txtKorIme.Text.ToString();
            string lozinka = txtLozinka.Text.ToString();
            string url = "https://mjerenje.info/services/registracija.php";

            using (WebClient client = new WebClient()) {
                NameValueCollection postData = new NameValueCollection(){
                    { "ime", ime },
                    { "prezime", prezime },
                    { "kor_ime", korIme },
                    { "lozinka", lozinka }
                };

                byte[] responseBytes = client.UploadValues(url, "POST", postData);
                string responsefromserver = Encoding.UTF8.GetString(responseBytes);

                if (responsefromserver == "1") {
                    frmGlavna glavnaForma = new frmGlavna();
                    this.Hide();
                    glavnaForma.ShowDialog();
                    this.Close();
                }
                else {
                    MessageBox.Show("Greška kod registracije.");
                    textBox1.Text = responsefromserver;
                }
            }
        }
    }
}
