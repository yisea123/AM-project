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


namespace ExtendedTemplate
{
    
    
    public class Monitor : ABB.Robotics.ScreenMaker.Windows.Forms.ScreenForm
    {
        
        private ABB.Robotics.Tps.Windows.Forms.GroupBox groupBox1;
        
        private ABB.Robotics.Tps.Windows.Forms.GroupBox groupBox2;
        
        private ABB.Robotics.Tps.Windows.Forms.GroupBox groupBox3;
        
        private ABB.Robotics.Tps.Windows.Forms.CommandBar commandBar1;
        
        private ABB.Robotics.Tps.Windows.Forms.TpsLabel tpsLabel1;
        
        private ABB.Robotics.Tps.Windows.Forms.BarGraph barGraph2;
        
        private ABB.Robotics.Tps.Windows.Forms.BarGraph barGraph1;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led5;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led4;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led3;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led2;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led1;
        
        private ABB.Robotics.Tps.Windows.Forms.MenuItem menuItem1;
        
        private ABB.Robotics.Tps.Windows.Forms.PictureBox pictureBox1;
        
        private ABB.Robotics.Tps.Windows.Forms.ComboBox comboBox1;
        
        public Monitor()
        {
            this.InitializeComponent();
        }
        
        #region Windows Form Designer generated code
        private void InitializeComponent()
        {
            ABB.Robotics.Tps.Resources.TpsResourceManager resources = new ABB.Robotics.Tps.Resources.TpsResourceManager(this.GetType().ToString());
            this.groupBox1 = new ABB.Robotics.Tps.Windows.Forms.GroupBox();
            this.led5 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.led4 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.groupBox2 = new ABB.Robotics.Tps.Windows.Forms.GroupBox();
            this.barGraph2 = new ABB.Robotics.Tps.Windows.Forms.BarGraph();
            this.barGraph1 = new ABB.Robotics.Tps.Windows.Forms.BarGraph();
            this.groupBox3 = new ABB.Robotics.Tps.Windows.Forms.GroupBox();
            this.led3 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.led2 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.led1 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.commandBar1 = new ABB.Robotics.Tps.Windows.Forms.CommandBar();
            this.menuItem1 = new ABB.Robotics.Tps.Windows.Forms.MenuItem();
            this.tpsLabel1 = new ABB.Robotics.Tps.Windows.Forms.TpsLabel();
            this.comboBox1 = new ABB.Robotics.Tps.Windows.Forms.ComboBox();
            this.pictureBox1 = new ABB.Robotics.Tps.Windows.Forms.PictureBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox1.AutoScroll = false;
            this.groupBox1.AutoScrollMargin = new System.Drawing.Size(0, 0);
            this.groupBox1.Controls.Add(this.led5);
            this.groupBox1.Controls.Add(this.led4);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.None;
            this.groupBox1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font10b;
            this.groupBox1.HorizontalAlign = ABB.Robotics.Tps.Windows.Forms.HorAlign.Left;
            this.groupBox1.LineStyle = ABB.Robotics.Tps.Windows.Forms.LineStyle.SingleLine;
            this.groupBox1.Location = new System.Drawing.Point(13, 69);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(242, 166);
            this.groupBox1.Tag = null;
            this.groupBox1.Title = "Signals on/off";
            this.groupBox1.VerticalAlign = ABB.Robotics.Tps.Windows.Forms.VerAlign.Center;
            // 
            // led5
            // 
            this.led5.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.led5.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led5.Location = new System.Drawing.Point(32, 96);
            this.led5.Size = new System.Drawing.Size(131, 36);
            this.led5.Text = "Signal 2";
            // 
            // led4
            // 
            this.led4.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.led4.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led4.Location = new System.Drawing.Point(32, 30);
            this.led4.Size = new System.Drawing.Size(131, 36);
            this.led4.Text = "Signal 1";
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox2.AutoScroll = false;
            this.groupBox2.AutoScrollMargin = new System.Drawing.Size(0, 0);
            this.groupBox2.Controls.Add(this.barGraph2);
            this.groupBox2.Controls.Add(this.barGraph1);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.None;
            this.groupBox2.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font10b;
            this.groupBox2.HorizontalAlign = ABB.Robotics.Tps.Windows.Forms.HorAlign.Left;
            this.groupBox2.LineStyle = ABB.Robotics.Tps.Windows.Forms.LineStyle.SingleLine;
            this.groupBox2.Location = new System.Drawing.Point(261, 69);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(362, 166);
            this.groupBox2.Tag = null;
            this.groupBox2.Title = "Graph";
            this.groupBox2.VerticalAlign = ABB.Robotics.Tps.Windows.Forms.VerAlign.Center;
            // 
            // barGraph2
            // 
            this.barGraph2.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.barGraph2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.barGraph2.Location = new System.Drawing.Point(52, 96);
            this.barGraph2.Orientation = System.Windows.Forms.Orientation.Horizontal;
            this.barGraph2.Size = new System.Drawing.Size(251, 57);
            // 
            // barGraph1
            // 
            this.barGraph1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.barGraph1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.barGraph1.Location = new System.Drawing.Point(52, 20);
            this.barGraph1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            this.barGraph1.Size = new System.Drawing.Size(251, 58);
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox3.AutoScroll = false;
            this.groupBox3.AutoScrollMargin = new System.Drawing.Size(0, 0);
            this.groupBox3.Controls.Add(this.led3);
            this.groupBox3.Controls.Add(this.led2);
            this.groupBox3.Controls.Add(this.led1);
            this.groupBox3.Dock = System.Windows.Forms.DockStyle.None;
            this.groupBox3.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font10b;
            this.groupBox3.HorizontalAlign = ABB.Robotics.Tps.Windows.Forms.HorAlign.Left;
            this.groupBox3.LineStyle = ABB.Robotics.Tps.Windows.Forms.LineStyle.SingleLine;
            this.groupBox3.Location = new System.Drawing.Point(13, 241);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(610, 100);
            this.groupBox3.Tag = null;
            this.groupBox3.Title = "Process Status";
            this.groupBox3.VerticalAlign = ABB.Robotics.Tps.Windows.Forms.VerAlign.Center;
            // 
            // led3
            // 
            this.led3.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.led3.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led3.Location = new System.Drawing.Point(409, 44);
            this.led3.Size = new System.Drawing.Size(149, 36);
            this.led3.Text = "Active";
            // 
            // led2
            // 
            this.led2.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.led2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led2.Location = new System.Drawing.Point(214, 44);
            this.led2.Size = new System.Drawing.Size(131, 36);
            this.led2.Text = "Speeding";
            // 
            // led1
            // 
            this.led1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.led1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led1.Location = new System.Drawing.Point(18, 44);
            this.led1.Size = new System.Drawing.Size(131, 36);
            this.led1.Text = "Error";
            // 
            // commandBar1
            // 
            this.commandBar1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.commandBar1.Location = new System.Drawing.Point(0, 347);
            this.commandBar1.MenuItems.Add(this.menuItem1);
            this.commandBar1.Size = new System.Drawing.Size(639, 43);
            // 
            // menuItem1
            // 
            this.menuItem1.Checked = false;
            this.menuItem1.DockToRight = true;
            this.menuItem1.Enabled = true;
            this.menuItem1.Index = 0;
            this.menuItem1.Pressed = false;
            this.menuItem1.Text = "Close";
            this.menuItem1.Toggle = false;
            this.menuItem1.Width = 128;
            this.menuItem1.Click += new System.EventHandler(this.Monitor_Close);
            // 
            // tpsLabel1
            // 
            this.tpsLabel1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.tpsLabel1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.tpsLabel1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.tpsLabel1.Location = new System.Drawing.Point(13, 32);
            this.tpsLabel1.Size = new System.Drawing.Size(116, 24);
            this.tpsLabel1.Title = "Equipment:";
            // 
            // comboBox1
            // 
            this.comboBox1.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", new ABB.Robotics.ScreenMaker.Windows.Forms.ApplicationVariableBindingSource("newName"), "Value", true, System.Windows.Forms.DataSourceUpdateMode.Never));
            this.comboBox1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.comboBox1.Items.Add(new ABB.Robotics.Tps.Windows.Forms.ComboBoxItem("NewItem1", "Equipment 1"));
            this.comboBox1.Items.Add(new ABB.Robotics.Tps.Windows.Forms.ComboBoxItem("NewItem2", "Equipment 2"));
            this.comboBox1.Location = new System.Drawing.Point(135, 31);
            this.comboBox1.Size = new System.Drawing.Size(201, 30);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(516, 0);
            this.pictureBox1.Size = new System.Drawing.Size(123, 45);
            // 
            // Monitor
            // 
            this.BackColor = System.Drawing.SystemColors.Window;
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.tpsLabel1);
            this.Controls.Add(this.commandBar1);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.groupBox1);
            this.Text = "Monitor";
            this.Controls.SetChildIndex(this.groupBox1, 0);
            this.Controls.SetChildIndex(this.comboBox1, 0);
            this.Controls.SetChildIndex(this.groupBox3, 0);
            this.Controls.SetChildIndex(this.groupBox2, 0);
            this.Controls.SetChildIndex(this.commandBar1, 0);
            this.Controls.SetChildIndex(this.tpsLabel1, 0);
            this.Controls.SetChildIndex(this.pictureBox1, 0);
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);
        }
        #endregion
        
        private void Monitor_Close(object sender, System.EventArgs e)
        {
            try
            {
                // Calling CloseScreen
                this.CloseMe();
            }
            catch (System.Exception ex)
            {
                ABB.Robotics.Tps.Windows.Forms.GTPUMessageBox.Show(this, null, ex.ToString(), "Unexpected Error in Monitor_Close", System.Windows.Forms.MessageBoxIcon.Hand, System.Windows.Forms.MessageBoxButtons.OK);
            }
        }
    }
}