﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Telefonszamok_DAL_Konzol
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class cnTelefonszamok : DbContext
    {
        public cnTelefonszamok()
            : base("name=cnTelefonszamok")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<enSzemely> enSzemelyek { get; set; }
        public virtual DbSet<enTelefonszam> enTelefonszamok { get; set; }
        public virtual DbSet<enHelyseg> enHelysegek { get; set; }
        public virtual DbSet<Felhasznalo> Felhasznalook { get; set; }
    }
}
