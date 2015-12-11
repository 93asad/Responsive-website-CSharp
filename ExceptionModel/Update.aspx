<%@ Page Title="Update Record" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Update.aspx.cs" Inherits="WebApplication3.Update" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %></h2>
    <p>&nbsp;</p>
    <p id="errorMessage" runat="server" style="color: red">&nbsp;</p>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-primary ">
                    <div class="panel-heading">Action<span style="color: red"> *</span></div>
                    <div class="panel-body">
                        <asp:RadioButtonList ID="action" runat="server" RepeatDirection="Horizontal" CssClass="spaced1">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">Update order<span style="color: red"> *</span></div>
                    <div class="panel-body">
                        <asp:RadioButtonList ID="updateOrder" runat="server" RepeatDirection="Horizontal" CssClass="spaced1">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="panel panel-primary">
                <div class="panel-heading">Update Type</div>
                <div class="panel-body">

                    <asp:UpdatePanel ID="MyControlPanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Button runat="server" Text="Clear" OnClick="Clear_Radio_Selection_Click" type="button" class="btn btn-warning" />

                            <asp:RadioButtonList ID="updateType" runat="server" RepeatDirection="Horizontal" CssClass="spaced" Style="display: inline-block">

                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                                <asp:ListItem Value="6">6</asp:ListItem>
                                <asp:ListItem Value="7">7</asp:ListItem>
                                <asp:ListItem Value="8">8</asp:ListItem>
                                <asp:ListItem Value="9">9</asp:ListItem>
                                <asp:ListItem Value="10">10</asp:ListItem>
                                <asp:ListItem Value="11">11</asp:ListItem>
                                <asp:ListItem Value="12">12</asp:ListItem>
                            </asp:RadioButtonList>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>


    </div>
    <div class="row">
        <div class="panel panel-primary ">
            <div class="panel-heading">Preconditions</div>
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-2">Cik<span style="color:red">*</span></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="cik" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-4">FiscalYear</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox ID="fiscalYear" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-5">PeriodFocus</asp:Label>
                        <div class="col-md-7">
                            <asp:DropDownList ID="periodFocus" runat="server">
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

                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-4">Weight</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox ID="weight" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-4">UnitType</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox ID="unitType" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-4">Dimension</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox ID="dimension" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-3">Member</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox ID="member" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-4">OriginValue</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox ID="originValue" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="form-group col-md-4">
                        <asp:Label runat="server" CssClass="control-label col-md-3">Concept</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox ID="concept" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-4">
                        <asp:Label runat="server" CssClass="control-label col-md-3">StdConcept</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox ID="stdConcept" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-4">
                        <asp:Label runat="server" CssClass="control-label col-md-4">RootConcept</asp:Label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="rootConcept" runat="server">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Statement of Income%</asp:ListItem>
                                <asp:ListItem>Balance Sheet</asp:ListItem>
                                <asp:ListItem>Statement of cash flows</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="row" style="margin-left: auto">

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" CssClass="control-label col-md-4">OriginRoot</asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="originRoot" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" CssClass="control-label col-md-4">AddedValue</asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="statement" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <asp:Label runat="server" CssClass="control-label col-md-4">UpdateContent</asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="updateContent" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group col-md-2">
                            <asp:Label runat="server" CssClass="control-label col-md-5">Negative</asp:Label>
                            <div class="col-md-6">
                                <asp:DropDownList runat="server" ID="negative">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row" style="margin-left: auto">
                        <div class="form-group col-md-5">
                            <asp:Label runat="server" CssClass="control-label col-md-4">CalDirParentConcept</asp:Label>
                            <div class="col-md-7">
                                <asp:TextBox ID="calDir" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group col-md-5">
                            <asp:Label runat="server" CssClass="control-label col-md-4">PreDirParentConcept</asp:Label>
                            <div class="col-md-7">
                                <asp:TextBox ID="preDir" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <hr />
                <div class="row">
                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-4">StartDate</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="strtDate" type="date" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-4">EndDate</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="endDate" type="date" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-6">FilingStartDate</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="filingStrtDate" type="date" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <asp:Label runat="server" CssClass="control-label col-md-6">FilingEndDate</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="filingEndDate" type="date" CssClass="form-control" runat="server" Height="25px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:Button ID="update" runat="server" OnClick="Update_Click" Text="Update" type="button" class="btn btn-danger" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" type="button" class="btn btn-success" />
</asp:Content>
