﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/ar/ar_master.Master" AutoEventWireup="true" CodeBehind="ARHeader.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.ar.ARHeader" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
 <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../assets/media/icons/excel.png" Style="height: 50px; " ToolTip="تحميل" OnClick="imgExcel_Click" AlternateText="Xlsx" />


                            <asp:ImageButton ID="btnPDF" runat="server" ImageUrl="../assets/media/icons/file.png" style=" height:40px; Width:33px;" ToolTip="مطبعة"
                                OnClick="btnPDF_Click" AlternateText="pdf" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">


                   

                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="card-body" style="background-color:white; padding:20px;">
                             
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                  <div class=" col-lg-12 row" style="padding-bottom: 10px">
                                    <asp:PlaceHolder ID="plhFilter" runat="server" >
                                    <div class="col-lg-2">
                                        <label class="control-label col-lg-12">منطقة</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddlregion" runat="server" EmptyMessage="اختر المنطقة" AutoPostBack="true" OnSelectedIndexChanged="ddlregion_SelectedIndexChanged">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                                    <div class="col-lg-2" style="margin-left: 32px;">
                                        <label class="control-label col-lg-12">مستودع</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true"
                                                RenderMode="Lightweight"
                                                ID="ddldepot" runat="server" EmptyMessage="حدد المستودع"
                                                OnSelectedIndexChanged="ddldepot_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                                    <div class="col-lg-2" style="margin-left: 32px;">
                                        <label class="control-label col-lg-12">منطقة</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddldpoArea" runat="server" EmptyMessage="حدد المنطقة"
                                                OnSelectedIndexChanged="ddldpoArea_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                                    <div class="col-lg-2" style="margin-left: 32px;">
                                        <label class="control-label col-lg-12">المنطقة الفرعية</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddldpoSubArea" runat="server" EmptyMessage="حدد المنطقة الفرعية" OnSelectedIndexChanged="ddldpoSubArea_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                                        </asp:PlaceHolder>
                                    <div class="col-lg-2" style="margin-left: 4px;">
                                        <label class="control-label col-lg-12">طريق</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="rdRoute" runat="server" EmptyMessage="حدد الطريق" OnSelectedIndexChanged="rdRoute_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>


                                </div>
                                
                                <div class=" col-lg-12 row" style="padding-bottom: 10px">



                                    <div class="col-lg-2">
                                        <label class="control-label col-lg-12">عميل</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="rdCustomer" runat="server" EmptyMessage="حدد العميل" OnSelectedIndexChanged="rdCustomer_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>


                                    <div class="col-lg-2 " style="margin-left: 32px;">
                                        <label class="control-label col-lg-12">من التاريخ</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="rdfromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server">
                                            </telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdfromDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-2" style="margin-left: 32px;">
                                        <label class="control-label col-lg-12">ان يذهب في موعد</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="rdendDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server">
                                            </telerik:RadDatePicker>
                                            <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdendDate" ControlToCompare="rdfromDate" ErrorMessage="يجب أن يكون تاريخ الانتهاء أكبر"
                                                Display="Dynamic" ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="حتى تاريخه إلزامي" ForeColor="Red" ControlToValidate="rdendDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>


                                    <div class="col-lg-2" style="top: 10px; text-align: center; padding-top: 15px; margin-left: 17px;">
                                        <asp:LinkButton ID="Filter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" CausesValidation="false" OnClick="lnkDOwnload_Click">
                                                    تطبيق عامل التصفية
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-lg-2" style="text-align: center; padding-top: 15px; margin-left: 15px;">
                                        <asp:LinkButton ID="lnkAdvFilter" runat="server" CssClass="btn btn-sm btn-light-primary me-2 border-1" OnClick="lnkAdvFilter_Click">
                                                    تصفية متقدم
                                        </asp:LinkButton>
                                    </div>


                                </div>

                                <%--</telerik:RadAjaxPanel>--%>


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
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="Medium" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="arh_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>
                                            <telerik:GridTemplateColumn HeaderStyle-Width="50px" UniqueName="Detail" AllowFiltering="false" HeaderText="التفاصيل" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Detail" ID="RadImageButton2" CommandArgument='<%# Eval("arp_Type")%>' Visible="true" AlternateText="Detail" runat="server"
                                                        ImageUrl="../assets/media/icons/details.png"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="كود الطريق" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="طريق " FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Name" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="rot_ArabicName" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText=" اسم المسار العربي" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_ArabicName">
                                            </telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="انشأ من قبل" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="usr_ArabicName" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="أنشأتها بالعربية" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="usr_ArabicName">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="130px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="كود العميل" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="عميل" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Name" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="cus_NameArabic" AllowFiltering="true" HeaderStyle-Width="170px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText=" اسم العميل باللغة العربية" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_NameArabic">
                                            </telerik:GridBoundColumn>


                                             <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="تاريخ" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="arh_ARNumber" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="رقم حسابات القبض" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="arh_ARNumber">
                                            </telerik:GridBoundColumn>

                                           

                                         






                                            <telerik:GridBoundColumn DataField="arh_CollectedAmount" AllowFiltering="true" HeaderStyle-Width="90px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="جمع <br> المبلغ" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="arh_CollectedAmount" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>

                                           

                                            <telerik:GridBoundColumn DataField="arp_Type" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="الدفع <br> النوع" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="arp_Type" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="arh_PayMode" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="طريقة الدفع" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="arh_PayMode" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>




                                         

                                            <telerik:GridBoundColumn DataField="bnk_Name" AllowFiltering="true" HeaderStyle-Width="130px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="بنك" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="bnk_Name" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="bnk_NameArabic" AllowFiltering="true" HeaderStyle-Width="130px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="اسم البنك بالعربية" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="bnk_NameArabic" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="arp_ChequeNo" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="تحقق <br> لا" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="arp_ChequeNo" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="arp_ChequeDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="تحقق <br> التاريخ" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="arp_ChequeDate" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Void" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="فارغ" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Void" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>
                                         
                                              <telerik:GridBoundColumn DataField="arh_Remarks" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="ملاحظات" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="arh_Remarks" ItemStyle-HorizontalAlign="Left">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridTemplateColumn UniqueName="Image" AllowFiltering="false"
                                                HeaderStyle-Width="70px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="صورة"
                                                HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="img1" ImageHeight="20px" ImageWidth="20px" runat="server"
                                                        ImageUrl='<%#"../" + Eval("arp_Image1")%>' NavigateUrl='<%#"../" + Eval("arp_Image1")%>' Height="20px" width="20px" Target="_blank">
                                                    </asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                             <telerik:GridTemplateColumn UniqueName="Image" AllowFiltering="false"
                                                HeaderStyle-Width="70px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="إمضاء"
                                                HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="img2" ImageHeight="20px" ImageWidth="20px" runat="server"
                                                        ImageUrl='<%#"../" + Eval("arh_Signature")%>' NavigateUrl='<%#"../" + Eval("arh_Signature")%>' Height="20px" width="20px" Target="_blank">
                                                    </asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>


                                            
                                             <telerik:GridTemplateColumn UniqueName="RecieptImg" AllowFiltering="false"
                                                HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="صورة الاستلام"
                                                HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="img3" ImageHeight="20px" ImageWidth="20px" runat="server"
                                                        ImageUrl='<%#"../" + Eval("arh_RecieptImg")%>' NavigateUrl='<%#"../" + Eval("arh_RecieptImg")%>' Height="20px" width="20px" Target="_blank">
                                                    </asp:HyperLink>
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
</asp:Content>

