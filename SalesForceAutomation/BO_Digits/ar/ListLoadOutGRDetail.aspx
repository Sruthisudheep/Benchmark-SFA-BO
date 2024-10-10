﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/ar/ar_master.Master" AutoEventWireup="true" CodeBehind="ListLoadOutGRDetail.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.ar.ListLoadOutGRDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
            
   <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../assets/media/icons/excel.png" Style="height: 60px; padding-top: 10px; padding-left: 20px;" ToolTip="تحميل" OnClick="imgExcel_Click" AlternateText="Xlsx" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet" style="background-color:white;  padding:20px;">
                     <div class="kt-portlet__body pb-0">

                            <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server">
                                <Items>
                                    <telerik:RadPanelItem Font-Bold="true" Expanded="false" BackColor="#F2F6F9">

                                        <ContentTemplate>
                                            <div class="kt-portlet__body" style="background-color: #F9FAFC; display: grid">
                                                <table>
                                                    <td style="width: 56%" >
                                                        <tr>
                                                            <div class="col-lg-12 mb-2 row" style="padding-left: 11px; padding-top: 8px;">
                                                        <div class="col-lg-3 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">طريق:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblRot" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-3 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">مستخدم:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblUser" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                          <div class="col-lg-3 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">تاريخ:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                         <div class="col-lg-3 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">حالة
:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblstatus" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </div>
                                                        </tr>
                                                        
                                                        
                                                    </td>
                                                    
                                                </table>


                                            </div>

                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
                        </div>
                   
                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body">
                           <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1"  >
                         
                        
                            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                ID="grvRpt" GridLines="None"
                                ShowFooter="True" AllowSorting="True"
                                OnNeedDataSource="grvRpt_NeedDataSource"
                                OnItemCommand="grvRpt_ItemCommand"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true" ScrollHeight="500px">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="lod_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <%--<telerik:GridTemplateColumn HeaderStyle-Width="40px" UniqueName="Detail" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                                    ImageUrl="assets/media/icons/svg/General/Clipboard.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>--%>
                                        <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="90px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="رمز الصنف" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="غرض" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="prd_NameArabic" AllowFiltering="true" HeaderStyle-Width="150px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="اسم العنصر بالعربية" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="prd_NameArabic">
                                        </telerik:GridBoundColumn>

                                          <telerik:GridBoundColumn DataField="lod_CurrentStock_H_UOM" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="وحدة قياس أعلى للمخزون الحالي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_CurrentStock_H_UOM">
                                        </telerik:GridBoundColumn>

                                         <telerik:GridBoundColumn DataField="lod_CurrentStock_H_Qty" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="أعلى كمية المخزون الحالي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_CurrentStock_H_Qty">
                                        </telerik:GridBoundColumn>
                                       
                                           <telerik:GridBoundColumn DataField="lod_CurrentStock_L_UOM" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="وحدة القياس المنخفضة للمخزون الحالي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_CurrentStock_L_UOM">
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="lod_CurrentStock_L_Qty" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="الكمية المنخفضة للمخزون الحالي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_CurrentStock_L_Qty">
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn DataField="lod_EndStock_H_UOM" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="وحدة القياس الأعلى للمخزون النهائي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_EndStock_H_UOM">
                                        </telerik:GridBoundColumn>


                                        
                                        <telerik:GridBoundColumn DataField="lod_EndStock_H_Qty" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="الكمية الأعلى للمخزون النهائي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_EndStock_H_Qty">
                                        </telerik:GridBoundColumn>

                                       

                                        <telerik:GridBoundColumn DataField="lod_EndStock_L_UOM" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="وحدة القياس السفلية للمخزون النهائي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_EndStock_L_UOM">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="lod_EndStock_L_Qty" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="الكمية المنخفضة للمخزون النهائي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_EndStock_L_Qty">
                                        </telerik:GridBoundColumn>
                                        
                                      

                                     
                                        <telerik:GridBoundColumn DataField="lod_Offload_H_UOM" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" وحدة قياس أعلى للحمل الخارج" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_Offload_H_UOM">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="lod_Offload_H_Qty" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="كمية أعلى من الحمولة" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_Offload_H_Qty">
                                        </telerik:GridBoundColumn>
                                       
                                        <telerik:GridBoundColumn DataField="lod_Offload_L_UOM" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="انخفاض وحدة قياس الحمولة" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_Offload_L_UOM">
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="lod_Offload_L_Qty" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="كمية أقل من الحمولة" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_Offload_L_Qty">
                                        </telerik:GridBoundColumn>


                                        <telerik:GridBoundColumn DataField="lod_Adj_H_UOM" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="وحدة قياس أعلى معدلة" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_Adj_H_UOM" ItemStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>

                                          <telerik:GridBoundColumn DataField="lod_Adj_H_Qty" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="تعديل الكمية الأعلى" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_Adj_H_Qty">
                                        </telerik:GridBoundColumn>

                                       
                                        <telerik:GridBoundColumn DataField="lod_Adj_L_UOM" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="وحدة القياس السفلية المعدلة" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_Adj_L_UOM" ItemStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>

                                         <telerik:GridBoundColumn DataField="lod_Adj_L_Qty" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="كمية أقل معدلة" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_Adj_L_Qty">
                                        </telerik:GridBoundColumn>


                                        
                                       
                                        
                                        
                                      <telerik:GridBoundColumn DataField="lod_ExcessTotalQty" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="مجموع الكمية الزائدة" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="lod_ExcessTotalQty">
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
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
       