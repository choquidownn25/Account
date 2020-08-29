-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__EFMigrationsHistory'
CREATE TABLE [dbo].[C__EFMigrationsHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'Chatbot'
CREATE TABLE [dbo].[Chatbot] (
    [IdChatBot] bigint IDENTITY(1,1) NOT NULL,
    [Activo] bit  NOT NULL,
    [Pregunta] varchar(max)  NULL,
    [Respuesta] varchar(max)  NULL,
    [OpcionSistema] varchar(100)  NULL
);
GO

-- Creating table 'Cita'
CREATE TABLE [dbo].[Cita] (
    [IdCita] bigint IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Hora] time  NOT NULL,
    [IdPaciente] bigint  NOT NULL,
    [IdMedico] bigint  NOT NULL
);
GO

-- Creating table 'ClaseTarifaria'
CREATE TABLE [dbo].[ClaseTarifaria] (
    [IdClaseTarifaria] int IDENTITY(1,1) NOT NULL,
    [UsuarioCrea] varchar(50)  NOT NULL,
    [FechaCrea] datetime  NOT NULL,
    [Estado] bit  NOT NULL,
    [NombreClase] varchar(50)  NOT NULL,
    [IdPrograma] int  NULL
);
GO

-- Creating table 'Client'
CREATE TABLE [dbo].[Client] (
    [ClientId] uniqueidentifier  NOT NULL,
    [Code] varchar(5)  NOT NULL,
    [IdentificationType] smallint  NOT NULL,
    [IdentificationNumber] varchar(50)  NOT NULL,
    [Name] varchar(150)  NOT NULL,
    [Logo] varchar(max)  NULL,
    [IsOwner] bit  NOT NULL,
    [IsActive] bit  NOT NULL
);
GO

-- Creating table 'Consulta'
CREATE TABLE [dbo].[Consulta] (
    [IdConsulta] bigint IDENTITY(1,1) NOT NULL,
    [IdMedico] bigint  NOT NULL,
    [IdPaciente] bigint  NOT NULL,
    [IdCita] bigint  NULL,
    [FehaCita] datetime  NOT NULL,
    [HoraInicio] time  NOT NULL,
    [HoraFin] time  NULL,
    [Calificacion] varchar(50)  NULL,
    [Comentarios] varchar(max)  NULL
);
GO

-- Creating table 'Convenio'
CREATE TABLE [dbo].[Convenio] (
    [Convenio1] int IDENTITY(1,1) NOT NULL,
    [IdPrograma] int  NOT NULL,
    [Nombre] varchar(50)  NOT NULL,
    [Estado] bit  NOT NULL,
    [Co] varchar(50)  NULL
);
GO

-- Creating table 'Credito'
CREATE TABLE [dbo].[Credito] (
    [IdCredito] bigint IDENTITY(1,1) NOT NULL,
    [Saldo] decimal(18,2)  NOT NULL,
    [AFavor] bit  NOT NULL,
    [IdUsuario] nvarchar(450)  NOT NULL
);
GO

-- Creating table 'Cuidad'
CREATE TABLE [dbo].[Cuidad] (
    [IdCiudad] smallint IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(100)  NOT NULL,
    [CodCiu] varchar(50)  NOT NULL,
    [IdDepartamento] int  NOT NULL
);
GO

-- Creating table 'DatosMedico'
CREATE TABLE [dbo].[DatosMedico] (
    [IdMedico] bigint IDENTITY(1,1) NOT NULL,
    [IdUsuario] nvarchar(450)  NOT NULL,
    [TarjetaProfesional] varchar(50)  NULL,
    [PolizaResponsabilidad] varchar(50)  NULL,
    [IdEspecialidad] int  NOT NULL
);
GO

-- Creating table 'DatosPaciente'
CREATE TABLE [dbo].[DatosPaciente] (
    [IdPaciente] bigint IDENTITY(1,1) NOT NULL,
    [NitPaciente] varchar(50)  NOT NULL,
    [IdUsuario] nvarchar(450)  NOT NULL,
    [FechaNacimiento] datetime  NOT NULL
);
GO

-- Creating table 'Departamento'
CREATE TABLE [dbo].[Departamento] (
    [IdDepartamento] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(100)  NOT NULL,
    [CodDep] varchar(50)  NOT NULL,
    [CodTel] varchar(50)  NOT NULL,
    [IdPais] int  NOT NULL
);
GO

-- Creating table 'Especialidad'
CREATE TABLE [dbo].[Especialidad] (
    [IdEspecialidad] smallint IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(50)  NOT NULL,
    [Estado] bit  NOT NULL,
    [CodEspecialidad] varchar(50)  NOT NULL
);
GO

-- Creating table 'Formulario'
CREATE TABLE [dbo].[Formulario] (
    [IdFormulario] smallint  NOT NULL,
    [Detalle] varchar(100)  NOT NULL,
    [Codigo] varchar(100)  NOT NULL,
    [Activo] bit  NOT NULL
);
GO

