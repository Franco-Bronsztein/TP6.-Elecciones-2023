public class Partido
{
    public int Id_Partido{get; set;}
    public string Nombre{get; set;}
    public string Logo{get;  set;}
    public string SitioWeb{get;  set;}
    public DateTime FechaFundacion{get;  set;}
    public int CantidadDiputados{get;  set;}
    public int CantidadSenadores{get;  set;}

    public Partido()
    {

    }
    public Partido(int IdPart, string Nom, string Log, string sW, DateTime fF, int cD, int cS)
    {
        Id_Partido = IdPart;
        Nombre = Nom;
        Logo = Log;
        SitioWeb = sW;
        FechaFundacion = fF;
        CantidadDiputados = cD;
        CantidadSenadores = cS;
    }
}