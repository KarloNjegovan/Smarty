﻿namespace Smarty {
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
            this.btnObavijesti = new System.Windows.Forms.Button();
            this.btnGrafovi = new System.Windows.Forms.Button();
            this.btnKorisnici = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnObavijesti
            // 
            this.btnObavijesti.Location = new System.Drawing.Point(139, 69);
            this.btnObavijesti.Name = "btnObavijesti";
            this.btnObavijesti.Size = new System.Drawing.Size(130, 30);
            this.btnObavijesti.TabIndex = 0;
            this.btnObavijesti.Text = "Obavijesti";
            this.btnObavijesti.UseVisualStyleBackColor = true;
            this.btnObavijesti.Click += new System.EventHandler(this.btnObavijesti_Click);
            // 
            // btnGrafovi
            // 
            this.btnGrafovi.Location = new System.Drawing.Point(139, 132);
            this.btnGrafovi.Name = "btnGrafovi";
            this.btnGrafovi.Size = new System.Drawing.Size(130, 30);
            this.btnGrafovi.TabIndex = 1;
            this.btnGrafovi.Text = "Grafovi";
            this.btnGrafovi.UseVisualStyleBackColor = true;
            this.btnGrafovi.Click += new System.EventHandler(this.btnGrafovi_Click);
            // 
            // btnKorisnici
            // 
            this.btnKorisnici.Location = new System.Drawing.Point(139, 198);
            this.btnKorisnici.Name = "btnKorisnici";
            this.btnKorisnici.Size = new System.Drawing.Size(130, 30);
            this.btnKorisnici.TabIndex = 2;
            this.btnKorisnici.Text = "Korisnici";
            this.btnKorisnici.UseVisualStyleBackColor = true;
            this.btnKorisnici.Click += new System.EventHandler(this.btnKorisnici_Click);
            // 
            // frmGlavna
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(417, 339);
            this.Controls.Add(this.btnKorisnici);
            this.Controls.Add(this.btnGrafovi);
            this.Controls.Add(this.btnObavijesti);
            this.Name = "frmGlavna";
            this.Text = "frmGlavna";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnObavijesti;
        private System.Windows.Forms.Button btnGrafovi;
        private System.Windows.Forms.Button btnKorisnici;
    }
}