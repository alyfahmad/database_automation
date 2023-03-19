# Microsft SQL Server Database Test Automation

Hello. This is a Database Automation Project using Robot Framework, ASP.NET Core & Microsoft SQL Server.
- This project requires a CRUD Application build using ASP.NET Core & Microsoft SQL Server. Please follow this link for details: https://github.com/alyfahmad/ASP.Net-Core-Web-App
- You can run the automated tests using the executor.bat file.

## Covered Test Cases

<details>
  <summary>Add Client</summary>
  <ul>
   <li>Add Client using SQL Command</li>
   <li>Navigate to Clients Page using UI</li>
   <li>Validate Data Added in DB is being displayed</li>
  </ul>
</details>
<details>
  <summary>Edit Client</summary>
  <ul>
   <li>Edit Client using SQL Command</li>
   <li>Navigate to Clients Page using UI</li>
   <li>Validate Data Edited in DB is being displayed</li>
  </ul>
</details>
<details>
  <summary>Delete Client</summary>
  <ul>
   <li>Delete Client using SQL Command</li>
   <li>Navigate to Clients Page using UI</li>
   <li>Validate Data Deleted in DB is being displayed</li>
  </ul>
</details>
<details>
  <summary>Cross Match Database Data with UI</summary>
  <ul>
   <li>Execute SQL Command to identify the available Data</li>
   <li>Store the Data in Excel</li>
   <li>Navigate to Clients Page using UI</li>
   <li>Validate Data Availlable in DB is being displayed</li>
  </ul>
</details>

## Demo Video
[demo](https://user-images.githubusercontent.com/61960249/226195981-59730611-60a6-45c9-ae19-513a6668e39c.mp4)

## Acknowledgements
- Found a great youtube tutorial by SDET- QA Automation Techie: https://www.youtube.com/watch?v=GRwMCKdzJGM&ab_channel=SDET-QAAutomationTechie
- Robot Framework Documentations: 
  - Database Library: https://franz-see.github.io/Robotframework-Database-Library/api/0.5/DatabaseLibrary.html
  - Excel Library: https://rawgit.com/peterservice-rnd/robotframework-excellib/master/docs/ExcelLibrary.html
  
## Pre-Requisites
- Setup the ASP.NET Core & Microsoft SQL Server Web App from https://github.com/alyfahmad/ASP.Net-Core-Web-App
- Follow the Robot Framework Installation Guide available under https://github.com/alyfahmad/robot_framework_automation

## Environment Setup Guide
1. Click on File and go to Settings
2. Under Project Interpreter install the following
    1. robotframework-databaselibrary
    2. pymssql
3. For Excel file manupulation run the following command in Terminal
    1. pip install robotframework-excellib
