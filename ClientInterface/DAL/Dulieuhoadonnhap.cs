using Entities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Dulieuhoadonnhap : Dulieucoso
    {
        public Dulieuhoadonnhap() : base("./Data/DataHoadonnhap.json")
        {

        }
        public override List<Loaihang> Doc()
        {
            StreamReader file = new StreamReader(filename);
            string jsonString = file.ReadToEnd();
            file.Close();
            List<Hoadonnhap> dsHoadonnhap = JsonConvert.DeserializeObject<List<Hoadonnhap>>(jsonString); //
            return dsHoadonnhap.Cast<Loaihang>().ToList();
        }
        public override void Luu(List<Loaihang> dsLoaihang)
        {
            string jsonString = JsonConvert.SerializeObject(dsLoaihang.Cast<Hoadonnhap>().ToList());
            StreamWriter file = new StreamWriter(filename);
            file.Write(jsonString);
            file.Close();
        }
    }
}
