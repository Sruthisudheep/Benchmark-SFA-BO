﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ScheduledReturn.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.ScheduledReturn" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
   
     <telerik:RadAjaxPanel ID="RadAjaxPanel7" runat="server" LoadingPanelID="RadAjaxLoadingPanel6">
         <ul class="nav" style="justify-content: flex-end;">
             <li class="nav-item">
                 <asp:LinkButton ID="btnAll" runat="server" CssClass="btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4 me-1" OnClick="btnAll_Click"></asp:LinkButton>
             </li>
             <li class="nav-item">
                 <asp:LinkButton ID="btnPending" runat="server" CssClass="nav-link btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4 me-1" OnClick="btnPending_Click"></asp:LinkButton>
             </li>
             <li class="nav-item">
                 <asp:LinkButton ID="btnActionTaken" runat="server" CssClass="nav-link btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4" OnClick="btnActionTaken_Click"></asp:LinkButton>
             </li>
             <li class="nav-item">
                 <asp:LinkButton ID="btnApproved" runat="server" CssClass="nav-link btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4" OnClick="btnApproved_Click"></asp:LinkButton>
             </li>
             <li class="nav-item">
                 <asp:LinkButton ID="btnRejected" runat="server" CssClass="nav-link btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4" OnClick="btnRejected_Click"></asp:LinkButton>
             </li>

        </ul>
          
     
      </telerik:RadAjaxPanel>

      <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel6" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>



       <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../assets/media/icons/excel.png" Height="50"  ToolTip="Download" OnClick="imgExcel_Click" AlternateText="Xlsx" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
        <AjaxSettings>

            <telerik:AjaxSetting AjaxControlID="btnAll">
                <UpdatedControls>                  
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                    <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnActionTaken" />
                    <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                     <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="btnPending">
                <UpdatedControls>                  
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                    <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnActionTaken" />
                     <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                     <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="btnActionTaken">
                <UpdatedControls>                  
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                     <telerik:AjaxUpdatedControl ControlID="btnAll" />
                     <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                     <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>    

               <telerik:AjaxSetting AjaxControlID="btnApproved">
                <UpdatedControls>                  
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                     <telerik:AjaxUpdatedControl ControlID="btnAll" />
                     <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnActionTaken" />
                     <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>   

               <telerik:AjaxSetting AjaxControlID="btnRejected">
                <UpdatedControls>                  
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                     <telerik:AjaxUpdatedControl ControlID="btnAll" />
                     <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                     <telerik:AjaxUpdatedControl ControlID="btnActionTaken" />
                </UpdatedControls>
            </telerik:AjaxSetting>   

             <telerik:AjaxSetting AjaxControlID="Filter">
                 <UpdatedControls>                                    
                      <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnActionTaken" />
                     <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                     <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="DateCheck">
                 <UpdatedControls>                           
                       
                      <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnActionTaken" />
                     <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                     <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>

               <telerik:AjaxSetting AjaxControlID="grvRpt">
                 <UpdatedControls>                           
                        
                      <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnActionTaken" />
                     <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                     <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            </AjaxSettings>
        
        </telerik:RadAjaxManagerProxy>

     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">


                   



                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        <div class="card-body" style="background-color:white; padding:20px;">
                              
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <div class=" col-lg-12 row" style="padding-bottom: 10px">
                                    <asp:PlaceHolder ID="plhFilter" runat="server" >
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
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true"
                                                RenderMode="Lightweight"
                                                ID="ddldepot" runat="server" EmptyMessage="Select Depot"
                                                OnSelectedIndexChanged="ddldepot_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                                    <div class="col-lg-2" style="margin-left: 32px;">
                                        <label class="control-label col-lg-12">Area</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
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
                                   <div class="col-lg-12 row" style="padding-bottom: 10px;">
                                 <div class="col-lg-12 ">
                                <b style="margin-right: 10px;">
                                    <asp:Label Text="Need to consider Date filter" runat="server"></asp:Label>
                               </b>
                                <asp:CheckBox ID="DateCheck" runat="server" Height="15px" Width="15px" OnCheckedChanged="DateCheck_CheckedChanged" AutoPostBack="true" Checked="false" Style="margin-bottom: 0;" />
                             </div>

                            </div>
                                <div class=" col-lg-12 row" style="padding-bottom: 10px">
                                      <div class="col-lg-2 " >
                                        <label class="control-label col-lg-12">From Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="rdfromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%"
                                                AutoPostBack="true" OnSelectedDateChanged="rdfromDate_SelectedDateChanged">
                                            </telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdfromDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-2" >
                                        <label class="control-label col-lg-12">To Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="rdendDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%"
                                                AutoPostBack="true" OnSelectedDateChanged="rdendDate_SelectedDateChanged">
                                            </telerik:RadDatePicker>
                                            <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdendDate" ControlToCompare="rdfromDate" ErrorMessage="End date must be greater"
                                                Display="Dynamic" ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdendDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                        <div class="col-lg-2">
                                        <label class="control-label col-lg-12">Route</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight" Width="100%"
                                                ID="rdRoute" runat="server" EmptyMessage="Select Route">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>

                                  <%--  <div class="col-lg-2" >
                                        <label class="control-label col-lg-12">Customer</label>
                                        <div class="col-lg-12" >
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="rdCustomer" runat="server" EmptyMessage="Select Customer"  AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>--%>





                                    <div class="col-lg-2" >
                                        <asp:LinkButton ID="Filter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" CausesValidation="false" OnClick="Filter_Click">
                                                    Apply Filter
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:LinkButton ID="lnkAdvFilter" runat="server" CssClass="btn btn-sm btn-light-primary me-2 border-1" OnClick="lnkAdvFilter_Click" Visible="false">
                                                    Advanced Filter
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="lnkAdd_Click">
                                                    Add
                                        </asp:LinkButton>

                                    </div>

                                </div>

                                <!--begin::Form-->
                                <!--end: Search Form -->

                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    OnItemCommand="grvRpt_ItemCommand"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="Medium" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="rrh_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>


                                            <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false" HeaderText="Detail" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                                        ImageUrl="../assets/media/icons/details.png"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                              <telerik:GridBoundColumn DataField="rrh_RequestNumber" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Request Number" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rrh_RequestNumber">
                                            </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="inv_InvoiceID" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Invoice ID" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="inv_InvoiceID">
                                            </telerik:GridBoundColumn>
                                          
                                         

                                            <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Codde">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="180px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                            </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                            </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                            </telerik:GridBoundColumn>

                                              <telerik:GridBoundColumn DataField="rrh_ReturnType" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Return Type" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rrh_ReturnType">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="Assign_Route" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Assigned Route" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Assign_Route" Display="false">
                                            </telerik:GridBoundColumn>

                                              <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                            </telerik:GridBoundColumn>

                                          
                                           
                                           


                                            <telerik:GridBoundColumn DataField="rrh_Type" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Type" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false" Display="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rrh_Type">
                                            </telerik:GridBoundColumn>
                                           
                                           

                                             <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Status" Display="false">
                                            </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Stag_Int_Remarks" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Int. Remarks" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Stag_Int_Remarks" >
                                            </telerik:GridBoundColumn>
                                           
                                            <telerik:GridBoundColumn DataField="Stag_Int_Status" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Int. Status" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Stag_Int_Status">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="Stag_Int_Time" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Int. Time" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Stag_Int_Time" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>
                                            



                                        </Columns>
                                    </MasterTableView>
                                    <PagerStyle AlwaysVisible="true" />
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                        <Resizing AllowColumnResize="true"></Resizing>
                                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </telerik:RadAjaxPanel>
                        </div>
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

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
