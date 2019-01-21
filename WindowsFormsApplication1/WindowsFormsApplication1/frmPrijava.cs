using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1 {
    public partial class frmPrijava: Form {
        public frmPrijava() {
            InitializeComponent();
        }

        private void btnPrijavi_Click(object sender, EventArgs e) {
            string username = txtKorIme.Text.ToString();
            string password = txtLozinka.Text.ToString();
            //string connectionString = "Data Source=31.147.204.119\PISERVER,1433;User ID=mjerenje;Password=lsXvv1GzW)9X";
            string connectionString = "Server=91.234.46.86;Database=mjernje_testAplikacija;User Id=mjerenje; Password = lsXvv1GzW; ";
            using (SqlConnection con = new SqlConnection(connectionString)) {
                SqlCommand cmd = new SqlCommand("Select * from korisnik where kor_ime = @username and lozinka = @password");
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                try {
                    cmd.Connection = con;
                    con.Open();
                }
                catch(System.Data.SqlClient.SqlException sqlException) {
                    System.Windows.Forms.MessageBox.Show(sqlException.Message);
                }

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();

                bool loginSuccessful = ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0));

                if (loginSuccessful) {
                    test testna = new test();
                    this.Hide();
                    testna.ShowDialog();
                    this.Close();
                }
            }
        }
    }
}
