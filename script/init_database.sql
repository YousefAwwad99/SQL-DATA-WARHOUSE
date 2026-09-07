/*
===============================================================================
Script Purpose:
    Recreates the dbWareHouse database and creates the Bronze, Silver,
    and Gold schemas.

WARNING:
    This script permanently deletes the existing database and all its data.
    Make sure you have a backup before running it.
===============================================================================
*/

-- ======== Checking if table Exisit ================
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'dbWareHouse')
BEGIN
	DROP DATABASE dbWareHouse;
END
	CREATE DATABASE dbWareHouse;
GO
  --  ============= THEN USE THE NEW DATA BASE ============

USE dbWareHouse;
 -- ========= THEN CREATING THE SCHEMAS
GO
CREATE SCHEMA bronzeLayer;
GO
CREATE SCHEMA silverLayer;
GO
CREATE SCHEMA goldLayer;

