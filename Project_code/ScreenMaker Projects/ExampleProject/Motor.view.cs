//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using ABB.Robotics.ScreenMaker.Windows.Forms;
using System;


namespace SCM_ExampleProject
{
    
    
    public class Motor : ABB.Robotics.ScreenMaker.Windows.Forms.ScreenForm
    {
        
        private ABB.Robotics.Tps.Windows.Forms.GroupBox groupBoxMotor;
        
        private ABB.Robotics.Tps.Windows.Forms.RadioButton radioButtonMotorOff;
        
        private ABB.Robotics.Tps.Windows.Forms.RadioButton radioButtonMotorOn;
        
        private ABB.Robotics.Tps.Windows.Forms.NumericUpDown numericUpDown1;
        
        private ABB.Robotics.Tps.Windows.Forms.TpsLabel lblMotorSpeed;
        
        private ABB.Robotics.Tps.Windows.Forms.Button btnClose;
        
        public Motor()
        {
            this.InitializeComponent();
        }
        
        #region Windows Form Designer generated code
        private void InitializeComponent()
        {
            this.btnClose = new ABB.Robotics.Tps.Windows.Forms.Button();
            this.groupBoxMotor = new ABB.Robotics.Tps.Windows.Forms.GroupBox();
            this.radioButtonMotorOff = new ABB.Robotics.Tps.Windows.Forms.RadioButton();
            this.radioButtonMotorOn = new ABB.Robotics.Tps.Windows.Forms.RadioButton();
            this.numericUpDown1 = new ABB.Robotics.Tps.Windows.Forms.NumericUpDown();
            this.lblMotorSpeed = new ABB.Robotics.Tps.Windows.Forms.TpsLabel();
            this.groupBoxMotor.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnClose
            // 
            this.btnClose.BackColor = System.Drawing.Color.White;
            this.btnClose.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.btnClose.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btnClose.Location = new System.Drawing.Point(547, 338);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(92, 52);
            this.btnClose.Text = "Close";
            this.btnClose.TextAlign = ABB.Robotics.Tps.Windows.Forms.ContentAlignmentABB.MiddleCenter;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // groupBoxMotor
            // 
            this.groupBoxMotor.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBoxMotor.AutoScroll = false;
            this.groupBoxMotor.AutoScrollMargin = new System.Drawing.Size(0, 0);
            this.groupBoxMotor.Controls.Add(this.radioButtonMotorOff);
            this.groupBoxMotor.Controls.Add(this.radioButtonMotorOn);
            this.groupBoxMotor.Dock = System.Windows.Forms.DockStyle.None;
            this.groupBoxMotor.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.groupBoxMotor.HorizontalAlign = ABB.Robotics.Tps.Windows.Forms.HorAlign.Left;
            this.groupBoxMotor.LineStyle = ABB.Robotics.Tps.Windows.Forms.LineStyle.SingleLine;
            this.groupBoxMotor.Location = new System.Drawing.Point(46, 62);
            this.groupBoxMotor.Name = "groupBoxMotor";
            this.groupBoxMotor.Size = new System.Drawing.Size(230, 189);
            this.groupBoxMotor.Tag = null;
            this.groupBoxMotor.Title = "Control";
            this.groupBoxMotor.VerticalAlign = ABB.Robotics.Tps.Windows.Forms.VerAlign.Center;
            // 
            // radioButtonMotorOff
            // 
            this.radioButtonMotorOff.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.radioButtonMotorOff.ForeColor = System.Drawing.SystemColors.ControlText;
            this.radioButtonMotorOff.Location = new System.Drawing.Point(31, 100);
            this.radioButtonMotorOff.Name = "radioButtonMotorOff";
            this.radioButtonMotorOff.Size = new System.Drawing.Size(180, 36);
            this.radioButtonMotorOff.Text = "Motor Off";
            // 
            // radioButtonMotorOn
            // 
            this.radioButtonMotorOn.Checked = true;
            this.radioButtonMotorOn.DataBindings.Add(new System.Windows.Forms.Binding("Checked", new ABB.Robotics.ScreenMaker.Windows.Forms.SingleBindingSource(new ABB.Robotics.DataBinding.SignalObject("doMotorControl")), "Value", true, System.Windows.Forms.DataSourceUpdateMode.Never));
            this.radioButtonMotorOn.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.radioButtonMotorOn.ForeColor = System.Drawing.SystemColors.ControlText;
            this.radioButtonMotorOn.Location = new System.Drawing.Point(31, 33);
            this.radioButtonMotorOn.Name = "radioButtonMotorOn";
            this.radioButtonMotorOn.Size = new System.Drawing.Size(180, 36);
            this.radioButtonMotorOn.Text = "Motor On";
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.DataBindings.Add(new System.Windows.Forms.Binding("Value", new ABB.Robotics.ScreenMaker.Windows.Forms.SingleBindingSource(new ABB.Robotics.DataBinding.SignalObject("aoMotorSpeed")), "Value", true, System.Windows.Forms.DataSourceUpdateMode.Never));
            this.numericUpDown1.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.numericUpDown1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.numericUpDown1.Increment = new decimal(new int[] {
                        5,
                        0,
                        0,
                        65536});
            this.numericUpDown1.Location = new System.Drawing.Point(356, 112);
            this.numericUpDown1.Maximum = new decimal(new int[] {
                        10,
                        0,
                        0,
                        0});
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(220, 86);
            this.numericUpDown1.Value = new decimal(new int[] {
                        5,
                        0,
                        0,
                        0});
            // 
            // lblMotorSpeed
            // 
            this.lblMotorSpeed.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.lblMotorSpeed.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblMotorSpeed.Location = new System.Drawing.Point(356, 82);
            this.lblMotorSpeed.Multiline = true;
            this.lblMotorSpeed.Name = "lblMotorSpeed";
            this.lblMotorSpeed.Size = new System.Drawing.Size(138, 24);
            this.lblMotorSpeed.Title = "Motor Speed";
            // 
            // Motor
            // 
            this.BackColor = System.Drawing.SystemColors.Control;
            this.Controls.Add(this.lblMotorSpeed);
            this.Controls.Add(this.numericUpDown1);
            this.Controls.Add(this.groupBoxMotor);
            this.Controls.Add(this.btnClose);
            this.Text = "Finishing Motor Control";
            this.Controls.SetChildIndex(this.btnClose, 0);
            this.Controls.SetChildIndex(this.groupBoxMotor, 0);
            this.Controls.SetChildIndex(this.numericUpDown1, 0);
            this.Controls.SetChildIndex(this.lblMotorSpeed, 0);
            this.groupBoxMotor.ResumeLayout(false);
            this.ResumeLayout(false);
        }
        #endregion
        
        private void btnClose_Click(object sender, System.EventArgs e)
        {
            try
            {
                this.CloseMe();
            }
            catch (System.Exception ex)
            {
                ABB.Robotics.Tps.Windows.Forms.GTPUMessageBox.Show(this, null, ex.ToString(), "Unexpected Error in btnClose_Click", System.Windows.Forms.MessageBoxIcon.Hand, System.Windows.Forms.MessageBoxButtons.OK);
            }
        }
    }
}
