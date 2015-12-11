<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3._Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">

    <div class="container-fluid" style="margin-top: 50px">
        <div class="panel panel-default">

            <div class="panel-body">


                <div class="row">
                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-2">CIK</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="cik" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-3">Concept</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox ID="concept" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>


                    <div class="form-group col-md-2">
                        <asp:Label runat="server" CssClass="control-label col-md-4">Fiscal year</asp:Label>
                        <div class="col-md-7">
                            <asp:DropDownList runat="server" ID="fiscalYear" Height="24px" Style="padding: 0px" class="dropdown btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <asp:Label runat="server" CssClass="control-label col-md-4">Action</asp:Label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="action" runat="server" Height="24px" Style="padding: 0px" class="dropdown btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group col-md-2">
                        <asp:Label runat="server" CssClass="control-label col-md-4">Period</asp:Label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="period" runat="server" Height="24px" Style="padding: 0px" class="dropdown btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Q1</asp:ListItem>
                                <asp:ListItem>Q2_3M</asp:ListItem>
                                <asp:ListItem>Q2</asp:ListItem>
                                <asp:ListItem>Q3</asp:ListItem>
                                <asp:ListItem>Q3_3M</asp:ListItem>
                                <asp:ListItem>Q4_3M</asp:ListItem>
                                <asp:ListItem>FY</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>



                <div class="row">


                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-2">Root Concept</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="rootConcept" runat="server" Height="21px" Style="padding: 0px" class="dropdown btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Statement Of Income%</asp:ListItem>
                                <asp:ListItem>Balance Sheet</asp:ListItem>
                                <asp:ListItem>Statement Of Cash Flows</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-3">Negative</asp:Label>
                        <div class="col-md-9">
                            <asp:DropDownList ID="negative" runat="server" Height="24px" Style="padding: 0px" class="dropdown btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group col-md-2">
                        <asp:Label runat="server" CssClass="control-label col-md-4">Update Order</asp:Label>
                        <div class="col-md-7">
                            <asp:DropDownList ID="updateOrder" runat="server" Height="24px" Style="padding: 0px" class="dropdown btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group col-md-2">
                        <asp:Label runat="server" CssClass="control-label col-md-4">Update Type</asp:Label>
                        <div class="col-md-7">
                            <asp:DropDownList ID="updateType" runat="server" Height="24px" Style="padding: 0px" class="dropdown btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <div class="col-md-12">
                            <asp:Button ID="searchBtn" runat="server" OnClick="Search_Click" Text="Search" type="button" class="btn btn-primary btn-md" Width="140px" />
                        </div>
                    </div>

                </div>



            </div>








            <div class="panel-footer">
                <asp:Button ID="add" runat="server" Text="Add" OnClick="Add_Click" type="button" class="btn btn-warning" Width="140px" />

                <asp:Button ID="delete" runat="server" OnClick="Delete_Click" Text="Delete" type="button" class="btn btn-danger" Width="140px" />
            </div>
        </div>
        <p id="errorMessage" runat="server" style="color: red">&nbsp;</p>
        <asp:UpdatePanel ID="MyControlPanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:ListView ID="SearchResults" runat="server" OnPagePropertiesChanging="OnPagePropertiesChanging">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFF8DC;">
                            <td style="max-width: 200px">
                                <div style="display: inline-block">
                                    <asp:CheckBox ID="CheckBox1" runat="server" value='<%# Eval("Id") %>' AutoPostBack="True" OnCheckedChanged="UpdateCheckBoxList" />
                                    <a href="Update.aspx?Id=<%# Eval("Id") %>">
                                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                                    </a>
                                </div>
                            </td>
                            <td>
                                <asp:Label ID="ConceptLabel" runat="server" Text='<%# Eval("Concept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StdConceptLabel" runat="server" Text='<%# Eval("StdConcept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DimensionLabel" runat="server" Text='<%# Eval("Dimension") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FilingDateStartLabel" runat="server" Text='<%# Eval("FilingDateStart") %>' />
                            </td>
                            <td>
                                <asp:Label ID="WeightLabel" runat="server" Text='<%# Eval("Weight") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UnitTypeLabel" runat="server" Text='<%# Eval("UnitType") %>' />
                            </td>
                            <td>
                                <asp:Label ID="MemberLabel" runat="server" Text='<%# Eval("Member") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OriginValueLabel" runat="server" Text='<%# Eval("OriginValue") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CalDirParentConceptLabel" runat="server" Text='<%# Eval("CalDirParentConcept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PreDirParentConceptLabel" runat="server" Text='<%# Eval("PreDirParentConcept") %>' />
                            </td>
                            <!--<td>
                    <asp:Label ID="UpdateTypeLabel" runat="server" Text='<%//# Eval("UpdateType") %>' />
                </td>-->
                            <td>
                                <asp:Label ID="UpdateContentLabel" runat="server" Text='<%# Eval("UpdateContent") %>' />
                            </td>
                            <!-- <td>
                    <asp:Label ID="ActionLabel" runat="server" Text='<%//# Eval("Action") %>' />
                </td>-->
                            <td>
                                <asp:Label ID="OriginRootLabel" runat="server" Text='<%# Eval("OriginRoot") %>' />
                            </td>
                            <!-- <td>
                    <asp:Label ID="UpdateOrderLabel" runat="server" Text='<%//# Eval("UpdateOrder") %>' />
                </td>-->
                            <td>
                                <asp:Label ID="StatementLabel" runat="server" Text='<%# Eval("Statement") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #008A8C; color: #FFFFFF;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td style="max-width: 200px">
                                <div style="display: inline-block">
                                    <asp:CheckBox ID="CheckBox2" runat="server" value='<%# Eval("Id") %>' AutoPostBack="True" OnCheckedChanged="UpdateCheckBoxList" />
                                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                                </div>
                            </td>
                            <td>
                                <asp:TextBox ID="ConceptTextBox" runat="server" Text='<%# Bind("Concept") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="StdConceptTextBox" runat="server" Text='<%# Bind("StdConcept") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="DimensionTextBox" runat="server" Text='<%# Bind("Dimension") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="FilingDateStartTextBox" runat="server" Text='<%# Bind("FilingDateStart") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="UnitTypeTextBox" runat="server" Text='<%# Bind("UnitType") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="MemberTextBox" runat="server" Text='<%# Bind("Member") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="OriginValueTextBox" runat="server" Text='<%# Bind("OriginValue") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="CalDirParentConceptTextBox" runat="server" Text='<%# Bind("CalDirParentConcept") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PreDirParentConceptTextBox" runat="server" Text='<%# Bind("PreDirParentConcept") %>' />
                            </td>
                            <!-- <td>
                    <asp:TextBox ID="UpdateTypeTextBox" runat="server" Text='<%//# Bind("UpdateType") %>' />
                </td>-->
                            <td>
                                <asp:TextBox ID="UpdateContentTextBox" runat="server" Text='<%# Bind("UpdateContent") %>' />
                            </td>
                            <!--<td>
                    <asp:TextBox ID="ActionTextBox" runat="server" Text='<%//# Bind("Action") %>' />
                </td>-->
                            <td>
                                <asp:TextBox ID="OriginRootTextBox" runat="server" Text='<%# Bind("OriginRoot") %>' />
                            </td>
                            <!--<td>
                    <asp:TextBox ID="UpdateOrderTextBox" runat="server" Text='<%//# Bind("UpdateOrder") %>' />
                </td>-->
                            <td>
                                <asp:TextBox ID="StatementTextBox" runat="server" Text='<%# Bind("Statement") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td style="max-width: 200px">
                                <div style="display: inline-block">
                                    <asp:CheckBox ID="CheckBox3" runat="server" value='<%# Eval("Id") %>' AutoPostBack="True" OnCheckedChanged="UpdateCheckBoxList" />
                                    <asp:TextBox ID="IdTextBox" runat="server" class="number-column" Text='<%# Bind("Id") %>' />
                                </div>
                            </td>
                            <td>
                                <asp:TextBox ID="ConceptTextBox" runat="server" class="number-column" Text='<%# Bind("Concept") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="StdConceptTextBox" runat="server" Text='<%# Bind("StdConcept") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="DimensionTextBox" runat="server" Text='<%# Bind("Dimension") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="FilingDateStartTextBox" runat="server" Text='<%# Bind("FilingDateStart") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="UnitTypeTextBox" runat="server" Text='<%# Bind("UnitType") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="MemberTextBox" runat="server" Text='<%# Bind("Member") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="OriginValueTextBox" runat="server" Text='<%# Bind("OriginValue") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="CalDirParentConceptTextBox" runat="server" Text='<%# Bind("CalDirParentConcept") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PreDirParentConceptTextBox" runat="server" Text='<%# Bind("PreDirParentConcept") %>' />
                            </td>
                            <!--<td>
                    <asp:TextBox ID="UpdateTypeTextBox" runat="server" Text='<%//# Bind("UpdateType") %>' />
                </td>-->
                            <td>
                                <asp:TextBox ID="UpdateContentTextBox" runat="server" Text='<%# Bind("UpdateContent") %>' />
                            </td>
                            <!--<td>
                    <asp:TextBox ID="ActionTextBox" runat="server" Text='<%//# Bind("Action") %>' />
                </td>-->
                            <td>
                                <asp:TextBox ID="OriginRootTextBox" runat="server" Text='<%# Bind("OriginRoot") %>' />
                            </td>
                            <!--<td>
                    <asp:TextBox ID="UpdateOrderTextBox" runat="server" Text='<%//# Bind("UpdateOrder") %>' />
                </td>-->
                            <td>
                                <asp:TextBox ID="StatementTextBox" runat="server" Text='<%# Bind("Statement") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #DCDCDC; color: #000000;">
                            <td style="max-width: 200px">
                                <div style="display: inline-block">
                                    <asp:CheckBox ID="CheckBox4" runat="server" value='<%# Eval("Id") %>' AutoPostBack="True" OnCheckedChanged="UpdateCheckBoxList" />
                                    <a href="Update.aspx?Id=<%# Eval("Id") %>">
                                        <asp:Label ID="IdLabel" runat="server" class="number-column" Text='<%# Eval("Id") %>' /></a>
                                </div>
                            </td>
                            <td>
                                <asp:Label ID="ConceptLabel" runat="server" class="number-column" Text='<%# Eval("Concept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StdConceptLabel" runat="server" Text='<%# Eval("StdConcept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DimensionLabel" runat="server" Text='<%# Eval("Dimension") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FilingDateStartLabel" runat="server" Text='<%# Eval("FilingDateStart") %>' />
                            </td>
                            <td>
                                <asp:Label ID="WeightLabel" runat="server" Text='<%# Eval("Weight") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UnitTypeLabel" runat="server" Text='<%# Eval("UnitType") %>' />
                            </td>
                            <td>
                                <asp:Label ID="MemberLabel" runat="server" Text='<%# Eval("Member") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OriginValueLabel" runat="server" Text='<%# Eval("OriginValue") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CalDirParentConceptLabel" runat="server" Text='<%# Eval("CalDirParentConcept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PreDirParentConceptLabel" runat="server" Text='<%# Eval("PreDirParentConcept") %>' />
                            </td>
                            <!--<td>
                    <asp:Label ID="UpdateTypeLabel" runat="server" Text='<%//# Eval("UpdateType") %>' />
                </td>-->
                            <td>
                                <asp:Label ID="UpdateContentLabel" runat="server" Text='<%# Eval("UpdateContent") %>' />
                            </td>
                            <!--<td>
                    <asp:Label ID="ActionLabel" runat="server" Text='<%//# Eval("Action") %>' />
                </td>-->
                            <td>
                                <asp:Label ID="OriginRootLabel" runat="server" Text='<%# Eval("OriginRoot") %>' />
                            </td>
                            <!--<td>
                    <asp:Label ID="UpdateOrderLabel" runat="server" Text='<%//# Eval("UpdateOrder") %>' />
                </td>-->
                            <td>
                                <asp:Label ID="StatementLabel" runat="server" Text='<%# Eval("Statement") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                            <th runat="server" style="max-width: 200px">Id</th>
                                            <th runat="server" class="number-column">Concept</th>
                                            <th runat="server">StdConcept</th>
                                            <th runat="server">Dimension</th>
                                            <th runat="server">FilingDateStart</th>
                                            <th runat="server" class="number-column">Weight</th>
                                            <th runat="server">UnitType</th>
                                            <th runat="server">Member</th>
                                            <th runat="server">OriginValue</th>
                                            <th runat="server">CalDirParentConcept</th>
                                            <th runat="server">PreDirParentConcept</th>

                                            <th runat="server">UpdateContent</th>

                                            <th runat="server">OriginRoot</th>

                                            <th runat="server">Statement</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="SearchResults">
                                        <Fields>
                                            <asp:NumericPagerField ButtonType="Link" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                            <td>
                                <div style="display: inline-block">
                                    <asp:CheckBox ID="CheckBox5" runat="server" value='<%# Eval("Id") %>' AutoPostBack="True" OnCheckedChanged="UpdateCheckBoxList" />
                                    <asp:Label ID="IdLabel1" runat="server" class="number-column" Text='<%# Eval("Id") %>' />
                                </div>
                            </td>
                            <td>
                                <asp:Label ID="ConceptLabel" runat="server" class="number-column" Text='<%# Eval("Concept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StdConceptLabel" runat="server" Text='<%# Eval("StdConcept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DimensionLabel" runat="server" Text='<%# Eval("Dimension") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FilingDateStartLabel" runat="server" Text='<%# Eval("FilingDateStart") %>' />
                            </td>
                            <td>
                                <asp:Label ID="WeightLabel" runat="server" class="number-column" Text='<%# Eval("Weight") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UnitTypeLabel" runat="server" Text='<%# Eval("UnitType") %>' />
                            </td>
                            <td>
                                <asp:Label ID="MemberLabel" runat="server" Text='<%# Eval("Member") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OriginValueLabel" runat="server" Text='<%# Eval("OriginValue") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CalDirParentConceptLabel" runat="server" Text='<%# Eval("CalDirParentConcept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PreDirParentConceptLabel" runat="server" Text='<%# Eval("PreDirParentConcept") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UpdateTypeLabel" runat="server" Text='<%# Eval("UpdateType") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UpdateContentLabel" runat="server" Text='<%# Eval("UpdateContent") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ActionLabel" runat="server" Text='<%# Eval("Action") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OriginRootLabel" runat="server" Text='<%# Eval("OriginRoot") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UpdateOrderLabel" runat="server" Text='<%# Eval("UpdateOrder") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StatementLabel" runat="server" Text='<%# Eval("Statement") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>

