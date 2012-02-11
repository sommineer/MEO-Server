
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 02/11/2012 01:35:17
-- Generated from EDMX file: C:\Users\Erik Sommer\git\MEOServer\MEOServer\Models\MEOModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MEO];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [Phone] nvarchar(max)  NULL,
    [IconId] int  NULL,
    [QRId] int  NULL,
    [LastModified] datetime  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [Location_Id] int  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [StreetAddress1] nvarchar(max)  NOT NULL,
    [StreetAddress2] nvarchar(max)  NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [ZipCode] nvarchar(max)  NULL,
    [Phone] nvarchar(max)  NULL,
    [Website] nvarchar(max)  NULL,
    [IconId] int  NULL,
    [Latitude] float  NOT NULL,
    [Longitude] float  NOT NULL,
    [LastModified] datetime  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [LastModifiedBy] datetime  NOT NULL,
    [LastModifiedOn] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Salt] nvarchar(max)  NOT NULL,
    [IsBusiness] nvarchar(max)  NOT NULL,
    [BusinessName] nvarchar(max)  NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [LastModified] datetime  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Ratings'
CREATE TABLE [dbo].[Ratings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Value] float  NOT NULL,
    [LastModified] datetime  NOT NULL,
    [LastModifiedBy] nvarchar(max)  NOT NULL,
    [Event_Id] int  NOT NULL
);
GO

-- Creating table 'EventCategory'
CREATE TABLE [dbo].[EventCategory] (
    [Events_Id] int  NOT NULL,
    [Categories_Id] int  NOT NULL
);
GO

-- Creating table 'RatingUser'
CREATE TABLE [dbo].[RatingUser] (
    [Ratings_Id] int  NOT NULL,
    [Users_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [PK_Ratings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Events_Id], [Categories_Id] in table 'EventCategory'
ALTER TABLE [dbo].[EventCategory]
ADD CONSTRAINT [PK_EventCategory]
    PRIMARY KEY NONCLUSTERED ([Events_Id], [Categories_Id] ASC);
GO

-- Creating primary key on [Ratings_Id], [Users_Id] in table 'RatingUser'
ALTER TABLE [dbo].[RatingUser]
ADD CONSTRAINT [PK_RatingUser]
    PRIMARY KEY NONCLUSTERED ([Ratings_Id], [Users_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Location_Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_EventLocation]
    FOREIGN KEY ([Location_Id])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventLocation'
CREATE INDEX [IX_FK_EventLocation]
ON [dbo].[Events]
    ([Location_Id]);
GO

-- Creating foreign key on [Events_Id] in table 'EventCategory'
ALTER TABLE [dbo].[EventCategory]
ADD CONSTRAINT [FK_EventCategory_Event]
    FOREIGN KEY ([Events_Id])
    REFERENCES [dbo].[Events]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Categories_Id] in table 'EventCategory'
ALTER TABLE [dbo].[EventCategory]
ADD CONSTRAINT [FK_EventCategory_Category]
    FOREIGN KEY ([Categories_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventCategory_Category'
CREATE INDEX [IX_FK_EventCategory_Category]
ON [dbo].[EventCategory]
    ([Categories_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_EventUser]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventUser'
CREATE INDEX [IX_FK_EventUser]
ON [dbo].[Events]
    ([User_Id]);
GO

-- Creating foreign key on [Event_Id] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_RatingEvent]
    FOREIGN KEY ([Event_Id])
    REFERENCES [dbo].[Events]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RatingEvent'
CREATE INDEX [IX_FK_RatingEvent]
ON [dbo].[Ratings]
    ([Event_Id]);
GO

-- Creating foreign key on [Ratings_Id] in table 'RatingUser'
ALTER TABLE [dbo].[RatingUser]
ADD CONSTRAINT [FK_RatingUser_Rating]
    FOREIGN KEY ([Ratings_Id])
    REFERENCES [dbo].[Ratings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Users_Id] in table 'RatingUser'
ALTER TABLE [dbo].[RatingUser]
ADD CONSTRAINT [FK_RatingUser_User]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RatingUser_User'
CREATE INDEX [IX_FK_RatingUser_User]
ON [dbo].[RatingUser]
    ([Users_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------