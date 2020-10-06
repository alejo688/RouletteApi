using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using RouletteApi.Model;

namespace RouletteApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RouletteController : ControllerBase
    {
        private readonly ConnectionStrings connectionStrings;
        private SqlConnection Cnn;
        private SqlCommand Cmd;

        public RouletteController(IOptions<ConnectionStrings> connectionStrings)
        {
            this.connectionStrings = connectionStrings.Value;
        }

        private void ConnectDB()
        {
            Cnn = new SqlConnection(connectionStrings.RouletteDatabase);
            Cmd = new SqlCommand
            {
                Connection = Cnn,
                CommandType = CommandType.StoredProcedure
            };
        }

        [HttpGet("CreateRoulette/{ApiKey}")]
        public JsonResult CreateRoulette(string ApiKey)
        {
            int result = 0;
            string tecnicalError = "";

            if (!ApiKey.Equals(""))
            {
                ConnectDB();

                List<SqlParameter> listParam = new List<SqlParameter>()
                {
                    new SqlParameter("@ApiKey", SqlDbType.NVarChar) { Value = ApiKey }
                };

                Cmd.CommandText = "dbo.CreateRoulette";
                Cmd.Parameters.AddRange(listParam.ToArray());

                SqlParameter ReturnValue = new SqlParameter("@Id", SqlDbType.Int);
                ReturnValue.Direction = ParameterDirection.Output;
                Cmd.Parameters.Add(ReturnValue);

                try
                {

                    Cnn.Open();
                    Cmd.ExecuteNonQuery();

                    result = Convert.ToInt32(Cmd.Parameters["@Id"].Value);

                }
                catch (Exception ex)
                {
                    result = -99;
                    tecnicalError = ex.Message;
                }
                finally
                {
                    Cnn.Close();
                }

            } 
            else
            {
                result = -98;
            }

            return new JsonResult(MessageApi(result, tecnicalError, 1));
        }

        [HttpGet("ActivateRoulette/{ApiKey}/{RouletteId}")]
        public JsonResult ActivateRoulette(string ApiKey, int RouletteId)
        {
            int result = 0;
            string tecnicalError = "";

            if (!ApiKey.Equals(""))
            {
                if (RouletteId != 0)
                {
                    ConnectDB();

                    List<SqlParameter> listParam = new List<SqlParameter>()
                    {
                        new SqlParameter("@ApiKey", SqlDbType.NVarChar) { Value = ApiKey },
                        new SqlParameter("@RouletteId", SqlDbType.Int) { Value = RouletteId }
                    };

                    Cmd.CommandText = "dbo.ActivateRoulette";
                    Cmd.Parameters.AddRange(listParam.ToArray());

                    SqlParameter ReturnValue = new SqlParameter("@Status", SqlDbType.Int);
                    ReturnValue.Direction = ParameterDirection.Output;
                    Cmd.Parameters.Add(ReturnValue);

                    try
                    {

                        Cnn.Open();
                        Cmd.ExecuteNonQuery();

                        result = Convert.ToInt32(Cmd.Parameters["@Status"].Value);

                    }
                    catch (Exception ex)
                    {
                        result = -99;
                        tecnicalError = ex.Message;
                    }
                    finally
                    {
                        Cnn.Close();
                    }

                }
                else
                {
                    result = -97;
                }
            }
            else
            {
                result = -98;
            }

            return new JsonResult(MessageApi(result, tecnicalError, 2));
        }

        [HttpGet("BetRoulette/{ApiKey}/{RouletteId}/{Number}/{Color}/{Bet}")]
        public JsonResult BetRoulette(string ApiKey, int RouletteId, int Number, string Color, decimal Bet)
        {
            int result = 0;
            string tecnicalError = "";

            if (!ApiKey.Equals(""))
            {
                if (RouletteId != 0)
                {
                    ConnectDB();

                    List<SqlParameter> listParam = new List<SqlParameter>()
                    {
                        new SqlParameter("@ApiKey", SqlDbType.NVarChar) { Value = ApiKey },
                        new SqlParameter("@RouletteId", SqlDbType.Int) { Value = RouletteId },
                        new SqlParameter("@Number", SqlDbType.Int) { Value = Number },
                        new SqlParameter("@Color", SqlDbType.NVarChar) { Value = Color },
                        new SqlParameter("@Bet", SqlDbType.Decimal) { Value = Bet }
                    };

                    Cmd.CommandText = "dbo.BetRoulette";
                    Cmd.Parameters.AddRange(listParam.ToArray());

                    SqlParameter ReturnValue = new SqlParameter("@Status", SqlDbType.Int);
                    ReturnValue.Direction = ParameterDirection.Output;
                    Cmd.Parameters.Add(ReturnValue);

                    try
                    {

                        Cnn.Open();
                        Cmd.ExecuteNonQuery();

                        result = Convert.ToInt32(Cmd.Parameters["@Status"].Value);

                    }
                    catch (Exception ex)
                    {
                        result = -99;
                        tecnicalError = ex.Message;
                    }
                    finally
                    {
                        Cnn.Close();
                    }

                }
                else
                {
                    result = -97;
                }
            }
            else
            {
                result = -98;
            }

            return new JsonResult(MessageApi(result, tecnicalError, 3));
        }

        [HttpGet("CloseRoulette/{ApiKey}/{RouletteId}")]
        public JsonResult CloseRoulette(string ApiKey, int RouletteId)
        {
            int result = 0;
            string tecnicalError = "";
            MessageBetListModel betListModel = new MessageBetListModel();

            if (!ApiKey.Equals(""))
            {
                if (RouletteId != 0)
                {
                    ConnectDB();

                    List<BetModel> bets = new List<BetModel>();

                    List<SqlParameter> listParam = new List<SqlParameter>()
                    {
                        new SqlParameter("@ApiKey", SqlDbType.NVarChar) { Value = ApiKey },
                        new SqlParameter("@RouletteId", SqlDbType.Int) { Value = RouletteId }
                    };

                    Cmd.CommandText = "dbo.CloseRoulette";
                    Cmd.Parameters.AddRange(listParam.ToArray());

                    SqlParameter ReturnValue = new SqlParameter("@Status", SqlDbType.Int);
                    ReturnValue.Direction = ParameterDirection.Output;
                    Cmd.Parameters.Add(ReturnValue);

                    try
                    {

                        Cnn.Open();
                        SqlDataReader ResultSet = Cmd.ExecuteReader();                        

                        while (ResultSet.Read())
                        {
                            bets.Add(new BetModel
                            {
                                Username = Convert.ToString(ResultSet["Username"]),
                                Number = Convert.ToInt32(ResultSet["Number"]),
                                Color = Convert.ToString(ResultSet["Color"]),
                                NumberWinner = Convert.ToInt32(ResultSet["NumberWinner"]),
                                ColorWinner = Convert.ToString(ResultSet["ColorWinner"]),
                                Winner = Convert.ToString(ResultSet["Winner"])
                            });
                        }

                        ResultSet.Close();

                        betListModel.ResultSet = bets;

                        result = Convert.ToInt32(Cmd.Parameters["@Status"].Value);

                    }
                    catch (Exception ex)
                    {
                        result = -99;
                        tecnicalError = ex.Message;
                    }
                    finally
                    {
                        Cnn.Close();
                    }

                }
                else
                {
                    result = -97;
                }
            }
            else
            {
                result = -98;
            }

            betListModel.message = MessageApi(result, tecnicalError, 4);

            return new JsonResult(betListModel);
        }

        [HttpGet("ListRoulette/{ApiKey}")]
        public JsonResult ListRoulette(string ApiKey)
        {
            int result = 0;
            string tecnicalError = "";
            MessageRouletteListModel rouletteListModel = new MessageRouletteListModel();

            if (!ApiKey.Equals(""))
            {
                ConnectDB();

                List<RouletteModel> roulettes = new List<RouletteModel>();

                List<SqlParameter> listParam = new List<SqlParameter>()
                {
                    new SqlParameter("@ApiKey", SqlDbType.NVarChar) { Value = ApiKey }
                };

                Cmd.CommandText = "dbo.ListRoulette";
                Cmd.Parameters.AddRange(listParam.ToArray());

                SqlParameter ReturnValue = new SqlParameter("@Status", SqlDbType.Int);
                ReturnValue.Direction = ParameterDirection.Output;
                Cmd.Parameters.Add(ReturnValue);

                try
                {

                    Cnn.Open();

                    SqlDataReader ResultSet = Cmd.ExecuteReader();

                    while (ResultSet.Read())
                    {
                        roulettes.Add(new RouletteModel 
                        {
                            Id_roulette = Convert.ToInt32(ResultSet["Id_roulette"]),
                            Create_date = Convert.ToDateTime(ResultSet["Create_date"]),
                            Number = Convert.ToInt32(ResultSet["Number"] is DBNull ? null : ResultSet["Number"]),
                            Color = Convert.ToString(ResultSet["Color"] is DBNull ? null : ResultSet["Color"]),
                            Closed_date = Convert.ToDateTime(ResultSet["Closed_date"] is DBNull ? null : ResultSet["Closed_date"]),
                            State = Convert.ToString(ResultSet["State"])
                        });
                    }

                    ResultSet.Close();

                    rouletteListModel.ResultSet = roulettes;

                    result = Convert.ToInt32(Cmd.Parameters["@Status"].Value);

                }
                catch (Exception ex)
                {
                    result = -99;
                    tecnicalError = ex.Message;
                }
                finally
                {
                    Cnn.Close();
                }

            }
            else
            {
                result = -98;
            }

            rouletteListModel.message = MessageApi(result, tecnicalError, 5);

            return new JsonResult(rouletteListModel);
        }

        private MessageModel MessageApi(int Status, string TecnicalError, int action)
        {
            MessageModel messageModel = new MessageModel();

            switch (Status)
            {
                case 0:
                    messageModel.Status = Status;
                    messageModel.Message = Properties.Resources.Status0;
                    break;
                case -1:
                    messageModel.Status = Status;
                    messageModel.Message = Properties.Resources.Status1;
                    break;
                case -2:
                    messageModel.Status = Status;
                    messageModel.Message = Properties.Resources.Status2;
                    break;
                case -3:
                    messageModel.Status = Status;
                    messageModel.Message = Properties.Resources.Status3;
                    break;
                case -4:
                    messageModel.Status = Status;
                    messageModel.Message = Properties.Resources.Status4;
                    break;
                case -5:
                    messageModel.Status = Status;
                    messageModel.Message = Properties.Resources.Status5;
                    break;
                case -97:
                    messageModel.Status = Status;
                    messageModel.Message = Properties.Resources.Status97;
                    break;
                case -98:
                    messageModel.Status = Status;
                    messageModel.Message = Properties.Resources.Status98;
                    break;
                case -99:
                    messageModel.Status = Status;
                    messageModel.Message = Properties.Resources.Status99;
                    messageModel.TecnicalError = TecnicalError;
                    break;
                default:
                    messageModel = MessageSuccess(Status, action);
                    break;
            }

            return messageModel;
        }

        private MessageModel MessageSuccess(int Status, int action)
        {
            MessageModel messageModel = new MessageModel();

            switch(action)
            {
                case 1:
                    messageModel.Status = 1;
                    messageModel.Message = Properties.Resources.StatusSuccess1;
                    messageModel.Id = Status;
                    break;
                case 2:
                    messageModel.Status = 1;
                    messageModel.Message = Properties.Resources.StatusSuccess2;
                    break;
                case 3:
                    messageModel.Status = 1;
                    messageModel.Message = Properties.Resources.StatusSuccess3;
                    messageModel.Id = Status;
                    break;
                case 4:
                    messageModel.Status = 1;
                    messageModel.Message = Properties.Resources.StatusSuccess4;
                    break;
                case 5:
                    messageModel.Status = 1;
                    messageModel.Message = Properties.Resources.StatusSuccess5;
                    break;
            }

            return messageModel;
        }
    }
}