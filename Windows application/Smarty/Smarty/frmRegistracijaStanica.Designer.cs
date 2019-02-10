namespace Smarty {
    partial class frmRegistracijaStanica {
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btnRegistriraj = new System.Windows.Forms.Button();
            this.txtIme = new System.Windows.Forms.TextBox();
            this.txtLokacija = new System.Windows.Forms.TextBox();
            this.txtTemp = new System.Windows.Forms.TextBox();
            this.txtHumid = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(59, 47);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(34, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Ime:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(59, 95);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(64, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Lokacija:";
            // 
            // btnRegistriraj
            // 
            this.btnRegistriraj.Location = new System.Drawing.Point(62, 255);
            this.btnRegistriraj.Name = "btnRegistriraj";
            this.btnRegistriraj.Size = new System.Drawing.Size(130, 30);
            this.btnRegistriraj.TabIndex = 2;
            this.btnRegistriraj.Text = "Registriraj stanicu";
            this.btnRegistriraj.UseVisualStyleBackColor = true;
            this.btnRegistriraj.Click += new System.EventHandler(this.btnRegistriraj_Click);
            // 
            // txtIme
            // 
            this.txtIme.Location = new System.Drawing.Point(178, 47);
            this.txtIme.Name = "txtIme";
            this.txtIme.Size = new System.Drawing.Size(150, 22);
            this.txtIme.TabIndex = 4;
            // 
            // txtLokacija
            // 
            this.txtLokacija.Location = new System.Drawing.Point(178, 95);
            this.txtLokacija.Name = "txtLokacija";
            this.txtLokacija.Size = new System.Drawing.Size(150, 22);
            this.txtLokacija.TabIndex = 5;
            // 
            // txtTemp
            // 
            this.txtTemp.Location = new System.Drawing.Point(178, 140);
            this.txtTemp.Name = "txtTemp";
            this.txtTemp.Size = new System.Drawing.Size(150, 22);
            this.txtTemp.TabIndex = 6;
            // 
            // txtHumid
            // 
            this.txtHumid.Location = new System.Drawing.Point(178, 180);
            this.txtHumid.Name = "txtHumid";
            this.txtHumid.Size = new System.Drawing.Size(150, 22);
            this.txtHumid.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(62, 140);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(94, 17);
            this.label3.TabIndex = 8;
            this.label3.Text = "Temperatura:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(62, 183);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 17);
            this.label4.TabIndex = 9;
            this.label4.Text = "Vlaga:";
            // 
            // frmRegistracijaStanica
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(451, 308);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtHumid);
            this.Controls.Add(this.txtTemp);
            this.Controls.Add(this.txtLokacija);
            this.Controls.Add(this.txtIme);
            this.Controls.Add(this.btnRegistriraj);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "frmRegistracijaStanica";
            this.Text = "frmRegistracijaStanica";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnRegistriraj;
        private System.Windows.Forms.TextBox txtIme;
        private System.Windows.Forms.TextBox txtLokacija;
        private System.Windows.Forms.TextBox txtTemp;
        private System.Windows.Forms.TextBox txtHumid;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
    }
}