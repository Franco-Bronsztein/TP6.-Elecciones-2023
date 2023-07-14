public class Candidato
{
    public int Id_Candidato{get;  set;} 
    public int FK_Partido {get; set;}
    public string Apellido {get; set;} 
    public string Nombre {get;  set;} 
    public DateTime FechaNacimiento {get; set;}
    public string Foto {get; set;} 
    public string Postulacion {get;  set;}
    public Candidato()
    {

    } 
    public Candidato(int IdCand, int IdPart, string Apel, string Nom, DateTime fN, string fT, string Postu)
    {
        Id_Candidato = IdCand;
        FK_Partido = IdPart;
        Apellido = Apel;
        Nombre = Nom;
        FechaNacimiento = fN;
        Foto = fT;
        Postulacion = Postu;
    }
}