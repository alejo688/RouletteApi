using System;

namespace RouletteApi.Model
{
    public class RouletteModel
    {
        public int Id_roulette { get; set; }
        public DateTime Create_date { get; set; }
        public int? Number { get; set; }
        public string Color { get; set; }
        public DateTime? Closed_date { get; set; }
        public string State { get; set; }
    }
}
