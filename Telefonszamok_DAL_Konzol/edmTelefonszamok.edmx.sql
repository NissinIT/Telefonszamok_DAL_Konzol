
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/05/2020 11:24:42
-- Generated from EDMX file: C:\Cece\Suli_regi\WPF\Telefonszamok_DAL_Konzol\Telefonszamok_DAL_Konzol\edmTelefonszamok.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Telefonszamok];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_enSzemelyenTelefonszam]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[enTelefonszamSet] DROP CONSTRAINT [FK_enSzemelyenTelefonszam];
GO
IF OBJECT_ID(N'[dbo].[FK_enHelysegenSzemely]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[enSzemelyek] DROP CONSTRAINT [FK_enHelysegenSzemely];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[enSzemelyek]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enSzemelyek];
GO
IF OBJECT_ID(N'[dbo].[enTelefonszamSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enTelefonszamSet];
GO
IF OBJECT_ID(N'[dbo].[enHelysegSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enHelysegSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'enSzemelyek'
CREATE TABLE [dbo].[enSzemelyek] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Vezeteknev] nvarchar(max)  NOT NULL,
    [Utonev] nvarchar(max)  NOT NULL,
    [Lakcim] nvarchar(max)  NOT NULL,
    [enHelyseg_Id] int  NOT NULL
);
GO

-- Creating table 'enTelefonszamok'
CREATE TABLE [dbo].[enTelefonszamok] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Szam] nvarchar(max)  NOT NULL,
    [enSzemely_Id] int  NOT NULL
);
GO

-- Creating table 'enHelysegek'
CREATE TABLE [dbo].[enHelysegek] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Irsz] smallint  NOT NULL,
    [Nev] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Felhasznalook'
CREATE TABLE [dbo].[Felhasznalook] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FelhasznaloNev] nvarchar(max)  NOT NULL,
    [Jelszo] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'enSzemelyek'
ALTER TABLE [dbo].[enSzemelyek]
ADD CONSTRAINT [PK_enSzemelyek]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'enTelefonszamok'
ALTER TABLE [dbo].[enTelefonszamok]
ADD CONSTRAINT [PK_enTelefonszamok]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'enHelysegek'
ALTER TABLE [dbo].[enHelysegek]
ADD CONSTRAINT [PK_enHelysegek]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Felhasznalook'
ALTER TABLE [dbo].[Felhasznalook]
ADD CONSTRAINT [PK_Felhasznalook]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [enSzemely_Id] in table 'enTelefonszamok'
ALTER TABLE [dbo].[enTelefonszamok]
ADD CONSTRAINT [FK_enSzemelyenTelefonszam]
    FOREIGN KEY ([enSzemely_Id])
    REFERENCES [dbo].[enSzemelyek]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enSzemelyenTelefonszam'
CREATE INDEX [IX_FK_enSzemelyenTelefonszam]
ON [dbo].[enTelefonszamok]
    ([enSzemely_Id]);
GO

-- Creating foreign key on [enHelyseg_Id] in table 'enSzemelyek'
ALTER TABLE [dbo].[enSzemelyek]
ADD CONSTRAINT [FK_enHelysegenSzemely]
    FOREIGN KEY ([enHelyseg_Id])
    REFERENCES [dbo].[enHelysegek]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enHelysegenSzemely'
CREATE INDEX [IX_FK_enHelysegenSzemely]
ON [dbo].[enSzemelyek]
    ([enHelyseg_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------