-- Creating table 'HistoriaClinica'
CREATE TABLE [dbo].[HistoriaClinica] (
    [IdHistoriaClinica] bigint IDENTITY(1,1) NOT NULL,
    [IdConsulta] bigint  NOT NULL,
    [Nota] varchar(max)  NOT NULL
);
GO

-- Creating table 'Horario'
CREATE TABLE [dbo].[Horario] (
    [IdHorario] bigint IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [IdUsuario] nvarchar(450)  NOT NULL
);
GO

-- Creating table 'HorasHorario'
CREATE TABLE [dbo].[HorasHorario] (
    [IdHorasHorario] bigint IDENTITY(1,1) NOT NULL,
    [horaInicio] time  NOT NULL,
    [horaFin] time  NOT NULL,
    [IdHorario] bigint  NOT NULL
);
GO

-- Creating table 'Idioma'
CREATE TABLE [dbo].[Idioma] (
    [IdIdioma] smallint IDENTITY(1,1) NOT NULL,
    [Descripcion] varchar(50)  NOT NULL,
    [Activo] bit  NOT NULL
);
GO

-- Creating table 'MedioPago'
CREATE TABLE [dbo].[MedioPago] (
    [IdMedioPago] smallint IDENTITY(1,1) NOT NULL,
    [Descripcion] varchar(100)  NOT NULL,
    [Activo] bit  NOT NULL
);
GO

-- Creating table 'Menu'
CREATE TABLE [dbo].[Menu] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] int  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Descripcion] nvarchar(100)  NULL,
    [Activo] bigint  NOT NULL
);
GO

-- Creating table 'MenuGrupo'
CREATE TABLE [dbo].[MenuGrupo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [idRol] int  NOT NULL,
    [idMenu] int  NOT NULL
);
GO

-- Creating table 'Moneda'
CREATE TABLE [dbo].[Moneda] (
    [IdMoneda] int IDENTITY(1,1) NOT NULL,
    [CodigoISO] varchar(10)  NULL,
    [Nombre] varchar(100)  NULL,
    [Activo] bit  NOT NULL,
    [IdPais] int  NULL
);
GO

-- Creating table 'Operation'
CREATE TABLE [dbo].[Operation] (
    [OperationId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(100)  NOT NULL,
    [Description] varchar(200)  NULL,
    [ControllerName] varchar(50)  NOT NULL,
    [ActionName] varchar(50)  NOT NULL,
    [ParentNode] int  NULL,
    [GroupName] nvarchar(50)  NULL
);
GO

-- Creating table 'Pago'
CREATE TABLE [dbo].[Pago] (
    [IdPago] bigint IDENTITY(1,1) NOT NULL,
    [Fecha] varchar(50)  NOT NULL,
    [Valor] decimal(18,2)  NOT NULL,
    [IdMedioPago] smallint  NOT NULL,
    [IdCredito] bigint  NOT NULL
);
GO

-- Creating table 'Pais'
CREATE TABLE [dbo].[Pais] (
    [IdPais] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(100)  NOT NULL,
    [CodPais] varchar(50)  NOT NULL,
    [CodTelefonico] varchar(50)  NULL,
    [Sigla] char(2)  NOT NULL,
    [Activo] bit  NOT NULL,
    [IdMoneda] int  NOT NULL
);
GO

-- Creating table 'PoliticaResponsabilidad'
CREATE TABLE [dbo].[PoliticaResponsabilidad] (
    [IdPoliticaResponsibilidad] int  NOT NULL,
    [cuerpo] varchar(8000)  NULL
);
GO

-- Creating table 'PQRS'
CREATE TABLE [dbo].[PQRS] (
    [IdPQRS] bigint  NOT NULL,
    [Detalle] varchar(max)  NOT NULL,
    [FechaRadicacion] datetime  NOT NULL,
    [Tramitado] bit  NULL,
    [IdUsuario] nvarchar(450)  NOT NULL
);
GO

-- Creating table 'Procedimiento'
CREATE TABLE [dbo].[Procedimiento] (
    [IdProcedimiento] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(50)  NOT NULL,
    [CodProcedimiento] varchar(50)  NOT NULL,
    [Estado] bit  NOT NULL
);
GO

-- Creating table 'Programa'
CREATE TABLE [dbo].[Programa] (
    [IdPrograma] int IDENTITY(1,1) NOT NULL,
    [CodPrograma] varchar(50)  NOT NULL,
    [Nombre] varchar(150)  NOT NULL,
    [FechaCrea] datetime  NOT NULL,
    [UsuarioCrea] varchar(50)  NOT NULL
);
GO

-- Creating table 'RoleClaims'
CREATE TABLE [dbo].[RoleClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL,
    [RoleId] nvarchar(450)  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] nvarchar(450)  NOT NULL,
    [ConcurrencyStamp] nvarchar(max)  NULL,
    [Name] nvarchar(256)  NULL,
    [NormalizedName] nvarchar(256)  NULL,
    [ClientId] uniqueidentifier  NULL
);
GO

