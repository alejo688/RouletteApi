using System.Collections.Generic;

namespace RouletteApi.Model
{
    public class MessageBetListModel
    {
        public MessageModel message { get; set; }
        public List<BetModel> ResultSet { get; set; }
    }
}
