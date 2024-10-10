﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="RouteSettingsMaster.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.RouteSettingsMaster" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script type="text/javascript">
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function Succcess(a) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#success').text(a);
        }
        function Failure() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_5').modal('show');
         }
         function FailureSave() {
             $('#modalConfirm').modal('hide');
             $('#kt_modal_1_7').modal('show');
         }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
      <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

        <asp:LinkButton ID="lnkCancel" runat="server"
            Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
            CausesValidation="False" OnClick="lnkCancel_Click" />
        <asp:LinkButton ID="lnkSave" runat="server" ValidationGroup="form" OnClick="lnkSave_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed'
            CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" />
    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
      <div class="card-body p-8" style="background-color:white;;">

          <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">

                <div class="col-lg-12 row">

                              <%--  <div class="col-lg-4 form-group mb-4">
                                    <label class="control-label col-lg-12">Route <span class="required"></span></label>
                                    <div class="col-lg-12">
                                         <telerik:RadComboBox ID="ddlRoute" runat="server" EmptyMessage="Select Route" CausesValidation="false" Width="100%" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" AutoPostBack="true"></telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                ControlToValidate="ddlRoute" ErrorMessage="Please Select Route" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    </div>
                                </div>--%>
                                 <div class="col-lg-4 form-group" >
                                     <label class="control-label col-lg-12">Settings Type<span class="required"> </span></label>
                                     <div class="col-lg-12">
                                         <telerik:RadDropDownList ID="ddlSettingType" runat="server" Width="100%" DefaultMessage="Please Select Settings Type" OnSelectedIndexChanged="ddlSettingType_SelectedIndexChanged" AutoPostBack="true" Skin="Silk">
                                             <Items>
                                                 <telerik:DropDownListItem Text="Route Settings - Individual" Value="S" />
                                                 <telerik:DropDownListItem Text="Route Settings - Profile" Value="P" />
                                                 <telerik:DropDownListItem Text="Route Customer Settings - Individual" Value="SR" />
                                                 <telerik:DropDownListItem Text="Route Customer Settings - Profile" Value="PR" />
                                             </Items>
                                         </telerik:RadDropDownList>
                                     </div>
                                 </div>

                                <div class="col-lg-4 form-group  mb-4">
                                    <label class="control-label col-lg-12">Settings <span class="required"></span></label>
                                    <div class="col-lg-12">
                                         <telerik:RadComboBox ID="dllSettings" runat="server" EmptyMessage="Select settings name" CausesValidation="false" Width="100%" Filter="Contains" 
                                             OnSelectedIndexChanged="dllSettings_SelectedIndexChanged" AutoPostBack="true" RenderMode="Lightweight" Skin="Silk"></telerik:RadComboBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                ControlToValidate="dllSettings" ErrorMessage="Please Select Settings" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    </div>
                                </div>
                            
                 <asp:PlaceHolder runat="server" ID="Single" Visible="false">
                                <div class="col-lg-4 form-group  mb-4">
                                <label class="control-label col-lg-12">Settings Value <span class="required"></span></label>
                                <div class="col-lg-12">
                                   <telerik:RadComboBox ID="dllSettingsText" runat="server" EmptyMessage="Select settings value" CausesValidation="false" Width="100%" Filter="Contains" Skin="Silk"></telerik:RadComboBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="form"
                                ControlToValidate="dllSettingsText" ErrorMessage="Please Select Settings Value" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                </asp:PlaceHolder>        

                  <asp:PlaceHolder runat="server" ID="Multiple" Visible="false">
                                <div class="col-lg-4 form-group  mb-4">
                                <label class="control-label col-lg-12">Settings Value <span class="required"></span></label>
                                <div class="col-lg-12">
                                   <telerik:RadComboBox ID="dllmultisettings" runat="server" EmptyMessage="Select settings value" CausesValidation="false" Width="100%" Filter="Contains" CheckBoxes="true" AutoPostBack="true" Skin="Silk"></telerik:RadComboBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                ControlToValidate="dllmultisettings" ErrorMessage="Please Select Settings Value" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                </asp:PlaceHolder>   
                    <div class="col-lg-4 form-group mb-4 pt-7">
                        <asp:LinkButton ID="lblPage" runat="server" OnClick="lblPage_Click" CssClass="control-label col-lg-12" Visible="false">
                        </asp:LinkButton>
                        </div>

                    <div class="col-lg-12  mt-5">
                         <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                    <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true" Skin="Material"
                        ID="grvRpt" GridLines="None"
                        ShowFooter="True" AllowSorting="True"
                        OnNeedDataSource="grvRpt_NeedDataSource"
                        AllowFilteringByColumn="true"
                        ClientSettings-Resizing-ClipCellContentOnResize="true"
                        EnableAjaxSkinRendering="true"
                        AllowPaging="true" PageSize="200" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                        <ClientSettings>
                            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                            ShowFooter="false" DataKeyNames="rot_ID"
                            EnableHeaderContextMenu="true">
                            <Columns>

                                <telerik:GridClientSelectColumn HeaderStyle-Width="40px" UniqueName="chkAll">
                                </telerik:GridClientSelectColumn>

                                <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="80px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="50%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="200px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Route" FilterControlWidth="50%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
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
                </div>

            </div>               
                
            </telerik:RadAjaxPanel>
            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                BackColor="Transparent"
                ForeColor="Blue">
                <div class="col-lg-12 text-center mt-5">
                    <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                </div>
            </telerik:RadAjaxLoadingPanel>
     </div>

     <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true" style="height:auto;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-sm fw-bold btn-primary" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                   <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(modalConfirm);">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="height:auto;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="success"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_7" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="height:auto" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Oops..!</h5>
            </div>
            <div class="modal-body">
                <span>Please select atleast one Route.</span>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_7);">Ok</button>
            </div>
        </div>
    </div>
</div>
    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="height:auto;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span>Something went wrong, please try again later.</span>
                </div>
                <div class="modal-footer">
                   <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
