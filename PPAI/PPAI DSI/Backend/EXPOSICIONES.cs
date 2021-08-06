//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PPAI_DSI.Backend
{
    using System;
    using System.Collections.Generic;
    
    public partial class EXPOSICIONES
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EXPOSICIONES()
        {
            this.OBRASPOREXPOSICION = new HashSet<OBRASPOREXPOSICION>();
            this.EXPOSICIONESPORRESERVA = new HashSet<EXPOSICIONESPORRESERVA>();
            this.EXPOSICIONESPORSEDE = new HashSet<EXPOSICIONESPORSEDE>();
        }
    
        public int Id_Exposicion { get; set; }
        public string Nombre { get; set; }
        public Nullable<System.DateTime> FechaInicio { get; set; }
        public Nullable<System.DateTime> FechaInicioReplanificada { get; set; }
        public Nullable<System.DateTime> FechaFin { get; set; }
        public Nullable<System.DateTime> FechaFinReplanificada { get; set; }
        public Nullable<System.TimeSpan> HoraApertura { get; set; }
        public Nullable<System.TimeSpan> HoraCierre { get; set; }
        public Nullable<int> Id_TipoExposicion { get; set; }
        public Nullable<int> Id_DetalleExposicion { get; set; }
        public Nullable<int> Id_PublicoDestino { get; set; }
    
        public virtual DETALLESEXPOSICION DETALLESEXPOSICION { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OBRASPOREXPOSICION> OBRASPOREXPOSICION { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EXPOSICIONESPORRESERVA> EXPOSICIONESPORRESERVA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EXPOSICIONESPORSEDE> EXPOSICIONESPORSEDE { get; set; }
        public virtual PUBLICOSDESTINO PUBLICOSDESTINO { get; set; }
        public virtual TIPOSEXPOSICION TIPOSEXPOSICION { get; set; }
    }
}
