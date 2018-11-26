using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace CSharpDay2
{
    public partial class Form1 : Form
    {

        DataSet ds = new DataSet();
        SqlConnection cs = new SqlConnection(@"Data Source=GARYNICO-PC\SQLEXPRESS;Initial Catalog=SchoolDB;Trusted_Connection=True");
        SqlDataAdapter da = new SqlDataAdapter();

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            da.SelectCommand = new SqlCommand("SELECT GroupName FROM msGroup  WHERE GroupId IN ( SELECT GroupID FROM trMappingTeacherGroup a JOIN msTeacher b ON a.TeacherID = b.TeacherID WHERE b.TeacherName LIKE '" + txtGuru.Text + "' AND b.TeacherID LIKE '" + txtID.Text + "')",cs);
            ds.Clear();
            da.Fill(ds);
            dgv.DataSource = ds.Tables[0];
        }

        private void button2_Click(object sender, EventArgs e)
        {

            da.SelectCommand = new SqlCommand("SELECT StudentName FROM msStudent WHERE StudentID IN(SELECT StudentID FROM trMappingStudentGroup a JOIN msGroup b ON a.GroupID = b.GroupID WHERE a.GroupID LIKE '" + txtID2.Text +  "' AND b.GroupName LIKE '" + txtCourse.Text + "')",cs);
            ds.Clear();
            da.Fill(ds);
            dgv.DataSource = ds.Tables[0];
        }

        private void button3_Click(object sender, EventArgs e)
        {
            da.SelectCommand = new SqlCommand("SELECT StudentName FROM msStudent WHERE StudentID IN ( SELECT msS.StudentID FROM msStudent msS JOIN trMappingStudentGroup trMSG ON msS.StudentID = trMSG.StudentID JOIN trMappingTeacherGroup trMTG ON trMTG.GroupID = trMSG.GroupID  JOIN msTeacher msT ON msT.TeacherID = trMTG.TeacherID WHERE msT.TeacherName LIKE '" + txtGuru2.Text + "' AND msT.TeacherID LIKE '"+ txtID3.Text +"' )", cs);
            ds.Clear();
            da.Fill(ds);
            dgv.DataSource = ds.Tables[0];
        }

    }
}
