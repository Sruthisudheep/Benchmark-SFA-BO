﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="MerchandisingTransactionDetail.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.MerchandisingTransactionDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
                        
   </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="padding:20px; background-color:white;">
     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    
                     <div class="kt-portlet__head" style=" padding-bottom: 20px; border-bottom-style:inset;border-bottom-width:thin;">                       
                        <div class="kt-portlet__head-actions">
                            <div class="row">
                                <div class="col-sm-6">
                                 <h5 class="kt-portlet__head-title">Customer Operation - <asp:Label ID="lblType" runat="server" Font-Bold="true" ForeColor="Blue"></asp:Label>
                                    </h5>
                                 </div>
                               
                              </div>
                        </div>
                    </div>
                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body pb-0" style="border-bottom-style:inset;border-bottom-width:thin; padding-top:10px; margin-bottom:10px;">


                             <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server" BorderStyle="None">
                                <Items>
                                    <telerik:RadPanelItem Font-Bold="true" Expanded="false" BackColor="#F2F6F9">
                                        <ContentTemplate>
                                            <div class="kt-portlet__body" style=" display: grid;">
                                                <table>
                                                    <td style="padding-left:40px;">
                                                        <div class="col-lg-12 mb-2 row">
                                                            <div class="col-lg-3">
                                                                <label class="col-lg-2 col-form-label" style="display: contents;">Route:</label>
                                                                <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                    <asp:Label ID="lblRoute" Font-Bold="true" runat="server"></asp:Label></label>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <label class="col-lg-2 col-form-label" style="display: contents;">User:</label>
                                                                <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                    <asp:Label ID="lblUser" Font-Bold="true" runat="server"></asp:Label></label>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <label class="col-lg-2 col-form-label" style="display: contents;">Version:</label>
                                                                <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                    <asp:Label ID="lblVersion" Font-Bold="true" runat="server"></asp:Label></label>
                                                            </div>
                                                      
                                                                 <div class="col-lg-3">
                                                                <label class="col-lg-2 col-form-label" style="display: contents;">Date:</label>
                                                                <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                    <asp:Label ID="lblCreatedDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                            </div>
                                                         </div>
                                                    </td>
                                                    <td>
                                                        
                                                       <%-- <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Start Day Time:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblStartTime" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">End Day Time:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblEndTime" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>--%>
                                                        
                                                    </td>
                                                </table>
                                            </div>
                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
                        
                            
                         </div>

                            
                            <!-- ---------------------------- -->
                           

                            <!-- ---------------------------- -->


                          <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                            <div class="kt-portlet__body">
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvheader" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvheader_NeedDataSource"
                                    AllowFilteringByColumn="false"
                                    Height="100px"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true"  CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="true" ItemStyle-Font-Bold="true" ItemStyle-ForeColor="Blue" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" 
                                        EnableHeaderContextMenu="true">
                                       
                                      
                                    </MasterTableView>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                        <Resizing AllowColumnResize="true"></Resizing>
                                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </div>
                        </telerik:RadAjaxPanel>


                        <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                            <div class="kt-portlet__body">
                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    OnItemCommand="grvRpt_ItemCommand"
                                     OnItemDataBound="grvRpt_ItemDataBound"
                                    OnPreRender="grvRpt_PreRender"
                                    AllowFilteringByColumn="false"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="50" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="true" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="id"
                                        EnableHeaderContextMenu="true">

                                        <Columns>
                                            <telerik:GridTemplateColumn HeaderStyle-Width="60px" UniqueName="detail" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" >
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                                        ImageUrl="../assets/media/svg/general/details.PNG"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            
                                             <telerik:GridTemplateColumn HeaderStyle-Width="150px" HeaderText="Answer" UniqueName="Images" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                            <ItemTemplate>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn> 

                                             <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Initial Images" UniqueName="Images1" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                            <ItemTemplate>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                              <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Final Images" UniqueName="Images2" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                            <ItemTemplate>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        </Columns>
                                      
                                    </MasterTableView>
                                    <PagerStyle AlwaysVisible="true" />
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                        <Resizing AllowColumnResize="true"></Resizing>
                                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </div>
                        </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>

                        </telerik:RadAjaxLoadingPanel>
                    </div>

                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body pb-0">

                            <div class="col-lg-12 row" style="padding-bottom: 30px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
