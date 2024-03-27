using Entities;
using System;
using Newtonsoft.Json;
using System.IO;
using System.Collections.Generic;
using System.Linq;

namespace DAL
{   
    public class Dulieuloaihang : Dulieucoso
    {
        private List<Loaihang> dsLoaihang { get; set; }
        public Dulieuloaihang() : base("./Data/DataLoaihang.json")
        {

        }

        public override List<Loaihang> Doc()
        {
            StreamReader file = new StreamReader(filename); //
            string jsonString = file.ReadToEnd();
            file.Close();
            dsLoaihang = JsonConvert.DeserializeObject<List<Loaihang>>(jsonString);
            return dsLoaihang.Cast<Loaihang>().ToList();
        }
        public override void Luu(List<Loaihang> dsLoaihang)
        {
            string jsonString = JsonConvert.SerializeObject(dsLoaihang.Cast<Loaihang>().ToList());
            StreamWriter file = new StreamWriter(filename);
            file.Write(jsonString);
            file.Close();
        }
    }
}
