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
    public class Dulieuhoandonban : Dulieucoso
    {
        public Dulieuhoandonban() : base("./Data/DataHoadonban.json")
        {

        }
        public override List<Loaihang> Doc()
        {
            StreamReader file = new StreamReader(filename);
            string jsonString = file.ReadToEnd();
            file.Close();
            List<Hoadonban> dsMathang = JsonConvert.DeserializeObject<List<Hoadonban>>(jsonString);
            return dsMathang.Cast<Loaihang>().ToList();
        }

        public override void Luu(List<Loaihang> dsLoaihang)
        {
            string jsonString = JsonConvert.SerializeObject(dsLoaihang.Cast<Hoadonban>().ToList());
            StreamWriter file = new StreamWriter(filename);
            file.Write(jsonString);
            file.Close();
        }
    }
}
