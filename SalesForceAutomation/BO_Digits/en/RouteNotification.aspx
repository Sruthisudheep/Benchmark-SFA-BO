﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="RouteNotification.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.RouteNotification" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script>       
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function successModal() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
        }
    </script>
</asp:Content>

<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

        <asp:LinkButton ID="lnkSubCat" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Add" OnClick="lnkSubCat_Click"></asp:LinkButton>
    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="background-color: white; padding: 20px;">

        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!--begin::Portlet-->
                    <div class="kt-portlet">
                        <%--<div class="kt-portlet__head" style="padding-top: 20px">

                       
                    </div>--%>





                        <div class="card-body" style="background-color: white; padding-bottom: 10px;">


                            <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <div class=" col-lg-12 row" style="padding-bottom: 10px">
                                    <asp:PlaceHolder ID="plhFilter" runat="server">
                                        <div class="col-lg-2">
                                            <label class="control-label col-lg-12">Region</label>
                                            <div class="col-lg-12">
                                                <telerik:RadComboBox Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                    ID="ddlregion" runat="server" EmptyMessage="Select Region" AutoPostBack="true" OnSelectedIndexChanged="ddlregion_SelectedIndexChanged">
                                                </telerik:RadComboBox>

                                            </div>
                                        </div>
                                        <div class="col-lg-2" style="margin-left: 32px;">
                                            <label class="control-label col-lg-12">Depot</label>
                                            <div class="col-lg-12">
                                                <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true"
                                                    RenderMode="Lightweight"
                                                    ID="ddldepot" runat="server" EmptyMessage="Select Depot"
                                                    OnSelectedIndexChanged="ddldepot_SelectedIndexChanged" AutoPostBack="true">
                                                </telerik:RadComboBox>

                                            </div>
                                        </div>
                                        <div class="col-lg-2" style="margin-left: 32px;">
                                            <label class="control-label col-lg-12">Area</label>
                                            <div class="col-lg-12">
                                                <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                    ID="ddldpoArea" runat="server" EmptyMessage="Select Area"
                                                    OnSelectedIndexChanged="ddldpoArea_SelectedIndexChanged" AutoPostBack="true">
                                                </telerik:RadComboBox>

                                            </div>
                                        </div>
                                        <div class="col-lg-2" style="margin-left: 32px;">
                                            <label class="control-label col-lg-12">Subarea</label>
                                            <div class="col-lg-12">
                                                <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                    ID="ddldpoSubArea" runat="server" EmptyMessage="Select Subarea" OnSelectedIndexChanged="ddldpoSubArea_SelectedIndexChanged" AutoPostBack="true">
                                                </telerik:RadComboBox>

                                            </div>
                                        </div>
                                    </asp:PlaceHolder>
                                  


                                </div>
                                <div class=" col-lg-12 row" style="padding-bottom: 10px">

                                      <div class="col-lg-2" style="margin-left: 4px;">
                                        <label class="control-label col-lg-12">Route</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight" Width="100%"
                                                ID="rdRoute" runat="server" EmptyMessage="Select Route" OnSelectedIndexChanged="rdRoute_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="control-label col-lg-12">Read Flag</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDropDownList ID="ddlreadflag" runat="server" Filter="Contains" EmptyMessage="Select flag" RenderMode="Lightweight" Width="100%">

                                                <Items>
                                                    <telerik:DropDownListItem Text="All" Value="A" />
                                                    <telerik:DropDownListItem Text="Read" Value="R" />
                                                    <telerik:DropDownListItem Text="Replied" Value="RP" />
                                                    <telerik:DropDownListItem Text="Sent" Value="S" />

                                                </Items>
                                            </telerik:RadDropDownList>
                                        </div>
                                    </div>
                                     


                                    <div class="col-lg-2 " style="margin-left: 32px;">
                                        <label class="control-label col-lg-12">From Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="rdFromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%"
                                                AutoPostBack="true" OnSelectedDateChanged="rdfromDate_SelectedDateChanged">
                                            </telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdfromDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-2" style="margin-left: 32px;">
                                        <label class="control-label col-lg-12">To Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="rdEndDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server"  Width="100%"
                                                AutoPostBack="true" OnSelectedDateChanged="rdendDate_SelectedDateChanged">
                                            </telerik:RadDatePicker>
                                            <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdendDate" ControlToCompare="rdfromDate" ErrorMessage="End date must be greater"
                                                Display="Dynamic" ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdendDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>


                                    <div class="col-lg-2" style="top: 10px; text-align: center; padding-top: 15px; margin-left: 17px;">
                                        <asp:LinkButton ID="Filter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" CausesValidation="false" OnClick="lnkFilter_Click">
                                                    Apply Filter
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-lg-2" style="text-align: center; padding-top: 15px; margin-left: 15px;">
                                        <asp:LinkButton ID="lnkAdvFilter" runat="server" CssClass="btn btn-sm btn-light-primary me-2 border-1" OnClick="lnkAdvFilter_Click" Visible="false">
                                                    Advanced Filter
                                        </asp:LinkButton>
                                    </div>


                                </div>


                                <!--end: Search Form -->



                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    OnItemCommand="grvRpt_ItemCommand"
                                    OnItemDataBound="grvRpt_ItemDataBound"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="rnt_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <%--<telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="5px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                    </telerik:GridButtonColumn>--%>
                                            <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Delete" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Delete" ID="Deletebtn" Visible="true" AlternateText="Delete" runat="server"
                                                        ImageUrl="../assets/media/svg/general/Trash.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Created Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                            </telerik:GridBoundColumn>


                                            <telerik:GridBoundColumn DataField="rnt_Header" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Message" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rnt_Header">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rnt_Desc" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Description" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rnt_Desc">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rnt_ReadFlag" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Read Flag" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rnt_ReadFlag">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="rnt_ReplyMessage" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Reply" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rnt_ReplyMessage">
                                            </telerik:GridBoundColumn>
                                            <%--  <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Replied User" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                    </telerik:GridBoundColumn>--%>
                                            <telerik:GridBoundColumn DataField="rnt_ReplyTime" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="ReplyTime" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rnt_ReplyTime">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Status">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="rnt_IsMandatory" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Type" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rnt_IsMandatory">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                        <Resizing AllowColumnResize="true"></Resizing>
                                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </telerik:RadAjaxPanel>


                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--delete--%>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" style="height:auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to delete..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Yes" OnClick="lnkDelete_Click" CssClass="btn btn-sm fw-bold btn-primary" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(modalConfirm);">Cancel</button>

                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" style="height:auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Data Deleted Successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

</asp:Content>
