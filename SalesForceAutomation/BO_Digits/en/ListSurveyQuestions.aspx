﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListSurveyQuestions.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.ListSurveyQuestions" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
      <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">                 
     
     <asp:LinkButton ID="lnkAddQuestion" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="lnkAddQuestion_Click">
                                                    Add
                            </asp:LinkButton>
           </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="background-color:white; padding:20px;">
     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                   
                  
                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body">
                            <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

                             <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">                 
     
                            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                ID="grvRpt" GridLines="None"
                                ShowFooter="True" AllowSorting="True"
                                OnNeedDataSource="grvRpt_NeedDataSource"
                                OnItemCommand="grvRpt_ItemCommand"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="10" CellSpacing="0">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="qsm_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                         <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="60px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                        </telerik:GridButtonColumn>


                                         <telerik:GridBoundColumn DataField="qsm_Number" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Number" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="qsm_Number">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="qsm_Question" AllowFiltering="true" HeaderStyle-Width="200px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Question" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="qsm_Question">
                                        </telerik:GridBoundColumn>

                                         <telerik:GridBoundColumn DataField="qst_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Type" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="qst_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="qsmIsCommentsNeeded" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Comments Needed" FilterControlWidth="60%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="qsmIsCommentsNeeded">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Created Date" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                        </telerik:GridBoundColumn>

                                     

                                        <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="Status" Visible="false">
                                        </telerik:GridBoundColumn>

                                       
                                    </Columns>
                                </MasterTableView>
                                <PagerStyle AlwaysVisible="true" />
                                <GroupingSettings CaseSensitive="false" />
                                <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                    <Resizing AllowColumnResize="true"></Resizing>
                                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>
                                 </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>  

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
        </div>
</asp:Content>
