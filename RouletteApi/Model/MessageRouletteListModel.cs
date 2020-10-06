using System.Collections.Generic;

namespace RouletteApi.Model
{
    public class MessageRouletteListModel
    {
        public MessageModel message { get; set; }
        public List<RouletteModel> ResultSet { get; set; }
    }
}
