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
            string username = txtKorIme.Text.ToString();
            string pass = txtLozinka.Text.ToString();
            string email = txtEmail.Text.ToString();

            Guid g;
            g = Guid.NewGuid();
            string uuid = g.ToString();

            string url = "https://mjerenje.info/services/registracija.php?id=" + uuid + "&user=" + username + "&pass=" + pass + "&email=" + email;
            WebClient client = new WebClient();

            using (client) {
                string pagesource = client.DownloadString(url);

                if (pagesource == "1") {
                    frmPrijava prijava = new frmPrijava();
                    this.Hide();
                    prijava.ShowDialog();
                    this.Close();
                }
                else {
                    MessageBox.Show("Greška kod registracije.");
                }
            }
        }

        private void btnZatvori_Click(object sender, EventArgs e) {
            this.Close();
        }
    }
}
