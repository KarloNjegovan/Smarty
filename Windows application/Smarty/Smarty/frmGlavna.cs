using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Smarty {
    public partial class frmGlavna: Form {
        public frmGlavna() {
            InitializeComponent();
        }

        private void btnObavijesti_Click(object sender, EventArgs e) {
            frmRegistracija reg = new frmRegistracija();
            this.Hide();
            reg.ShowDialog();
            this.Show();
        }

        private void btnGrafovi_Click(object sender, EventArgs e) {
            frmGrafovi grafovi = new frmGrafovi();
            this.Hide();
            grafovi.ShowDialog();
            this.Show();
        }

        private void btnKorisnici_Click(object sender, EventArgs e) {
            frmKorisnici kor = new frmKorisnici();
            this.Hide();
            kor.ShowDialog();
            this.Show();
        }
    }
}
