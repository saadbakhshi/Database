
/*
ScriptType: DML
Description: Data insertion script for first empty tables
*/


IF NOT EXISTS(SELECT 1 FROM FactoryDevice)
BEGIN
	INSERT INTO FactoryDevice (DeviceName,DeviceYear,DeviceType)
	SELECT 'Device 1',2021,'Type 1' UNION
	SELECT 'Device 2',2022,'Type 2' UNION
	SELECT 'Device 3',2023,'Type 3' UNION
	SELECT 'Device 4',2020,'Type 4' UNION
	SELECT 'Device 5',2019,'Type 5' UNION
	SELECT 'Device 6',2018,'Type 6' UNION
	SELECT 'Device 7',2017,'Type 7' UNION
	SELECT 'Device 8',2016,'Type 8' 
END

IF NOT EXISTS(SELECT 1 FROM MaintenanceTask)
BEGIN
	INSERT INTO MaintenanceTask(DeviceId,TaskDescription,RegisteredTime,TaskSeverity,TaskStatus)
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 1'),'Testing Task',GETDATE(),0,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 2'),'Testing Task',GETDATE(),1,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 1'),'Testing Task',GETDATE(),2,0 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 1'),'Testing Task',GETDATE(),0,0 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 1'),'Testing Task',GETDATE(),0,0 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 4'),'Testing Task',GETDATE(),1,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 1'),'Testing Task',GETDATE(),2,0 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 6'),'Testing Task',GETDATE(),0,0 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 1'),'Testing Task',GETDATE(),1,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 3'),'Testing Task',GETDATE(),1,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 4'),'Testing Task',GETDATE(),1,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 5'),'Testing Task',GETDATE(),1,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 8'),'Testing Task',GETDATE(),1,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 1'),'Testing Task',GETDATE(),1,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 1'),'Testing Task',GETDATE(),1,1 UNION
	SELECT (SELECT Id FROM FactoryDevice WHERE DeviceName='DEVICE 7'),'Testing Task',GETDATE(),1,1 
END
