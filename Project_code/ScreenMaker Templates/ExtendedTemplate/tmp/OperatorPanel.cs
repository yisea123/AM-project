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
    
    
    public class OperatorPanel : ABB.Robotics.ScreenMaker.Windows.Forms.ScreenForm
    {
        
        private ABB.Robotics.Tps.Windows.Forms.TabControl tabControl1;
        
        private ABB.Robotics.Tps.Windows.Forms.TabPage tabPage3;
        
        private ABB.Robotics.Tps.Windows.Forms.MenuItem menuItem1;
        
        private ABB.Robotics.Tps.Windows.Forms.Button button2;
        
        private ABB.Robotics.Tps.Windows.Forms.Button button1;
        
        private ABB.Robotics.Tps.Windows.Forms.GroupBox groupBox1;
        
        private ABB.Robotics.Tps.Windows.Forms.TpsLabel tpsLabel1;
        
        private ABB.Robotics.Tps.Windows.Forms.GroupBox groupBox2;
        
        private ABB.Robotics.Tps.Windows.Forms.TpsLabel tpsLabel2;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led4;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led3;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led2;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led1;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led5;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led6;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led8;
        
        private ABB.Robotics.Tps.Windows.Forms.Led led7;
        
        private ABB.Robotics.Tps.Windows.Forms.PictureBox pictureBox1;
        
        private ABB.Robotics.Tps.Windows.Forms.CommandBar commandBar1;
        
        public OperatorPanel()
        {
            this.InitializeComponent();
        }
        
        #region Windows Form Designer generated code
        private void InitializeComponent()
        {
            ABB.Robotics.Tps.Resources.TpsResourceManager resources = new ABB.Robotics.Tps.Resources.TpsResourceManager(this.GetType().ToString());
            this.tabControl1 = new ABB.Robotics.Tps.Windows.Forms.TabControl();
            this.tabPage3 = new ABB.Robotics.Tps.Windows.Forms.TabPage();
            this.button2 = new ABB.Robotics.Tps.Windows.Forms.Button();
            this.button1 = new ABB.Robotics.Tps.Windows.Forms.Button();
            this.groupBox1 = new ABB.Robotics.Tps.Windows.Forms.GroupBox();
            this.led4 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.led3 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.led2 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.led1 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.tpsLabel1 = new ABB.Robotics.Tps.Windows.Forms.TpsLabel();
            this.groupBox2 = new ABB.Robotics.Tps.Windows.Forms.GroupBox();
            this.led5 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.tpsLabel2 = new ABB.Robotics.Tps.Windows.Forms.TpsLabel();
            this.led6 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.led8 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.led7 = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.commandBar1 = new ABB.Robotics.Tps.Windows.Forms.CommandBar();
            this.menuItem1 = new ABB.Robotics.Tps.Windows.Forms.MenuItem();
            this.pictureBox1 = new ABB.Robotics.Tps.Windows.Forms.PictureBox();
            this.tabControl1.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.AutoScroll = false;
            this.tabControl1.BackColor = System.Drawing.Color.White;
            this.tabControl1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.tabControl1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.tabControl1.Location = new System.Drawing.Point(12, 51);
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(611, 287);
            this.tabControl1.TabPages.Add(this.tabPage3);
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.button2);
            this.tabPage3.Controls.Add(this.button1);
            this.tabPage3.Controls.Add(this.groupBox1);
            this.tabPage3.Controls.Add(this.groupBox2);
            this.tabPage3.Dock = System.Windows.Forms.DockStyle.None;
            this.tabPage3.ForeColor = System.Drawing.SystemColors.ControlText;
            this.tabPage3.Location = new System.Drawing.Point(0, 40);
            this.tabPage3.Size = new System.Drawing.Size(611, 247);
            this.tabPage3.Text = "Operator Panel";
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.SystemColors.Control;
            this.button2.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.button2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.button2.Location = new System.Drawing.Point(242, 154);
            this.button2.Size = new System.Drawing.Size(98, 31);
            this.button2.Text = "Close";
            this.button2.TextAlign = ABB.Robotics.Tps.Windows.Forms.ContentAlignmentABB.MiddleCenter;
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.Control;
            this.button1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.button1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.button1.Location = new System.Drawing.Point(242, 97);
            this.button1.Size = new System.Drawing.Size(98, 31);
            this.button1.Text = "Open";
            this.button1.TextAlign = ABB.Robotics.Tps.Windows.Forms.ContentAlignmentABB.MiddleCenter;
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox1.AutoScroll = false;
            this.groupBox1.AutoScrollMargin = new System.Drawing.Size(0, 0);
            this.groupBox1.Controls.Add(this.led4);
            this.groupBox1.Controls.Add(this.led3);
            this.groupBox1.Controls.Add(this.led2);
            this.groupBox1.Controls.Add(this.led1);
            this.groupBox1.Controls.Add(this.tpsLabel1);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.None;
            this.groupBox1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font10b;
            this.groupBox1.HorizontalAlign = ABB.Robotics.Tps.Windows.Forms.HorAlign.Left;
            this.groupBox1.LineStyle = ABB.Robotics.Tps.Windows.Forms.LineStyle.SingleLine;
            this.groupBox1.Location = new System.Drawing.Point(16, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(200, 231);
            this.groupBox1.Tag = null;
            this.groupBox1.Title = "";
            this.groupBox1.VerticalAlign = ABB.Robotics.Tps.Windows.Forms.VerAlign.Center;
            // 
            // led4
            // 
            this.led4.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.led4.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led4.Location = new System.Drawing.Point(21, 173);
            this.led4.Size = new System.Drawing.Size(159, 36);
            this.led4.Text = "input_4";
            // 
            // led3
            // 
            this.led3.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.led3.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led3.Location = new System.Drawing.Point(21, 130);
            this.led3.Size = new System.Drawing.Size(159, 36);
            this.led3.Text = "input_3";
            // 
            // led2
            // 
            this.led2.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.led2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led2.Location = new System.Drawing.Point(21, 88);
            this.led2.Size = new System.Drawing.Size(159, 36);
            this.led2.Text = "input_2";
            // 
            // led1
            // 
            this.led1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.led1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led1.Location = new System.Drawing.Point(21, 46);
            this.led1.Size = new System.Drawing.Size(159, 36);
            this.led1.Text = "input_1";
            // 
            // tpsLabel1
            // 
            this.tpsLabel1.BackColor = System.Drawing.Color.LightGray;
            this.tpsLabel1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.tpsLabel1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.tpsLabel1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.tpsLabel1.Location = new System.Drawing.Point(0, 0);
            this.tpsLabel1.Size = new System.Drawing.Size(200, 24);
            this.tpsLabel1.TextAlignment = System.Drawing.ContentAlignment.TopCenter;
            this.tpsLabel1.Title = "Input Signals";
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox2.AutoScroll = false;
            this.groupBox2.AutoScrollMargin = new System.Drawing.Size(0, 0);
            this.groupBox2.Controls.Add(this.led5);
            this.groupBox2.Controls.Add(this.tpsLabel2);
            this.groupBox2.Controls.Add(this.led6);
            this.groupBox2.Controls.Add(this.led8);
            this.groupBox2.Controls.Add(this.led7);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.None;
            this.groupBox2.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font10b;
            this.groupBox2.HorizontalAlign = ABB.Robotics.Tps.Windows.Forms.HorAlign.Left;
            this.groupBox2.LineStyle = ABB.Robotics.Tps.Windows.Forms.LineStyle.SingleLine;
            this.groupBox2.Location = new System.Drawing.Point(380, 0);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(200, 231);
            this.groupBox2.Tag = null;
            this.groupBox2.Title = "";
            this.groupBox2.VerticalAlign = ABB.Robotics.Tps.Windows.Forms.VerAlign.Center;
            // 
            // led5
            // 
            this.led5.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.led5.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led5.Location = new System.Drawing.Point(16, 173);
            this.led5.Size = new System.Drawing.Size(164, 36);
            this.led5.Text = "output_4";
            // 
            // tpsLabel2
            // 
            this.tpsLabel2.BackColor = System.Drawing.Color.LightGray;
            this.tpsLabel2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.tpsLabel2.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font9b;
            this.tpsLabel2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.tpsLabel2.Location = new System.Drawing.Point(0, 0);
            this.tpsLabel2.Size = new System.Drawing.Size(200, 24);
            this.tpsLabel2.TextAlignment = System.Drawing.ContentAlignment.TopCenter;
            this.tpsLabel2.Title = "Output Signals";
            // 
            // led6
            // 
            this.led6.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.led6.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led6.Location = new System.Drawing.Point(16, 130);
            this.led6.Size = new System.Drawing.Size(164, 36);
            this.led6.Text = "output_3";
            // 
            // led8
            // 
            this.led8.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.led8.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led8.Location = new System.Drawing.Point(16, 46);
            this.led8.Size = new System.Drawing.Size(164, 36);
            this.led8.Text = "output_1";
            // 
            // led7
            // 
            this.led7.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.led7.ForeColor = System.Drawing.SystemColors.ControlText;
            this.led7.Location = new System.Drawing.Point(16, 88);
            this.led7.Size = new System.Drawing.Size(164, 36);
            this.led7.Text = "output_2";
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
            this.menuItem1.Click += new System.EventHandler(this.Operator_Close);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(516, 0);
            this.pictureBox1.Size = new System.Drawing.Size(123, 45);
            // 
            // OperatorPanel
            // 
            this.BackColor = System.Drawing.SystemColors.Window;
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.commandBar1);
            this.Controls.Add(this.tabControl1);
            this.Text = "Panel";
            this.Controls.SetChildIndex(this.tabControl1, 0);
            this.Controls.SetChildIndex(this.commandBar1, 0);
            this.Controls.SetChildIndex(this.pictureBox1, 0);
            this.tabControl1.ResumeLayout(false);
            this.tabPage3.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);
        }
        #endregion
        
        private void Operator_Close(object sender, System.EventArgs e)
        {
            try
            {
                // Calling CloseScreen
                this.CloseMe();
            }
            catch (System.Exception ex)
            {
                ABB.Robotics.Tps.Windows.Forms.GTPUMessageBox.Show(this, null, ex.ToString(), "Unexpected Error in Operator_Close", System.Windows.Forms.MessageBoxIcon.Hand, System.Windows.Forms.MessageBoxButtons.OK);
            }
        }
    }
}
