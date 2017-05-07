/* Using Database sqlserver and Connection String Data Source=N109801;Initial Catalog=LocalSTC;Integrated Security=True */
/* Beginning Transaction */
/* 196001: Group migrating =================================================== */

/* CreateTable Group */
CREATE TABLE [dbo].[Group] ([Group_Id] INT NOT NULL IDENTITY(1,1), [Group_Name] NVARCHAR(255) NOT NULL, CONSTRAINT [PK_Group] PRIMARY KEY ([Group_Id]))
GO

INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (196001, '2017-05-06T18:00:42', 'Group')
GO
/* 196001: Group migrated */

/* 196002: Company migrating ================================================= */

/* CreateTable Company */
CREATE TABLE [dbo].[Company] ([Company_Id] INT NOT NULL IDENTITY(1,1), [Company_Name] NVARCHAR(255) NOT NULL, [Company_Group_Id] INT, CONSTRAINT [PK_Company] PRIMARY KEY ([Company_Id]))
GO

/* CreateForeignKey FK_Company_Company_Group_Id_Group_Group_Id Company(Company_Group_Id) Group(Group_Id) */
ALTER TABLE [dbo].[Company] ADD CONSTRAINT [FK_Company_Company_Group_Id_Group_Group_Id] FOREIGN KEY ([Company_Group_Id]) REFERENCES [dbo].[Group] ([Group_Id])
GO

INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (196002, '2017-05-06T18:00:42', 'Company')
GO
/* 196002: Company migrated */

/* 196003: Category migrating ================================================ */

/* CreateTable Category */
CREATE TABLE [dbo].[Category] ([Category_Id] INT NOT NULL IDENTITY(1,1), [Category_Name] NVARCHAR(255) NOT NULL, [Category_Label] NVARCHAR(255), CONSTRAINT [PK_Category] PRIMARY KEY ([Category_Id]))
GO

INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (196003, '2017-05-06T18:00:42', 'Category')
GO
/* 196003: Category migrated */

/* 196004: Product migrating ================================================= */

/* CreateTable Product */
CREATE TABLE [dbo].[Product] ([Product_Id] INT NOT NULL IDENTITY(1,1), [Product_Code] NVARCHAR(255) NOT NULL, [Product_Label] NVARCHAR(255), [Product_Category_Id] INT, CONSTRAINT [PK_Product] PRIMARY KEY ([Product_Id]))
GO

/* CreateForeignKey fk_Product_Category_Id Product(Product_Category_Id) Category(Category_Id) */
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [fk_Product_Category_Id] FOREIGN KEY ([Product_Category_Id]) REFERENCES [dbo].[Category] ([Category_Id])
GO

INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (196004, '2017-05-06T18:00:42', 'Product')
GO
/* 196004: Product migrated */

/* 196005: ProductLine migrating ============================================= */

/* CreateTable ProductLine */
CREATE TABLE [dbo].[ProductLine] ([ProductLine_Id] INT NOT NULL IDENTITY(1,1), [ProductLine_Quantity] NVARCHAR(255) NOT NULL, CONSTRAINT [PK_ProductLine] PRIMARY KEY ([ProductLine_Id]))
GO

INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (196005, '2017-05-06T18:00:42', 'ProductLine')
GO
/* 196005: ProductLine migrated */

/* 196006: Bill migrating ==================================================== */

/* CreateTable Bill */
CREATE TABLE [dbo].[Bill] ([Bill_Id] INT NOT NULL IDENTITY(1,1), [Bill_SalesDate] DATETIME NOT NULL, CONSTRAINT [PK_Bill] PRIMARY KEY ([Bill_Id]))
GO

/* CreateForeignKey fk_Bill_Sales_Id ProductLine(ProductLine_Id) Bill(Bill_Id) */
ALTER TABLE [dbo].[ProductLine] ADD CONSTRAINT [fk_Bill_Sales_Id] FOREIGN KEY ([ProductLine_Id]) REFERENCES [dbo].[Bill] ([Bill_Id])
GO

INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (196006, '2017-05-06T18:00:42', 'Bill')
GO
/* 196006: Bill migrated */

/* Committing Transaction */
/* Task completed. */
