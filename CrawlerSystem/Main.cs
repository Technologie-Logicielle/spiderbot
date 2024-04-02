using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using HtmlAgilityPack;

namespace NM_CongNghePhanMem
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        private void bt_Read_Click(object sender, EventArgs e)
        {
            try
            {
                string getContent = GetContent("https://internationalconferencealerts.com/conference/information-technology");

                List<string> containerList = new List<string>();
                HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                doc.LoadHtml(getContent);

                //HtmlNode textNodes = doc.DocumentNode.SelectSingleNode("//div[@id='tab1']");
                //HtmlAgilityPack.HtmlDocument doc1 = new HtmlAgilityPack.HtmlDocument();
                //doc1.LoadHtml(textNodes.OuterHtml);

                //textBox1.Text += textNodes.OuterHtml + "-----------\r\n";

                HtmlNodeCollection textNodes = doc.DocumentNode.SelectNodes("//div[@id='tab1']/div/div");
                //HtmlNodeCollection textNodes = doc.DocumentNode.SelectNodes("//div/div[@data-val]");
                foreach (var containerNode in textNodes)
                {
                    containerList.Add(containerNode.OuterHtml.Trim());
                }

                HtmlAgilityPack.HtmlDocument detailNotes = new HtmlAgilityPack.HtmlDocument();
                string idNote=null, dayNodes = null, monthNodes = null, titleNodes = null, locationNodes = null;
                int getIndex = 0;
                for (int i = 0; i < containerList.Count; i++)
                {
                    detailNotes.LoadHtml(containerList[i]);
                    if(containerList[i].Contains("data-val="))
                    {
                        getIndex = containerList[i].IndexOf("data-val=") + 10;
                        idNote = containerList[i].Substring(getIndex, 7);

                        detailNotes.LoadHtml(containerList[i]);
                        dayNodes = " - day: " + detailNotes.DocumentNode.SelectSingleNode("//div/div/h6").InnerHtml;
                        monthNodes = " - month: " + detailNotes.DocumentNode.SelectSingleNode("//div/div/h5").InnerHtml;
                        titleNodes = " - title: " + detailNotes.DocumentNode.SelectSingleNode("//div/div/h3").InnerHtml;
                        locationNodes = detailNotes.DocumentNode.SelectSingleNode("//div/div/div/div/div").InnerHtml;
                        locationNodes = " - location: " + locationNodes.Substring(40, locationNodes.Length - 40);
                        textBox1.Text += i + " - Id: " + idNote + dayNodes + monthNodes + titleNodes + locationNodes + "-----------\r\n";
                    }

                    //string sdadak = abc.DocumentNode.SelectSingleNode("//div").InnerHtml;

                    //textBox1.Text += sdadak + "-----------\r\n";
                }


                //HtmlNodeCollection abc = textNodes.SelectNodes("//div/a/div");
                //foreach (var item in abc)
                //    textBox1.Text += item.GetAttributeValue("data-val", "") + "-----------\r\n";
                //
                //if (textNodes != null)
                //{
                //    foreach (HtmlNode containerNode in textNodes)
                //    {
                //        containerList.Add(containerNode.OuterHtml.Trim());

                //    }

                //    //HtmlAgilityPack.HtmlDocument abc = new HtmlAgilityPack.HtmlDocument();
                //    //string abcNodes = null, bcdNodes = null, cdeNodes = null, efgNodes = null;
                //    //for (int i = 0; i < containerList.Count; i++)
                //    //{
                //    //    abc.LoadHtml(containerList[i]);

                //    //    abcNodes = "day: " + abc.DocumentNode.SelectSingleNode("//div/div/h6").InnerHtml;
                //    //    bcdNodes = " - month: " + abc.DocumentNode.SelectSingleNode("//div/div/h5").InnerHtml;
                //    //    cdeNodes = " - title: " + abc.DocumentNode.SelectSingleNode("//div/div/h3").InnerHtml;

                //    //    efgNodes = abc.DocumentNode.SelectSingleNode("//div/div/div/div/div").InnerHtml;
                //    //    efgNodes = " - location: " + efgNodes.Substring(40, efgNodes.Length - 40);
                //    //    textBox1.Text += abcNodes + bcdNodes + cdeNodes + efgNodes + "-----------\r\n";

                //    //}

                //    for (int i = 0; i < containerList.Count; i++)
                //    {
                //        textBox1.Text += containerList[i].ToString() + "------------------------------------\r\n";
                //    }
                //}
            }
            catch (Exception ex)
            {
                textBox1.Text= ex.ToString();
            }
        }

        private String GetContent(string url)
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            ServicePointManager.ServerCertificateValidationCallback = delegate {
                return true;
            };

            WebClient webClient = new WebClient();

            string sString = webClient.DownloadString(url);
            return sString;
        }

    }
}