-- Creating table 'Soporte'
CREATE TABLE [dbo].[Soporte] (
    [IdSoporte] bigint  NOT NULL,
    [IdConsulta] bigint  NOT NULL,
    [IdTipoSoporte] smallint  NOT NULL,
    [Nombre] varchar(100)  NOT NULL,
    [Tamanio] smallint  NOT NULL,
    [TipoArchivo] varchar(50)  NOT NULL,
    [Ruta] varchar(100)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'TarifaProcedimiento'
CREATE TABLE [dbo].[TarifaProcedimiento] (
    [IdTarifa] smallint  NOT NULL,
    [Valor] bigint  NOT NULL,
    [CodProcedimiento] varchar(50)  NOT NULL
);
GO

-- Creating table 'TarifaProcedimientos'
CREATE TABLE [dbo].[TarifaProcedimientos] (
    [IdClaseTarifa] int  NOT NULL,
    [IdProcedimiento] int  NOT NULL,
    [Tarifa] int  NOT NULL,
    [FechaCrea] datetime  NOT NULL,
    [FechaInicio] datetime  NOT NULL,
    [IdTarifaProcedimientos] int IDENTITY(1,1) NOT NULL,
    [IdClaseTarifaria] int  NULL
);
GO

-- Creating table 'TipoSoporte'
CREATE TABLE [dbo].[TipoSoporte] (
    [IdTipoSoporte] smallint IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(100)  NOT NULL,
    [Activo] bit  NOT NULL
);
GO

-- Creating table 'TipSalud'
CREATE TABLE [dbo].[TipSalud] (
    [IdTipSalud] smallint  NOT NULL,
    [Detalle] nvarchar(max)  NOT NULL,
    [FechaIngreso] datetime  NOT NULL,
    [FechaDeBaja] datetime  NULL
);
GO

-- Creating table 'UserClaims'
CREATE TABLE [dbo].[UserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL,
    [UserId] nvarchar(450)  NOT NULL
);
GO

-- Creating table 'UserLogins'
CREATE TABLE [dbo].[UserLogins] (
    [LoginProvider] nvarchar(450)  NOT NULL,
    [ProviderKey] nvarchar(450)  NOT NULL,
    [ProviderDisplayName] nvarchar(max)  NULL,
    [UserId] nvarchar(450)  NOT NULL
);
GO

-- Creating table 'UserProfile'
CREATE TABLE [dbo].[UserProfile] (
    [UserProfileId] int IDENTITY(1,1) NOT NULL,
    [ApplicationUserId] nvarchar(max)  NULL,
    [ConfirmPassword] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [OldPassword] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NULL,
    [ProfilePicture] nvarchar(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] nvarchar(450)  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [ConcurrencyStamp] nvarchar(max)  NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [LockoutEnabled] bit  NOT NULL,
    [LockoutEnd] datetimeoffset  NULL,
    [NormalizedEmail] nvarchar(256)  NULL,
    [NormalizedUserName] nvarchar(256)  NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [IdCiudad] smallint  NULL,
    [IdPrograma] int  NULL,
    [UserName] nvarchar(256)  NULL
);
GO

-- Creating table 'UserTokens'
CREATE TABLE [dbo].[UserTokens] (
    [UserId] nvarchar(450)  NOT NULL,
    [LoginProvider] nvarchar(450)  NOT NULL,
    [Name] nvarchar(450)  NOT NULL,
    [Value] nvarchar(max)  NULL
);
GO

-- Creating table 'EspecialidadMedica'
CREATE TABLE [dbo].[EspecialidadMedica] (
    [DatosMedico_IdMedico] bigint  NOT NULL,
    [Especialidad_IdEspecialidad] smallint  NOT NULL
);
GO

-- Creating table 'RoleOperations'
CREATE TABLE [dbo].[RoleOperations] (
    [Operation_OperationId] int  NOT NULL,
    [Roles_Id] nvarchar(450)  NOT NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [Roles_Id] nvarchar(450)  NOT NULL,
    [Users_Id] nvarchar(450)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId] in table 'C__EFMigrationsHistory'
ALTER TABLE [dbo].[C__EFMigrationsHistory]
ADD CONSTRAINT [PK_C__EFMigrationsHistory]
    PRIMARY KEY CLUSTERED ([MigrationId] ASC);
GO

-- Creating primary key on [IdChatBot] in table 'Chatbot'
ALTER TABLE [dbo].[Chatbot]
ADD CONSTRAINT [PK_Chatbot]
    PRIMARY KEY CLUSTERED ([IdChatBot] ASC);
GO

-- Creating primary key on [IdCita] in table 'Cita'
ALTER TABLE [dbo].[Cita]
ADD CONSTRAINT [PK_Cita]
    PRIMARY KEY CLUSTERED ([IdCita] ASC);
GO

-- Creating primary key on [IdClaseTarifaria] in table 'ClaseTarifaria'
ALTER TABLE [dbo].[ClaseTarifaria]
ADD CONSTRAINT [PK_ClaseTarifaria]
    PRIMARY KEY CLUSTERED ([IdClaseTarifaria] ASC);
GO

-- Creating primary key on [ClientId] in table 'Client'
ALTER TABLE [dbo].[Client]
ADD CONSTRAINT [PK_Client]
    PRIMARY KEY CLUSTERED ([ClientId] ASC);
GO

-- Creating primary key on [IdConsulta] in table 'Consulta'
ALTER TABLE [dbo].[Consulta]
ADD CONSTRAINT [PK_Consulta]
    PRIMARY KEY CLUSTERED ([IdConsulta] ASC);
GO

-- Creating primary key on [Convenio1] in table 'Convenio'
ALTER TABLE [dbo].[Convenio]
ADD CONSTRAINT [PK_Convenio]
    PRIMARY KEY CLUSTERED ([Convenio1] ASC);
GO

-- Creating primary key on [IdCredito] in table 'Credito'
ALTER TABLE [dbo].[Credito]
ADD CONSTRAINT [PK_Credito]
    PRIMARY KEY CLUSTERED ([IdCredito] ASC);
GO

-- Creating primary key on [IdCiudad] in table 'Cuidad'
ALTER TABLE [dbo].[Cuidad]
ADD CONSTRAINT [PK_Cuidad]
    PRIMARY KEY CLUSTERED ([IdCiudad] ASC);
GO

-- Creating primary key on [IdMedico] in table 'DatosMedico'
ALTER TABLE [dbo].[DatosMedico]
ADD CONSTRAINT [PK_DatosMedico]
    PRIMARY KEY CLUSTERED ([IdMedico] ASC);
GO

-- Creating primary key on [IdPaciente] in table 'DatosPaciente'
ALTER TABLE [dbo].[DatosPaciente]
ADD CONSTRAINT [PK_DatosPaciente]
    PRIMARY KEY CLUSTERED ([IdPaciente] ASC);
GO

-- Creating primary key on [IdDepartamento] in table 'Departamento'
ALTER TABLE [dbo].[Departamento]
ADD CONSTRAINT [PK_Departamento]
    PRIMARY KEY CLUSTERED ([IdDepartamento] ASC);
GO

-- Creating primary key on [IdEspecialidad] in table 'Especialidad'
ALTER TABLE [dbo].[Especialidad]
ADD CONSTRAINT [PK_Especialidad]
    PRIMARY KEY CLUSTERED ([IdEspecialidad] ASC);
GO

-- Creating primary key on [IdFormulario], [Detalle], [Codigo], [Activo] in table 'Formulario'
ALTER TABLE [dbo].[Formulario]
ADD CONSTRAINT [PK_Formulario]
    PRIMARY KEY CLUSTERED ([IdFormulario], [Detalle], [Codigo], [Activo] ASC);
GO

-- Creating primary key on [IdHistoriaClinica] in table 'HistoriaClinica'
ALTER TABLE [dbo].[HistoriaClinica]
ADD CONSTRAINT [PK_HistoriaClinica]
    PRIMARY KEY CLUSTERED ([IdHistoriaClinica] ASC);
GO

-- Creating primary key on [IdHorario] in table 'Horario'
ALTER TABLE [dbo].[Horario]
ADD CONSTRAINT [PK_Horario]
    PRIMARY KEY CLUSTERED ([IdHorario] ASC);
GO

-- Creating primary key on [IdHorasHorario] in table 'HorasHorario'
ALTER TABLE [dbo].[HorasHorario]
ADD CONSTRAINT [PK_HorasHorario]
    PRIMARY KEY CLUSTERED ([IdHorasHorario] ASC);
GO

-- Creating primary key on [IdIdioma] in table 'Idioma'
ALTER TABLE [dbo].[Idioma]
ADD CONSTRAINT [PK_Idioma]
    PRIMARY KEY CLUSTERED ([IdIdioma] ASC);
GO

-- Creating primary key on [IdMedioPago] in table 'MedioPago'
ALTER TABLE [dbo].[MedioPago]
ADD CONSTRAINT [PK_MedioPago]
    PRIMARY KEY CLUSTERED ([IdMedioPago] ASC);
GO

-- Creating primary key on [Id] in table 'Menu'
ALTER TABLE [dbo].[Menu]
ADD CONSTRAINT [PK_Menu]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MenuGrupo'
ALTER TABLE [dbo].[MenuGrupo]
ADD CONSTRAINT [PK_MenuGrupo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [IdMoneda] in table 'Moneda'
ALTER TABLE [dbo].[Moneda]
ADD CONSTRAINT [PK_Moneda]
    PRIMARY KEY CLUSTERED ([IdMoneda] ASC);
GO

-- Creating primary key on [OperationId] in table 'Operation'
ALTER TABLE [dbo].[Operation]
ADD CONSTRAINT [PK_Operation]
    PRIMARY KEY CLUSTERED ([OperationId] ASC);
GO

-- Creating primary key on [IdPago] in table 'Pago'
ALTER TABLE [dbo].[Pago]
ADD CONSTRAINT [PK_Pago]
    PRIMARY KEY CLUSTERED ([IdPago] ASC);
GO

-- Creating primary key on [IdPais] in table 'Pais'
ALTER TABLE [dbo].[Pais]
ADD CONSTRAINT [PK_Pais]
    PRIMARY KEY CLUSTERED ([IdPais] ASC);
GO

-- Creating primary key on [IdPoliticaResponsibilidad] in table 'PoliticaResponsabilidad'
ALTER TABLE [dbo].[PoliticaResponsabilidad]
ADD CONSTRAINT [PK_PoliticaResponsabilidad]
    PRIMARY KEY CLUSTERED ([IdPoliticaResponsibilidad] ASC);
GO

-- Creating primary key on [IdPQRS] in table 'PQRS'
ALTER TABLE [dbo].[PQRS]
ADD CONSTRAINT [PK_PQRS]
    PRIMARY KEY CLUSTERED ([IdPQRS] ASC);
GO

-- Creating primary key on [IdProcedimiento] in table 'Procedimiento'
ALTER TABLE [dbo].[Procedimiento]
ADD CONSTRAINT [PK_Procedimiento]
    PRIMARY KEY CLUSTERED ([IdProcedimiento] ASC);
GO

-- Creating primary key on [IdPrograma] in table 'Programa'
ALTER TABLE [dbo].[Programa]
ADD CONSTRAINT [PK_Programa]
    PRIMARY KEY CLUSTERED ([IdPrograma] ASC);
GO

-- Creating primary key on [Id] in table 'RoleClaims'
ALTER TABLE [dbo].[RoleClaims]
ADD CONSTRAINT [PK_RoleClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [IdSoporte], [IdConsulta], [IdTipoSoporte], [Nombre], [Tamanio], [TipoArchivo] in table 'Soporte'
ALTER TABLE [dbo].[Soporte]
ADD CONSTRAINT [PK_Soporte]
    PRIMARY KEY CLUSTERED ([IdSoporte], [IdConsulta], [IdTipoSoporte], [Nombre], [Tamanio], [TipoArchivo] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [IdTarifa] in table 'TarifaProcedimiento'
ALTER TABLE [dbo].[TarifaProcedimiento]
ADD CONSTRAINT [PK_TarifaProcedimiento]
    PRIMARY KEY CLUSTERED ([IdTarifa] ASC);
GO

-- Creating primary key on [IdTarifaProcedimientos] in table 'TarifaProcedimientos'
ALTER TABLE [dbo].[TarifaProcedimientos]
ADD CONSTRAINT [PK_TarifaProcedimientos]
    PRIMARY KEY CLUSTERED ([IdTarifaProcedimientos] ASC);
GO

-- Creating primary key on [IdTipoSoporte] in table 'TipoSoporte'
ALTER TABLE [dbo].[TipoSoporte]
ADD CONSTRAINT [PK_TipoSoporte]
    PRIMARY KEY CLUSTERED ([IdTipoSoporte] ASC);
GO

-- Creating primary key on [IdTipSalud] in table 'TipSalud'
ALTER TABLE [dbo].[TipSalud]
ADD CONSTRAINT [PK_TipSalud]
    PRIMARY KEY CLUSTERED ([IdTipSalud] ASC);
GO

-- Creating primary key on [Id] in table 'UserClaims'
ALTER TABLE [dbo].[UserClaims]
ADD CONSTRAINT [PK_UserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey] in table 'UserLogins'
ALTER TABLE [dbo].[UserLogins]
ADD CONSTRAINT [PK_UserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey] ASC);
GO

-- Creating primary key on [UserProfileId] in table 'UserProfile'
ALTER TABLE [dbo].[UserProfile]
ADD CONSTRAINT [PK_UserProfile]
    PRIMARY KEY CLUSTERED ([UserProfileId] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserId], [LoginProvider], [Name] in table 'UserTokens'
ALTER TABLE [dbo].[UserTokens]
ADD CONSTRAINT [PK_UserTokens]
    PRIMARY KEY CLUSTERED ([UserId], [LoginProvider], [Name] ASC);
GO

-- Creating primary key on [DatosMedico_IdMedico], [Especialidad_IdEspecialidad] in table 'EspecialidadMedica'
ALTER TABLE [dbo].[EspecialidadMedica]
ADD CONSTRAINT [PK_EspecialidadMedica]
    PRIMARY KEY CLUSTERED ([DatosMedico_IdMedico], [Especialidad_IdEspecialidad] ASC);
GO

-- Creating primary key on [Operation_OperationId], [Roles_Id] in table 'RoleOperations'
ALTER TABLE [dbo].[RoleOperations]
ADD CONSTRAINT [PK_RoleOperations]
    PRIMARY KEY CLUSTERED ([Operation_OperationId], [Roles_Id] ASC);
GO

-- Creating primary key on [Roles_Id], [Users_Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([Roles_Id], [Users_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IdMedico] in table 'Cita'
ALTER TABLE [dbo].[Cita]
ADD CONSTRAINT [FK_Cita_DatosMedico]
    FOREIGN KEY ([IdMedico])
    REFERENCES [dbo].[DatosMedico]
        ([IdMedico])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cita_DatosMedico'
CREATE INDEX [IX_FK_Cita_DatosMedico]
ON [dbo].[Cita]
    ([IdMedico]);
GO

-- Creating foreign key on [IdPaciente] in table 'Cita'
ALTER TABLE [dbo].[Cita]
ADD CONSTRAINT [FK_Cita_DatosPaciente]
    FOREIGN KEY ([IdPaciente])
    REFERENCES [dbo].[DatosPaciente]
        ([IdPaciente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cita_DatosPaciente'
CREATE INDEX [IX_FK_Cita_DatosPaciente]
ON [dbo].[Cita]
    ([IdPaciente]);
GO

-- Creating foreign key on [IdCita] in table 'Consulta'
ALTER TABLE [dbo].[Consulta]
ADD CONSTRAINT [FK_Consulta_Cita]
    FOREIGN KEY ([IdCita])
    REFERENCES [dbo].[Cita]
        ([IdCita])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Consulta_Cita'
CREATE INDEX [IX_FK_Consulta_Cita]
ON [dbo].[Consulta]
    ([IdCita]);
GO

-- Creating foreign key on [IdPrograma] in table 'ClaseTarifaria'
ALTER TABLE [dbo].[ClaseTarifaria]
ADD CONSTRAINT [FK_ClaseTarifaria_Programa]
    FOREIGN KEY ([IdPrograma])
    REFERENCES [dbo].[Programa]
        ([IdPrograma])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClaseTarifaria_Programa'
CREATE INDEX [IX_FK_ClaseTarifaria_Programa]
ON [dbo].[ClaseTarifaria]
    ([IdPrograma]);
GO

-- Creating foreign key on [IdClaseTarifa] in table 'TarifaProcedimientos'
ALTER TABLE [dbo].[TarifaProcedimientos]
ADD CONSTRAINT [FK_TarifaProcedimientos_ClaseTarifaria]
    FOREIGN KEY ([IdClaseTarifa])
    REFERENCES [dbo].[ClaseTarifaria]
        ([IdClaseTarifaria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TarifaProcedimientos_ClaseTarifaria'
CREATE INDEX [IX_FK_TarifaProcedimientos_ClaseTarifaria]
ON [dbo].[TarifaProcedimientos]
    ([IdClaseTarifa]);
GO

-- Creating foreign key on [ClientId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [FK_Roles_Client]
    FOREIGN KEY ([ClientId])
    REFERENCES [dbo].[Client]
        ([ClientId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Roles_Client'
CREATE INDEX [IX_FK_Roles_Client]
ON [dbo].[Roles]
    ([ClientId]);
GO

-- Creating foreign key on [IdMedico] in table 'Consulta'
ALTER TABLE [dbo].[Consulta]
ADD CONSTRAINT [FK_Consulta_DatosMedico]
    FOREIGN KEY ([IdMedico])
    REFERENCES [dbo].[DatosMedico]
        ([IdMedico])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Consulta_DatosMedico'
CREATE INDEX [IX_FK_Consulta_DatosMedico]
ON [dbo].[Consulta]
    ([IdMedico]);
GO

-- Creating foreign key on [IdPaciente] in table 'Consulta'
ALTER TABLE [dbo].[Consulta]
ADD CONSTRAINT [FK_Consulta_DatosPaciente]
    FOREIGN KEY ([IdPaciente])
    REFERENCES [dbo].[DatosPaciente]
        ([IdPaciente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Consulta_DatosPaciente'
CREATE INDEX [IX_FK_Consulta_DatosPaciente]
ON [dbo].[Consulta]
    ([IdPaciente]);
GO

-- Creating foreign key on [IdConsulta] in table 'HistoriaClinica'
ALTER TABLE [dbo].[HistoriaClinica]
ADD CONSTRAINT [FK_HistoriaClinica_Consulta]
    FOREIGN KEY ([IdConsulta])
    REFERENCES [dbo].[Consulta]
        ([IdConsulta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HistoriaClinica_Consulta'
CREATE INDEX [IX_FK_HistoriaClinica_Consulta]
ON [dbo].[HistoriaClinica]
    ([IdConsulta]);
GO

-- Creating foreign key on [IdConsulta] in table 'Soporte'
ALTER TABLE [dbo].[Soporte]
ADD CONSTRAINT [FK_Soporteo_Consulta]
    FOREIGN KEY ([IdConsulta])
    REFERENCES [dbo].[Consulta]
        ([IdConsulta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Soporteo_Consulta'
CREATE INDEX [IX_FK_Soporteo_Consulta]
ON [dbo].[Soporte]
    ([IdConsulta]);
GO

-- Creating foreign key on [IdPrograma] in table 'Convenio'
ALTER TABLE [dbo].[Convenio]
ADD CONSTRAINT [FK_ConvenioPrograma]
    FOREIGN KEY ([IdPrograma])
    REFERENCES [dbo].[Programa]
        ([IdPrograma])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConvenioPrograma'
CREATE INDEX [IX_FK_ConvenioPrograma]
ON [dbo].[Convenio]
    ([IdPrograma]);
GO

-- Creating foreign key on [IdUsuario] in table 'Credito'
ALTER TABLE [dbo].[Credito]
ADD CONSTRAINT [FK_CreditoUsers]
    FOREIGN KEY ([IdUsuario])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CreditoUsers'
CREATE INDEX [IX_FK_CreditoUsers]
ON [dbo].[Credito]
    ([IdUsuario]);
GO

-- Creating foreign key on [IdCredito] in table 'Pago'
ALTER TABLE [dbo].[Pago]
ADD CONSTRAINT [FK_Pago_Credito]
    FOREIGN KEY ([IdCredito])
    REFERENCES [dbo].[Credito]
        ([IdCredito])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Pago_Credito'
CREATE INDEX [IX_FK_Pago_Credito]
ON [dbo].[Pago]
    ([IdCredito]);
GO

-- Creating foreign key on [IdDepartamento] in table 'Cuidad'
ALTER TABLE [dbo].[Cuidad]
ADD CONSTRAINT [FK_Cuidad_Departamento]
    FOREIGN KEY ([IdDepartamento])
    REFERENCES [dbo].[Departamento]
        ([IdDepartamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cuidad_Departamento'
CREATE INDEX [IX_FK_Cuidad_Departamento]
ON [dbo].[Cuidad]
    ([IdDepartamento]);
GO

-- Creating foreign key on [IdCiudad] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_Cuidad]
    FOREIGN KEY ([IdCiudad])
    REFERENCES [dbo].[Cuidad]
        ([IdCiudad])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_Cuidad'
CREATE INDEX [IX_FK_Users_Cuidad]
ON [dbo].[Users]
    ([IdCiudad]);
GO

-- Creating foreign key on [IdUsuario] in table 'DatosMedico'
ALTER TABLE [dbo].[DatosMedico]
ADD CONSTRAINT [FK_DatosMedico_Users]
    FOREIGN KEY ([IdUsuario])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DatosMedico_Users'
CREATE INDEX [IX_FK_DatosMedico_Users]
ON [dbo].[DatosMedico]
    ([IdUsuario]);
GO

-- Creating foreign key on [IdUsuario] in table 'DatosPaciente'
ALTER TABLE [dbo].[DatosPaciente]
ADD CONSTRAINT [FK_DatosPaciente_Users]
    FOREIGN KEY ([IdUsuario])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DatosPaciente_Users'
CREATE INDEX [IX_FK_DatosPaciente_Users]
ON [dbo].[DatosPaciente]
    ([IdUsuario]);
GO

-- Creating foreign key on [IdPais] in table 'Departamento'
ALTER TABLE [dbo].[Departamento]
ADD CONSTRAINT [FK_Departamento_Pais]
    FOREIGN KEY ([IdPais])
    REFERENCES [dbo].[Pais]
        ([IdPais])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Departamento_Pais'
CREATE INDEX [IX_FK_Departamento_Pais]
ON [dbo].[Departamento]
    ([IdPais]);
GO

-- Creating foreign key on [IdHorario] in table 'HorasHorario'
ALTER TABLE [dbo].[HorasHorario]
ADD CONSTRAINT [FK_Horario_HorasHorario]
    FOREIGN KEY ([IdHorario])
    REFERENCES [dbo].[Horario]
        ([IdHorario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Horario_HorasHorario'
CREATE INDEX [IX_FK_Horario_HorasHorario]
ON [dbo].[HorasHorario]
    ([IdHorario]);
GO

-- Creating foreign key on [IdUsuario] in table 'Horario'
ALTER TABLE [dbo].[Horario]
ADD CONSTRAINT [FK_Horario_Users]
    FOREIGN KEY ([IdUsuario])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Horario_Users'
CREATE INDEX [IX_FK_Horario_Users]
ON [dbo].[Horario]
    ([IdUsuario]);
GO

-- Creating foreign key on [IdMedioPago] in table 'Pago'
ALTER TABLE [dbo].[Pago]
ADD CONSTRAINT [FK_Pago_MedioPago]
    FOREIGN KEY ([IdMedioPago])
    REFERENCES [dbo].[MedioPago]
        ([IdMedioPago])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Pago_MedioPago'
CREATE INDEX [IX_FK_Pago_MedioPago]
ON [dbo].[Pago]
    ([IdMedioPago]);
GO

-- Creating foreign key on [idMenu] in table 'MenuGrupo'
ALTER TABLE [dbo].[MenuGrupo]
ADD CONSTRAINT [FK_menugrupo_menu]
    FOREIGN KEY ([idMenu])
    REFERENCES [dbo].[Menu]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_menugrupo_menu'
CREATE INDEX [IX_FK_menugrupo_menu]
ON [dbo].[MenuGrupo]
    ([idMenu]);
GO

-- Creating foreign key on [ParentNode] in table 'Operation'
ALTER TABLE [dbo].[Operation]
ADD CONSTRAINT [FK_Operation_Operation_ParentNode]
    FOREIGN KEY ([ParentNode])
    REFERENCES [dbo].[Operation]
        ([OperationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Operation_Operation_ParentNode'
CREATE INDEX [IX_FK_Operation_Operation_ParentNode]
ON [dbo].[Operation]
    ([ParentNode]);
GO

-- Creating foreign key on [IdUsuario] in table 'PQRS'
ALTER TABLE [dbo].[PQRS]
ADD CONSTRAINT [FK_PQRS_Users]
    FOREIGN KEY ([IdUsuario])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PQRS_Users'
CREATE INDEX [IX_FK_PQRS_Users]
ON [dbo].[PQRS]
    ([IdUsuario]);
GO

-- Creating foreign key on [IdPrograma] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_Programa]
    FOREIGN KEY ([IdPrograma])
    REFERENCES [dbo].[Programa]
        ([IdPrograma])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_Programa'
CREATE INDEX [IX_FK_Users_Programa]
ON [dbo].[Users]
    ([IdPrograma]);
GO

-- Creating foreign key on [RoleId] in table 'RoleClaims'
ALTER TABLE [dbo].[RoleClaims]
ADD CONSTRAINT [FK_RoleClaims_Roles_RoleId]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleClaims_Roles_RoleId'
CREATE INDEX [IX_FK_RoleClaims_Roles_RoleId]
ON [dbo].[RoleClaims]
    ([RoleId]);
GO

-- Creating foreign key on [IdTipoSoporte] in table 'Soporte'
ALTER TABLE [dbo].[Soporte]
ADD CONSTRAINT [FK_Soporteo_TipoSoporte]
    FOREIGN KEY ([IdTipoSoporte])
    REFERENCES [dbo].[TipoSoporte]
        ([IdTipoSoporte])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Soporteo_TipoSoporte'
CREATE INDEX [IX_FK_Soporteo_TipoSoporte]
ON [dbo].[Soporte]
    ([IdTipoSoporte]);
GO

-- Creating foreign key on [UserId] in table 'UserClaims'
ALTER TABLE [dbo].[UserClaims]
ADD CONSTRAINT [FK_UserClaims_Users_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserClaims_Users_UserId'
CREATE INDEX [IX_FK_UserClaims_Users_UserId]
ON [dbo].[UserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'UserLogins'
ALTER TABLE [dbo].[UserLogins]
ADD CONSTRAINT [FK_UserLogins_Users_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLogins_Users_UserId'
CREATE INDEX [IX_FK_UserLogins_Users_UserId]
ON [dbo].[UserLogins]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'UserTokens'
ALTER TABLE [dbo].[UserTokens]
ADD CONSTRAINT [FK_UserTokens_Users_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [DatosMedico_IdMedico] in table 'EspecialidadMedica'
ALTER TABLE [dbo].[EspecialidadMedica]
ADD CONSTRAINT [FK_EspecialidadMedica_DatosMedico]
    FOREIGN KEY ([DatosMedico_IdMedico])
    REFERENCES [dbo].[DatosMedico]
        ([IdMedico])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Especialidad_IdEspecialidad] in table 'EspecialidadMedica'
ALTER TABLE [dbo].[EspecialidadMedica]
ADD CONSTRAINT [FK_EspecialidadMedica_Especialidad]
    FOREIGN KEY ([Especialidad_IdEspecialidad])
    REFERENCES [dbo].[Especialidad]
        ([IdEspecialidad])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EspecialidadMedica_Especialidad'
CREATE INDEX [IX_FK_EspecialidadMedica_Especialidad]
ON [dbo].[EspecialidadMedica]
    ([Especialidad_IdEspecialidad]);
GO

-- Creating foreign key on [Operation_OperationId] in table 'RoleOperations'
ALTER TABLE [dbo].[RoleOperations]
ADD CONSTRAINT [FK_RoleOperations_Operation]
    FOREIGN KEY ([Operation_OperationId])
    REFERENCES [dbo].[Operation]
        ([OperationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Roles_Id] in table 'RoleOperations'
ALTER TABLE [dbo].[RoleOperations]
ADD CONSTRAINT [FK_RoleOperations_Roles]
    FOREIGN KEY ([Roles_Id])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleOperations_Roles'
CREATE INDEX [IX_FK_RoleOperations_Roles]
ON [dbo].[RoleOperations]
    ([Roles_Id]);
GO

-- Creating foreign key on [Roles_Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_UserRoles_Roles]
    FOREIGN KEY ([Roles_Id])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Users_Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_UserRoles_Users]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRoles_Users'
CREATE INDEX [IX_FK_UserRoles_Users]
ON [dbo].[UserRoles]
    ([Users_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- ----------------