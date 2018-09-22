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
    
    
    public class Conveyor : ABB.Robotics.ScreenMaker.Windows.Forms.ScreenForm
    {
        
        private ABB.Robotics.Tps.Windows.Forms.GroupBox groupBoxSpeed;
        
        private ABB.Robotics.Tps.Windows.Forms.RadioButton radioButtonLow;
        
        private ABB.Robotics.Tps.Windows.Forms.RadioButton radioButtonHigh;
        
        private ABB.Robotics.Tps.Windows.Forms.GroupBox groupBoxDirection;
        
        private ABB.Robotics.Tps.Windows.Forms.Led ledReverse;
        
        private ABB.Robotics.Tps.Windows.Forms.Led ledForward;
        
        private ABB.Robotics.Tps.Windows.Forms.Button btnReverse;
        
        private ABB.Robotics.Tps.Windows.Forms.Button btnForward;
        
        private ABB.Robotics.Tps.Windows.Forms.MenuItem menuItem1;
        
        private ABB.Robotics.Tps.Windows.Forms.PictureBox pictureBox1;
        
        private ABB.Robotics.Tps.Windows.Forms.CommandBar commandBar1;
        
        public Conveyor()
        {
            this.InitializeComponent();
        }
        
        #region Windows Form Designer generated code
        private void InitializeComponent()
        {
            ABB.Robotics.Tps.Resources.TpsResourceManager resources = new ABB.Robotics.Tps.Resources.TpsResourceManager(this.GetType().ToString());
            this.commandBar1 = new ABB.Robotics.Tps.Windows.Forms.CommandBar();
            this.menuItem1 = new ABB.Robotics.Tps.Windows.Forms.MenuItem();
            this.groupBoxSpeed = new ABB.Robotics.Tps.Windows.Forms.GroupBox();
            this.radioButtonLow = new ABB.Robotics.Tps.Windows.Forms.RadioButton();
            this.radioButtonHigh = new ABB.Robotics.Tps.Windows.Forms.RadioButton();
            this.groupBoxDirection = new ABB.Robotics.Tps.Windows.Forms.GroupBox();
            this.ledReverse = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.ledForward = new ABB.Robotics.Tps.Windows.Forms.Led();
            this.btnReverse = new ABB.Robotics.Tps.Windows.Forms.Button();
            this.btnForward = new ABB.Robotics.Tps.Windows.Forms.Button();
            this.pictureBox1 = new ABB.Robotics.Tps.Windows.Forms.PictureBox();
            this.groupBoxSpeed.SuspendLayout();
            this.groupBoxDirection.SuspendLayout();
            this.SuspendLayout();
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
            this.menuItem1.Click += new System.EventHandler(this.Conveyor_Close);
            // 
            // groupBoxSpeed
            // 
            this.groupBoxSpeed.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBoxSpeed.AutoScroll = false;
            this.groupBoxSpeed.AutoScrollMargin = new System.Drawing.Size(0, 0);
            this.groupBoxSpeed.Controls.Add(this.radioButtonLow);
            this.groupBoxSpeed.Controls.Add(this.radioButtonHigh);
            this.groupBoxSpeed.Dock = System.Windows.Forms.DockStyle.None;
            this.groupBoxSpeed.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12;
            this.groupBoxSpeed.HorizontalAlign = ABB.Robotics.Tps.Windows.Forms.HorAlign.Left;
            this.groupBoxSpeed.LineStyle = ABB.Robotics.Tps.Windows.Forms.LineStyle.SingleLine;
            this.groupBoxSpeed.Location = new System.Drawing.Point(382, 50);
            this.groupBoxSpeed.Name = "groupBoxSpeed";
            this.groupBoxSpeed.Size = new System.Drawing.Size(240, 231);
            this.groupBoxSpeed.Tag = null;
            this.groupBoxSpeed.Title = "Speed";
            this.groupBoxSpeed.VerticalAlign = ABB.Robotics.Tps.Windows.Forms.VerAlign.Center;
            // 
            // radioButtonLow
            // 
            this.radioButtonLow.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.radioButtonLow.ForeColor = System.Drawing.SystemColors.ControlText;
            this.radioButtonLow.Location = new System.Drawing.Point(30, 114);
            this.radioButtonLow.Size = new System.Drawing.Size(180, 36);
            this.radioButtonLow.Text = "Low";
            // 
            // radioButtonHigh
            // 
            this.radioButtonHigh.Checked = true;
            this.radioButtonHigh.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.radioButtonHigh.ForeColor = System.Drawing.SystemColors.ControlText;
            this.radioButtonHigh.Location = new System.Drawing.Point(30, 61);
            this.radioButtonHigh.Size = new System.Drawing.Size(180, 36);
            this.radioButtonHigh.Text = "High";
            // 
            // groupBoxDirection
            // 
            this.groupBoxDirection.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBoxDirection.AutoScroll = false;
            this.groupBoxDirection.AutoScrollMargin = new System.Drawing.Size(0, 0);
            this.groupBoxDirection.Controls.Add(this.ledReverse);
            this.groupBoxDirection.Controls.Add(this.ledForward);
            this.groupBoxDirection.Controls.Add(this.btnReverse);
            this.groupBoxDirection.Controls.Add(this.btnForward);
            this.groupBoxDirection.Dock = System.Windows.Forms.DockStyle.None;
            this.groupBoxDirection.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12;
            this.groupBoxDirection.HorizontalAlign = ABB.Robotics.Tps.Windows.Forms.HorAlign.Left;
            this.groupBoxDirection.LineStyle = ABB.Robotics.Tps.Windows.Forms.LineStyle.SingleLine;
            this.groupBoxDirection.Location = new System.Drawing.Point(16, 50);
            this.groupBoxDirection.Name = "groupBoxDirection";
            this.groupBoxDirection.Size = new System.Drawing.Size(334, 231);
            this.groupBoxDirection.Tag = null;
            this.groupBoxDirection.Title = "Direction";
            this.groupBoxDirection.VerticalAlign = ABB.Robotics.Tps.Windows.Forms.VerAlign.Center;
            // 
            // ledReverse
            // 
            this.ledReverse.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.ledReverse.ForeColor = System.Drawing.SystemColors.ControlText;
            this.ledReverse.Location = new System.Drawing.Point(96, 124);
            this.ledReverse.Size = new System.Drawing.Size(66, 36);
            this.ledReverse.Text = "";
            // 
            // ledForward
            // 
            this.ledForward.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.ledForward.ForeColor = System.Drawing.SystemColors.ControlText;
            this.ledForward.Location = new System.Drawing.Point(217, 124);
            this.ledForward.Size = new System.Drawing.Size(36, 36);
            this.ledForward.Text = "";
            // 
            // btnReverse
            // 
            this.btnReverse.BackColor = System.Drawing.SystemColors.Control;
            this.btnReverse.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.btnReverse.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btnReverse.Image = ((System.Drawing.Image)(resources.GetObject("btnReverse.Image")));
            this.btnReverse.Location = new System.Drawing.Point(42, 48);
            this.btnReverse.Size = new System.Drawing.Size(120, 70);
            this.btnReverse.Text = "Reverse";
            this.btnReverse.TextAlign = ABB.Robotics.Tps.Windows.Forms.ContentAlignmentABB.MiddleCenter;
            // 
            // btnForward
            // 
            this.btnForward.BackColor = System.Drawing.SystemColors.Control;
            this.btnForward.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.btnForward.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btnForward.Image = ((System.Drawing.Image)(resources.GetObject("btnForward.Image")));
            this.btnForward.Location = new System.Drawing.Point(179, 48);
            this.btnForward.Size = new System.Drawing.Size(122, 70);
            this.btnForward.Text = "Forward";
            this.btnForward.TextAlign = ABB.Robotics.Tps.Windows.Forms.ContentAlignmentABB.MiddleCenter;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(516, 0);
            this.pictureBox1.Size = new System.Drawing.Size(123, 45);
            // 
            // Conveyor
            // 
            this.BackColor = System.Drawing.SystemColors.Window;
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.groupBoxSpeed);
            this.Controls.Add(this.groupBoxDirection);
            this.Controls.Add(this.commandBar1);
            this.Text = "Conveyor";
            this.Controls.SetChildIndex(this.commandBar1, 0);
            this.Controls.SetChildIndex(this.groupBoxDirection, 0);
            this.Controls.SetChildIndex(this.groupBoxSpeed, 0);
            this.Controls.SetChildIndex(this.pictureBox1, 0);
            this.groupBoxSpeed.ResumeLayout(false);
            this.groupBoxDirection.ResumeLayout(false);
            this.ResumeLayout(false);
        }
        #endregion
        
        private void Conveyor_Close(object sender, System.EventArgs e)
        {
            try
            {
                // Calling CloseScreen
                this.CloseMe();
            }
            catch (System.Exception ex)
            {
                ABB.Robotics.Tps.Windows.Forms.GTPUMessageBox.Show(this, null, ex.ToString(), "Unexpected Error in Conveyor_Close", System.Windows.Forms.MessageBoxIcon.Hand, System.Windows.Forms.MessageBoxButtons.OK);
            }
        }
    }
}
