using Entities;
using System;
using Newtonsoft.Json;
using System.IO;
using System.Collections.Generic;
using System.Linq;

namespace DAL
{    
    public class Dulieumathang : Dulieucoso
    {
        public Dulieumathang() : base("./Data/DataMathang.json")
        {

        }
        public override List<Loaihang> Doc()
        {
            StreamReader file = new StreamReader(filename);
            string jsonString = file.ReadToEnd();
            file.Close();
            List<Mathang> dsMathang = JsonConvert.DeserializeObject<List<Mathang>>(jsonString); //
            return dsMathang.Cast<Loaihang>().ToList();
        }

        public override void Luu(List<Loaihang> dsLoaihang)
        {
            string jsonString = JsonConvert.SerializeObject(dsLoaihang.Cast<Mathang>().ToList());
            StreamWriter file = new StreamWriter(filename);
            file.Write(jsonString);
            file.Close();

        }
    }
}
