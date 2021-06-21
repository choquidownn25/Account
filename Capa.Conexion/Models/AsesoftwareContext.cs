using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Capa.Conexion.Models
{
    public partial class AsesoftwareContext : DbContext
    {
        public AsesoftwareContext()
        {
        }

        public AsesoftwareContext(DbContextOptions<AsesoftwareContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Alumno> Alumno { get; set; }
        public virtual DbSet<Comercios> Comercios { get; set; }
        public virtual DbSet<Costumer> Costumer { get; set; }
        public virtual DbSet<Grado> Grado { get; set; }
        public virtual DbSet<Grafico> Grafico { get; set; }
        public virtual DbSet<IdentificaticionType> IdentificaticionType { get; set; }
        public virtual DbSet<Nota> Nota { get; set; }
        public virtual DbSet<Services> Services { get; set; }
        public virtual DbSet<Servicios> Servicios { get; set; }
        public virtual DbSet<Turno> Turno { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=DESKTOP-T9EDAR6\\SQLEXPRESS;Database=Asesoftware;user id=sa;password=2648;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<Alumno>(entity =>
            {
                entity.Property(e => e.Apellido)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Direccion).HasColumnType("text");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasColumnType("text");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.IdGradoNavigation)
                    .WithMany(p => p.Alumno)
                    .HasForeignKey(d => d.IdGrado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Alumno_Grado");

                entity.HasOne(d => d.IdNotaNavigation)
                    .WithMany(p => p.Alumno)
                    .HasForeignKey(d => d.IdNota)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Alumno_Nota");
            });

            modelBuilder.Entity<Comercios>(entity =>
            {
                entity.HasKey(e => e.IdComercio);

                entity.Property(e => e.IdComercio).HasColumnName("id_comercio");

                entity.Property(e => e.AfprpMaximo)
                    .HasColumnName("afprp_maximo")
                    .HasMaxLength(50);

                entity.Property(e => e.NomComercio)
                    .IsRequired()
                    .HasColumnName("nom_comercio")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Costumer>(entity =>
            {
                entity.Property(e => e.Direccion)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.PrimerNombre)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.SegundoNombre)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdTypeNavigation)
                    .WithMany(p => p.Costumer)
                    .HasForeignKey(d => d.IdType)
                    .HasConstraintName("FK_Costumer_IdentificaticionType");
            });

            modelBuilder.Entity<Grado>(entity =>
            {
                entity.Property(e => e.Descripcion).HasColumnType("text");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<IdentificaticionType>(entity =>
            {
                entity.Property(e => e.Activo).HasMaxLength(10);

                entity.Property(e => e.Descripcion).HasColumnType("text");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Nota>(entity =>
            {
                entity.Property(e => e.Descripcion).HasColumnType("text");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Services>(entity =>
            {
                entity.HasKey(e => e.IdServicios);

                entity.Property(e => e.IdServicios).HasColumnName("id_servicios");

                entity.Property(e => e.Duracion)
                    .HasColumnName("duracion")
                    .HasMaxLength(50);

                entity.Property(e => e.HoraApertura).HasColumnName("hora_apertura");

                entity.Property(e => e.HoraCierre).HasColumnName("hora_cierre");

                entity.Property(e => e.IdComercio).HasColumnName("id_comercio");

                entity.Property(e => e.NomServicio)
                    .IsRequired()
                    .HasColumnName("nom_servicio")
                    .HasMaxLength(50);

                entity.HasOne(d => d.IdComercioNavigation)
                    .WithMany(p => p.Services)
                    .HasForeignKey(d => d.IdComercio)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Services_Comercios");
            });

            modelBuilder.Entity<Servicios>(entity =>
            {
                entity.HasKey(e => e.IdServicios);

                entity.Property(e => e.IdServicios).HasColumnName("id_servicios");

                entity.Property(e => e.Duracion)
                    .HasColumnName("duracion")
                    .HasMaxLength(50);

                entity.Property(e => e.HoraApertura).HasColumnName("hora_apertura");

                entity.Property(e => e.HoraCierre).HasColumnName("hora_cierre");

                entity.Property(e => e.IdComercio).HasColumnName("id_comercio");

                entity.Property(e => e.NomServicio)
                    .IsRequired()
                    .HasColumnName("nom_servicio")
                    .HasMaxLength(50);

                entity.HasOne(d => d.IdComercioNavigation)
                    .WithMany(p => p.Servicios)
                    .HasForeignKey(d => d.IdComercio)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Servicios_Comercios");
            });

            modelBuilder.Entity<Turno>(entity =>
            {
                entity.HasKey(e => e.IdTurno);

                entity.Property(e => e.IdTurno).HasColumnName("id_turno");

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.FechaTurna).HasColumnName("fecha_turna");

                entity.Property(e => e.HoraFin).HasColumnName("hora_fin");

                entity.Property(e => e.HoraInicio).HasColumnName("hora_inicio");

                entity.Property(e => e.IdServicio).HasColumnName("id_servicio");

                entity.HasOne(d => d.IdServicioNavigation)
                    .WithMany(p => p.Turno)
                    .HasForeignKey(d => d.IdServicio)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Turno_Services");
            });
        }
    }
}
