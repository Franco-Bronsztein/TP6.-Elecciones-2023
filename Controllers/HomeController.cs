using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_ELECCIONES2023.Models;

namespace TP_ELECCIONES2023.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.listaPartido = BD.ListarPartidos();
        return View("Index");
    }

    public IActionResult VerDetallePartido(int idPart)
    {
        ViewBag.datosPartido = BD.VerInfoPartido(idPart);
        ViewBag.listaCandidatos = BD.ListarCandidatos(idPart);
        return View("DetallePartido");
    }

    public IActionResult VerDetalleCandidato(int idCand)
    {
        ViewBag.candidato = BD.VerInfoCandidato(idCand);
        return View("DetalleCandidato");
    }

    public IActionResult AgregarCandidato(int idPart)
    {
        ViewBag.Partido = BD.VerInfoPartido(idPart);  // VER //
        return View("AgregarCandidato");
    }

    [HttpPost] public IActionResult GuardarCandidato(Candidato can) 
    {
        BD.AgregarCandidato(can);                                      // VER LO DE LOS VIEWBAG //
        ViewBag.datosPartido = BD.VerInfoPartido(can.FK_Partido);
        ViewBag.listaCandidatos = BD.ListarCandidatos(can.FK_Partido);
        return View("DetallePartido");
    }

    public IActionResult EliminarCandidato(int idCand, int idPart)
    {
        BD.EliminarCandidato(idCand);
        ViewBag.datosPartido = BD.VerInfoPartido(idPart);
        ViewBag.listaCandidatos = BD.ListarCandidatos(idPart);
        return View("DetallePartido");
    }

    public IActionResult Elecciones()
    {
        return View("Elecciones");
    }
    
    public IActionResult Creditos()
    {
        return View("Creditos");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
