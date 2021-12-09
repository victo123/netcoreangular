# AngularCartApp
Angular 8 .Net Core online shopping cart

## Getting Started

This is a .net core application so need to make sure we have all the nuget packages downloaded. 

### Prerequisites

.Net Core Framework
npm packages to be installed.

### Installing

To install required packges go to the angular client side app 'DemoApp' folder and run command 'npm install'

```
npm install
```

Create Database

```
Run all the scripts in the Microsoft SQL server. Scripts can be found in file 'DemoAppSql.sql'
```

Change the Connection String in CartDbContext.cs file

```
.UseSqlServer("Server=localhost\\SQLEXPRESS;Database=DemoApp;Trusted_Connection=True;");
```
Run the project in visual studio normally
