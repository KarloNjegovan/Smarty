namespace Smarty {
    partial class frmGlavna {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
            this.btnRegistracijaKor = new System.Windows.Forms.Button();
            this.btnGrafovi = new System.Windows.Forms.Button();
            this.btnRegStanica = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnRegistracijaKor
            // 
            this.btnRegistracijaKor.Location = new System.Drawing.Point(115, 68);
            this.btnRegistracijaKor.Name = "btnRegistracijaKor";
            this.btnRegistracijaKor.Size = new System.Drawing.Size(184, 30);
            this.btnRegistracijaKor.TabIndex = 0;
            this.btnRegistracijaKor.Text = "Registracija korisnika";
            this.btnRegistracijaKor.UseVisualStyleBackColor = true;
            this.btnRegistracijaKor.Click += new System.EventHandler(this.btnObavijesti_Click);
            // 
            // btnGrafovi
            // 
            this.btnGrafovi.Location = new System.Drawing.Point(139, 182);
            this.btnGrafovi.Name = "btnGrafovi";
            this.btnGrafovi.Size = new System.Drawing.Size(130, 30);
            this.btnGrafovi.TabIndex = 1;
            this.btnGrafovi.Text = "Grafovi";
            this.btnGrafovi.UseVisualStyleBackColor = true;
            this.btnGrafovi.Click += new System.EventHandler(this.btnGrafovi_Click);
            // 
            // btnRegStanica
            // 
            this.btnRegStanica.Location = new System.Drawing.Point(115, 122);
            this.btnRegStanica.Name = "btnRegStanica";
            this.btnRegStanica.Size = new System.Drawing.Size(184, 30);
            this.btnRegStanica.TabIndex = 3;
            this.btnRegStanica.Text = "Registracija stanica";
            this.btnRegStanica.UseVisualStyleBackColor = true;
            this.btnRegStanica.Click += new System.EventHandler(this.btnRegStanica_Click);
            // 
            // frmGlavna
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(417, 339);
            this.Controls.Add(this.btnRegStanica);
            this.Controls.Add(this.btnGrafovi);
            this.Controls.Add(this.btnRegistracijaKor);
            this.Name = "frmGlavna";
            this.Text = "frmGlavna";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnRegistracijaKor;
        private System.Windows.Forms.Button btnGrafovi;
        private System.Windows.Forms.Button btnRegStanica;
    }
}