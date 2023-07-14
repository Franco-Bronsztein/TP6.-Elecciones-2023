namespace TP_ELECCIONES2023;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;
public static class BD
{
    private static string _connectionString = @"Server=localHost;DataBase=Elecciones2023;Trusted_Connection=True;";
    
        public static void AgregarCandidato(Candidato can)
        {
        string SQL = "INSERT INTO Candidato (FK_Partido, Apellido, Nombre, FechaNacimiento, Foto, Postulacion) VALUES (@partido,@apellido,@nombre,@fechaNacimiento,@foto,@postulacion)";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(SQL, new {partido = can.FK_Partido,apellido = can.Apellido, nombre = can.Nombre,fechaNacimiento = can.FechaNacimiento,foto = can.Foto, postulacion = can.Postulacion});
        }
        }
        public static int EliminarCandidato(int idCand)
        {
            int RegistrosEliminados = 0;
            string SQL = "DELETE FROM Candidato WHERE Id_Candidato = @idCandidato";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                RegistrosEliminados = db.Execute(SQL , new {idCandidato = idCand});
            }
            return RegistrosEliminados;
        }
        public static Partido VerInfoPartido(int idPart)
        {
            Partido info = new Partido();
            string SQL = "SELECT * FROM Partido WHERE id_Partido = @idPartido";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                info = db.QueryFirstOrDefault<Partido>(SQL,new {idPartido = idPart});
            }
            return info;
        }
        public static Candidato VerInfoCandidato(int idCand)
        {
            Candidato infoJugador = new Candidato();
            string SQL = "SELECT * FROM Candidato WHERE Id_Candidato = @idCandidato";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                infoJugador = db.QueryFirstOrDefault<Candidato>(SQL,new{idCandidato = idCand});
            }
            return infoJugador;
        }
        public static List<Partido> ListarPartidos()
        {
            List<Partido> listaPartido = new List<Partido>();
            string SQL = "SELECT * FROM Partido";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                listaPartido = db.Query<Partido>(SQL).ToList();
            }
            return listaPartido;
        }
        public static List<Candidato> ListarCandidatos(int idPart)
        {
            List<Candidato> listaCandidato = new List<Candidato>();
            string SQL = "SELECT * FROM Candidato WHERE FK_Partido = @idPartido";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                listaCandidato = db.Query<Candidato>(SQL,new{idPartido = idPart}).ToList();
            }
            return listaCandidato;
        }
    }