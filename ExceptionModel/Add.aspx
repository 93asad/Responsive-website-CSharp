<%@ Page Title="Add Record" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Add.aspx.cs" Inherits="WebApplication3.Add1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function SetAddedVal(statementCondition, negativeCondition) {
            document.getElementById("MainContent_statement").disabled = statementCondition;
            document.getElementById("MainContent_negative").disabled = negativeCondition;
        }
    </script>

    <h2><%: Title %></h2>
    <p>&nbsp;</p>
    <p id="errorMessage" runat="server" style="color: red">&nbsp;</p>
    <div class="container-fluid">
        <div class="panel panel-primary">
            <div class="panel-heading">Mandatory<span style="color: red"> *</span></div>
            <div class="panel-body" style="padding: 25px; padding-bottom: 0px">
                <div class="row" style="margin-bottom: 20px">
                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-2" Style="padding: 0px; font-size: medium">Cik</asp:Label>
                        <div class="col-md-10" style="padding: 0px">
                            <asp:TextBox ID="cik" CssClass="form-control" runat="server" Height="27px" placeholder="Enter Cik"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <div class="well" style="background: #f7fcfa; padding-top: 0px; border-left: solid; border-left-width: medium; border-bottom-left-radius: 3px; border-top-left-radius: 3px; border-left-color: #0288D1">
                            <h4 style="color: #0288D1">Action</h4>
                            <asp:UpdatePanel ID="MyControlPanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="action" runat="server" CssClass="spaced1" OnSelectedIndexChanged="SetAddedValue" AutoPostBack="true">
                                        <asp:ListItem Value="0">0 - Update</asp:ListItem>
                                        <asp:ListItem Value="1">1 - Delete</asp:ListItem>
                                        <asp:ListItem Value="2">2 - Add</asp:ListItem>
                                    </asp:RadioButtonList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="well" style="background: #f7fcfa; padding-top: 0px; border-left: solid; border-left-width: medium; border-bottom-left-radius: 3px; border-top-left-radius: 3px; border-left-color: #0288D1">
                            <h4 style="color: #0288D1">Update Order</h4>
                            <asp:RadioButtonList ID="updateOrder" runat="server" CssClass="spaced1">
                                <asp:ListItem Value="0">0 - Before Mapping</asp:ListItem>
                                <asp:ListItem Value="1">1 - In Mapping</asp:ListItem>
                                <asp:ListItem Value="2">2 - After Mapping</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">Optional</div>
            <div class="panel-body" style="padding: 25px; padding-bottom: 0px">
                <div class="row">
                    <div class="well" style="background: #f7fcfa; margin-left: 15px; margin-right: 15px">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <asp:Label runat="server" CssClass="control-label col-md-4">UnitType</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="unitType" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-md-4">Dimension</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="dimension" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-md-4">Member</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="member" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-md-4">OriginValue</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="originValue" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-md-4">PreDirParentConcept</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="preDir" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                            </div>
                            <div class="form-group col-md-6">

                                <asp:Label runat="server" CssClass="control-label col-md-4">Concept</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="concept" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-md-4">OriginRoot</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="originRoot" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-md-4">AddedValue</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="statement" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-md-4">UpdateContent</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="updateContent" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-md-4">CalDirParentConcept</asp:Label>
                                <div class="col-md-8" style="margin-bottom: 10px">
                                    <asp:TextBox ID="calDir" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="row">
                            <div class="form-group col-md-5">
                                <div class="well" style="background: #f7fcfa">

                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-4">Tree Type</asp:Label>

                                        <asp:DropDownList runat="server" ID="treeTYpe" Style="padding: 2px" AutoPostBack="true" class="dropdown btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" OnSelectedIndexChanged="Filters_Changed">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="0">0 - Industry</asp:ListItem>
                                            <asp:ListItem Value="1">1 - Bank</asp:ListItem>
                                            <asp:ListItem Value="3">3 - Insurance</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>

                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-4">Root Concept</asp:Label>
                                        <asp:DropDownList ID="rootConcept" runat="server" Style="padding: 2px" AutoPostBack="true" class="dropdown btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" OnSelectedIndexChanged="Filters_Changed">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Statement of Income%</asp:ListItem>
                                            <asp:ListItem>Balance Sheet</asp:ListItem>
                                            <asp:ListItem>Statement of cash flows</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-4">StdConcept</asp:Label>
                                        <asp:DropDownList runat="server" ID="stdConcept" Style="padding: 2px; max-width: 325px" class="dropdown btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                                            <asp:ListItem Value="">N/M</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-4">Negative</asp:Label>
                                        <asp:DropDownList runat="server" ID="negative" Style="padding: 2px" class="dropdown btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="9">9</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-4">Weight</asp:Label>
                                        <asp:DropDownList runat="server" ID="weight" Style="padding: 2px" class="dropdown btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="-1">-1</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-4">Fiscal Year</asp:Label>
                                        <asp:DropDownList runat="server" ID="fiscalYear" Style="padding: 2px" class="dropdown btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="2009">2009</asp:ListItem>
                                            <asp:ListItem Value="2010">2010</asp:ListItem>
                                            <asp:ListItem Value="2011">2011</asp:ListItem>
                                            <asp:ListItem Value="2012">2012</asp:ListItem>
                                            <asp:ListItem Value="2013">2013</asp:ListItem>
                                            <asp:ListItem Value="2014">2014</asp:ListItem>
                                            <asp:ListItem Value="2015">2015</asp:ListItem>
                                            <asp:ListItem Value="2016">2016</asp:ListItem>
                                            <asp:ListItem Value="2017">2017</asp:ListItem>
                                            <asp:ListItem Value="2018">2018</asp:ListItem>
                                            <asp:ListItem Value="2019">2019</asp:ListItem>
                                            <asp:ListItem Value="2020">2020</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-4">Period Focus</asp:Label>
                                        <asp:DropDownList ID="periodFocus" runat="server" Style="padding: 2px" class="dropdown btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
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

                                    <div class="row">
                                        <asp:Label runat="server" CssClass="control-label col-md-4">Update Type</asp:Label>
                                        <asp:DropDownList ID="updateType" runat="server" Style="padding: 2px" class="dropdown btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="0">0 - Update on Concept</asp:ListItem>
                                            <asp:ListItem Value="1">1 - Update on FiscalYear</asp:ListItem>
                                            <asp:ListItem Value="2">2 - Update on PeriodFocus</asp:ListItem>
                                            <asp:ListItem Value="3">3 - Update on StdConcept</asp:ListItem>
                                            <asp:ListItem Value="4">4 - Update on UnitType</asp:ListItem>
                                            <asp:ListItem Value="5">5 - Update on RootConcept</asp:ListItem>
                                            <asp:ListItem Value="6">6 - Update on Weight</asp:ListItem>
                                            <asp:ListItem Value="7">7 - Update on OriginValue * 1000</asp:ListItem>
                                            <asp:ListItem Value="8">8 - Update on Dimension</asp:ListItem>
                                            <asp:ListItem Value="9">9 - Update on Member</asp:ListItem>
                                            <asp:ListItem Value="10">10 - Update on OriginValue</asp:ListItem>
                                            <asp:ListItem Value="11">11 - Update on CalDirParentConcept</asp:ListItem>
                                            <asp:ListItem Value="12">12 - Update on PreDirParentConcept</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <div class="well" style="background: #f7fcfa">

                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-5">Start Date</asp:Label>
                                        <div class="col-md-7">
                                            <asp:TextBox ID="strtDate" type="date" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-5">End Date</asp:Label>
                                        <div class="col-md-7">
                                            <asp:TextBox ID="endDate" type="date" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom: 10px">
                                        <asp:Label runat="server" CssClass="control-label col-md-5">Filing Start Date</asp:Label>
                                        <div class="col-md-7">
                                            <asp:TextBox ID="filingStrtDate" type="date" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <asp:Label runat="server" CssClass="control-label col-md-5">Filing End Date</asp:Label>
                                        <div class="col-md-7">
                                            <asp:TextBox ID="filingEndDate" type="date" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <asp:Button ID="add" runat="server" OnClick="Add_Click" Text="Add" type="button" class="btn btn-danger" />
        &nbsp;&nbsp;&nbsp;
    <asp:Button ID="cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" type="button" class="btn btn-success" />

    </div>
</asp:Content>
