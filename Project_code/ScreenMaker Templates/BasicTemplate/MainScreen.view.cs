//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using ABB.Robotics.ScreenMaker.Windows.Forms;
using System;


namespace BasicTemplate
{
    
    
    public class MainScreen : ABB.Robotics.ScreenMaker.Windows.Forms.ScreenForm
    {
        
        private ABB.Robotics.Tps.Windows.Forms.TpsLabel tpsLabel2;
        
        private ABB.Robotics.Tps.Windows.Forms.TpsLabel tpsLabel1;
        
        private ABB.Robotics.Tps.Windows.Forms.Button button2;
        
        private ABB.Robotics.Tps.Windows.Forms.PictureBox pictureBox1;
        
        private ABB.Robotics.Tps.Windows.Forms.Button button1;
        
        public MainScreen()
        {
            this.InitializeComponent();
        }
        
        #region Windows Form Designer generated code
        private void InitializeComponent()
        {
            ABB.Robotics.Tps.Resources.TpsResourceManager resources = new ABB.Robotics.Tps.Resources.TpsResourceManager(this.GetType().ToString());
            this.tpsLabel2 = new ABB.Robotics.Tps.Windows.Forms.TpsLabel();
            this.tpsLabel1 = new ABB.Robotics.Tps.Windows.Forms.TpsLabel();
            this.button2 = new ABB.Robotics.Tps.Windows.Forms.Button();
            this.button1 = new ABB.Robotics.Tps.Windows.Forms.Button();
            this.pictureBox1 = new ABB.Robotics.Tps.Windows.Forms.PictureBox();
            this.SuspendLayout();
            // 
            // tpsLabel2
            // 
            this.tpsLabel2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.tpsLabel2.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.tpsLabel2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.tpsLabel2.Location = new System.Drawing.Point(344, 215);
            this.tpsLabel2.Size = new System.Drawing.Size(101, 25);
            this.tpsLabel2.TextAlignment = System.Drawing.ContentAlignment.TopCenter;
            this.tpsLabel2.Title = "Motor Control";
            // 
            // tpsLabel1
            // 
            this.tpsLabel1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.tpsLabel1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.tpsLabel1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.tpsLabel1.Location = new System.Drawing.Point(133, 215);
            this.tpsLabel1.Size = new System.Drawing.Size(126, 25);
            this.tpsLabel1.TextAlignment = System.Drawing.ContentAlignment.TopCenter;
            this.tpsLabel1.Title = "Status";
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.SystemColors.Control;
            this.button2.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.button2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.button2.Image = ((System.Drawing.Image)(resources.GetObject("button2.Image")));
            this.button2.Location = new System.Drawing.Point(344, 151);
            this.button2.Size = new System.Drawing.Size(101, 58);
            this.button2.Text = "";
            this.button2.TextAlign = ABB.Robotics.Tps.Windows.Forms.ContentAlignmentABB.MiddleCenter;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.Control;
            this.button1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.button1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
            this.button1.Location = new System.Drawing.Point(148, 151);
            this.button1.Size = new System.Drawing.Size(100, 58);
            this.button1.Text = "";
            this.button1.TextAlign = ABB.Robotics.Tps.Windows.Forms.ContentAlignmentABB.MiddleCenter;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(516, 0);
            this.pictureBox1.Size = new System.Drawing.Size(123, 45);
            // 
            // MainScreen
            // 
            this.BackColor = System.Drawing.SystemColors.Window;
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.tpsLabel2);
            this.Controls.Add(this.tpsLabel1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Text = "Basic";
            this.Controls.SetChildIndex(this.button1, 0);
            this.Controls.SetChildIndex(this.button2, 0);
            this.Controls.SetChildIndex(this.tpsLabel1, 0);
            this.Controls.SetChildIndex(this.tpsLabel2, 0);
            this.Controls.SetChildIndex(this.pictureBox1, 0);
            this.ResumeLayout(false);
        }
        #endregion
        
        private void button1_Click(object sender, System.EventArgs e)
        {
            try
            {
                // Calling ScreenOpen
                this.ShowScreen(typeof(Status));
            }
            catch (System.Exception ex)
            {
                ABB.Robotics.Tps.Windows.Forms.GTPUMessageBox.Show(this, null, ex.ToString(), "Unexpected Error in button1_Click", System.Windows.Forms.MessageBoxIcon.Hand, System.Windows.Forms.MessageBoxButtons.OK);
            }
        }
        
        private void button2_Click(object sender, System.EventArgs e)
        {
            try
            {
                // Calling ScreenOpen
                this.ShowScreen(typeof(MotorControl));
            }
            catch (System.Exception ex)
            {
                ABB.Robotics.Tps.Windows.Forms.GTPUMessageBox.Show(this, null, ex.ToString(), "Unexpected Error in button2_Click", System.Windows.Forms.MessageBoxIcon.Hand, System.Windows.Forms.MessageBoxButtons.OK);
            }
        }
    }
}
