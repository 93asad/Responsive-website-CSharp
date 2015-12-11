<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication3.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>About application</h3>
    <p>This applications lets the user to perform CRUD operations on ExceptionLog table in Finviews database</p>
    <ul>
        <li><span style="font-style: italic">Search:</span> Lets the user to fetch the recors from database using optional filters</li>
        <li><span style="font-style: italic">Add:</span> Lets the user to add record to database</li>
        <li><span style="font-style: italic">Delete:</span> Lets the user to delete the existing record(s) in database. Records with checkboxes checked will be deleted only</li>
        <li><span style="font-style: italic">Update:</span> Click on the 'id' will redirect the user to the update page will will deisplay the existing information in the database about the selected record. User can
            then make changes and and update the database.
        </li>
    </ul>
</asp:Content>
