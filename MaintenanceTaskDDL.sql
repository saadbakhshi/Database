

/*
ScriptType: DDL
Description: Create Tables for Factory Device and MaintenanceTask
*/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'FactoryDevice')
BEGIN
CREATE TABLE [dbo].[FactoryDevice](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[DeviceName] [varchar](max) NULL,
	[DeviceYear] [int] NULL,
	[DeviceType] [varchar](50) NULL)
END


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'MaintenanceTask')
BEGIN
CREATE TABLE [dbo].[MaintenanceTask](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[DeviceId] [int] NOT NULL FOREIGN KEY REFERENCES FactoryDevice(ID),
	[TaskDescription] [varchar](max) NULL,
	[RegisteredTime] [datetime] NULL,
	[TaskSeverity] [int] NULL,
	[TaskStatus] [int] NULL) 
END

