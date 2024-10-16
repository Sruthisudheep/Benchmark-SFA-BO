﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditCusHeader.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.AddEditCusHeader" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function Succcess() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
        }
        function Failure() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_5').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                
                                <asp:LinkButton ID="LinkCancel" runat="server" BackColor="#E6E6E6"
                                    Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
                                    CausesValidation="False" OnClick="LinkCancel_Click" />
                                <asp:LinkButton ID="LinkSave" runat="server" BackColor="#009EF7" ValidationGroup="form" OnClick="LinkSave_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed'
                                    CssClass="btn btn-sm fw-bold btn-primary"  CausesValidation="true"/>
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
   </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="background-color:white; padding:20px;">
     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                   
                    <div class="kt-portlet__body">
                        <label class="control-label"></label>
                        <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
                        <div class="col-lg-12 row">
                               <div class="col-lg-4 form-group">

                                <label class="control-label col-lg-12">Code <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtCode" runat="server" CssClass="form-control" width="100%"></telerik:RadTextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ValidationGroup="form"
                                        ControlToValidate="txtCode" ErrorMessage="Please Enter Code" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-6"> Name <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtName" runat="server" CssClass="form-control" width="100%"></telerik:RadTextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ValidationGroup="form"
                                        ControlToValidate="txtName" ErrorMessage="Please Enter Customer Header Name" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                             <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-6">Arabic Name </label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtArabicName" runat="server" CssClass="form-control" width="100%"></telerik:RadTextBox>

                                 <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ValidationGroup="form"
                                        ControlToValidate="txtArabicName" ErrorMessage="Please Enter Arabic Name" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>--%>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 row" style="padding-top:10px;">

                             <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-6">Trade License Number <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtTRN" runat="server" CssClass="form-control" width="100%"></telerik:RadTextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ValidationGroup="form"
                                        ControlToValidate="txtTRN" ErrorMessage="Please Enter" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                         
                            <div class="col-lg-4 form-group">

                                <label class="control-label col-lg-12">Status</label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox runat="server" ID="ddlStatus" width="100%" EnableVirtualScrolling="true" EmptyMessage="Select Status">
                                        <Items>
                                            <telerik:RadComboBoxItem Text="Active" Value="Y" />
                                            <telerik:RadComboBoxItem Text="Inactive" Value="N" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    </div>

    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                    <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-sm fw-bold btn-primary" />
                        </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
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
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Customer Header has been Saved successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->
    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
