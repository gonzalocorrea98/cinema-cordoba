using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.dominio
{
    public class Funcion
    {
        public int IdFuncion { get; set; }
        public int IdHorarioFuncion { get; set; }
        public int IdPelicula { get; set; }
        public double Precio { get; set; }


        public Funcion()
        {

        }

        public Funcion(int idFuncion, int idHorarioFuncion, int idPelicula, double precio)
        {
            IdFuncion = idFuncion;
            IdHorarioFuncion = idHorarioFuncion;
            IdPelicula = idPelicula;
            Precio = precio;
        }
    }

}
