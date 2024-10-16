﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditUsers.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.AddEditUsers" %>

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
    </script>
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <asp:LinkButton ID="lnkCancel" runat="server"
            Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
            CausesValidation="False" OnClick="lnkCancel_Click" />
        <asp:LinkButton ID="lnkSave" runat="server" ValidationGroup="form" OnClick="lnkSave_Click"
            UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed'
            CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" />

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
    <div class="card-body" style="background-color: white; padding: 20px;">
        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!--begin::Portlet-->
                    <div class="kt-portlet">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                        <div class="kt-portlet__body">
                            <label class="control-label"></label>
                            <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
                            <div class="col-lg-12 row">

                                <div class="col-lg-4 form-group">

                                    <label class="control-label col-lg-12">Code <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtCode" runat="server" CssClass="form-control" Width="100%" OnTextChanged="txtCode_TextChanged" AutoPostBack="true"></telerik:RadTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="txtCode" ErrorMessage="Please Enter Code" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                            <asp:Label ID="lblCodeDupli" runat="server" Visible="false" ForeColor="Red"></asp:Label>

                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-6">User Name <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtName" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="txtName" ErrorMessage="Please Enter Name" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-6">Arabic Name <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtArabic" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="txtArabic" ErrorMessage="Please Enter Arabic Name" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-12 row" style="padding-top: 10px;">

                                <div class="col-lg-4 form-group">

                                    <label class="control-label col-lg-12">Password <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtPass" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="txtPass" ErrorMessage="Please Enter Password" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">

                                    <label class="control-label col-lg-12">Status</label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox runat="server" ID="ddlStatus" Width="100%" EnableVirtualScrolling="true" EmptyMessage="Select Status">
                                            <Items>
                                                <telerik:RadComboBoxItem Text="Active" Value="Y" />
                                                <telerik:RadComboBoxItem Text="Inactive" Value="N" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </div>
                                </div>

                                   <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">App User Type <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="rdappUsrtype" runat="server" Width="100%" DefaultMessage="Select Type" OnSelectedIndexChanged="rdappUsrtype_SelectedIndexChanged" AutoPostBack="true"  RenderMode="Lightweight">
                                            <Items>
                                                <telerik:DropDownListItem Text="SFA" Value="SFA" />
                                                <telerik:DropDownListItem Text="Inventory" Value="INV"  />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>


                             

                            </div>
                               <asp:PlaceHolder runat="server" ID="Tracking" Visible="false">
                              <div class="col-lg-12 row" style="padding-top: 10px;">

                                   <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Tracking Needed <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlTracking" runat="server" Width="100%" DefaultMessage="Please Select">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>


                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Tracking Duration(In Seconds)<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadNumericTextBox ID="rdDuration" NumberFormat-DecimalDigits="0" runat="server" CssClass="form-control" Width="100%"></telerik:RadNumericTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                            ControlToValidate="rdDuration" ErrorMessage="<br/>Please Enter Tracking Duration" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    </div>
                                </div>
                                  </div>
                                   </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" ID="Stoke" Visible="false">
                                 <div class="col-lg-12 row" style="padding-top: 10px;">

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Is Instant Stock Count <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="rdInsStockCount" runat="server" Width="100%" DefaultMessage="Please Select">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y"  />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">User Stores<span class="required"></span></label>
                                    <div class="col-lg-12">
                                         <telerik:RadComboBox ID="rdStore" runat="server" EmptyMessage="Select Stores" Filter="Contains" Width="100%" RenderMode="Lightweight" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" AutoPostBack="true"></telerik:RadComboBox>
                                    </div>
                                </div>
                                     </div>
                                        </asp:PlaceHolder>
                            </div>

                  <div class="col-lg-12 row" style="padding-top: 10px;">

                      
                      </div>



                        
                        </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
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
    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" style="height:auto"  data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
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
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" style="height:auto"  aria-labelledby="exampleModalLabel" aria-hidden="true">
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

    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" style="height:auto"  aria-labelledby="exampleModalLabel" aria-hidden="true">
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
