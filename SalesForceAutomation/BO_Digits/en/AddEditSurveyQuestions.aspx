﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditSurveyQuestions.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.AddEditSurveyQuestions" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script>
        function Confim() {
            $('#kt_modal_1_3').modal('show');
        }
        function successModal() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_4').modal('show');
        }
        function failedModal(res) {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_5').modal('show');
            $('#failres').text(res);
        }
        function Delete() {
            $('#kt_modal_1_7').modal('show');
        }
        function deleteSucces() {
            $('#kt_modal_1_7').modal('hide');
            $('#kt_modal_1_8').modal('show');
        }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
     <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel5">
          <a class="btn btn-sm fw-bold btn-secondary" href="ListSurveyQuestions.aspx">Cancel
                                    </a> &nbsp;
                                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Save" OnClick="LinkButton4_Click" CausesValidation="true" ValidationGroup="frm"></asp:LinkButton>
                               
                                   
                            </telerik:RadAjaxPanel>

                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel5" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center">
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
                 
                       
                            <%--<h6 class="kt-portlet__head-title">Question Number: 
                                <telerik:RadLabel runat="server" ID="labelqno" Text=""></telerik:RadLabel>
                            </h6>
                       --%>
                   
                    <!--begin::Forkt-->

                    <div class="kt-portlet__body">
                        <div class="col-lg-12 row">

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Question <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtQuestion" runat="server" CssClass="form-control" RenderMode="Lightweight" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="frm"
                                        ControlToValidate="txtQuestion" ErrorMessage="Please Enter Question" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Type <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    
                                    <telerik:RadComboBox ID="txtType" runat="server" Width="100%" EmptyMessage="Select Type" RenderMode="Lightweight" Enabled="true" OnSelectedIndexChanged="txtType_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="frm"
                                        ControlToValidate="txtType" ErrorMessage="Please choose Type" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Comments Needed ? <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlComments" runat="server" Width="100%" RenderMode="Native">
                                        <Items>
                                            <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                            <telerik:DropDownListItem Text="No" Value="N" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </div>
                            </div>
                        </div>
                        <!--end::Form-->
                    </div>
                    <asp:PlaceHolder ID="pnls" runat="server" Visible="false">
                        <!--Detail header-->
                        <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">Add Answers
                                </h3>
                            </div>
                        </div>
                        <!--End Detail header-->
                        <!--Detail Body-->
                        <div class="kt-portlet__body">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel4">
                                <div class="col-lg-12 row">

                                    <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                        <label class="control-label col-lg-12">Answer <span class="required"> </span></label>
                                        <div class="col-lg-12">
                                            <telerik:RadTextBox ID="txtAnswer" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                                ControlToValidate="txtAnswer" ErrorMessage="Please Enter Answer" Display="Dynamic" ForeColor="Red"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 form-group" style="padding-bottom: 15px;">
                                        <label class="control-label col-lg-12">Order <span class="required"> </span></label>
                                        <div class="col-lg-12">
                                            <telerik:RadNumericTextBox ID="txtOrder" runat="server" CssClass="form-control" Width="100%" NumberFormat-AllowRounding="false" DecimalDigits="0" ></telerik:RadNumericTextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                                ControlToValidate="txtOrder" ErrorMessage="Please Enter Order" Display="Dynamic" ForeColor="Red"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                <asp:RegularExpressionValidator 
    ID="regexValidatorTxtOrder" 
    runat="server" 
    ControlToValidate="txtOrder" 
    ValidationExpression="^\d+$" 
    ErrorMessage="Please enter a valid integer."
    Display="Dynamic" 
    ForeColor="Red"  ValidationGroup="form">
</asp:RegularExpressionValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 form-group" style="padding-bottom: 15px;" hidden="hidden">
                                        <label class="control-label col-lg-12">Status <span class="required"> </span></label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlStatuss" runat="server" Width="100%" RenderMode="Native" Visible="false">
                                                <Items>
                                                    <telerik:RadComboBoxItem Text="Active" Value="Y" Selected="true" />
                                                    <telerik:RadComboBoxItem Text="Inactive" Value="N" />
                                                </Items>
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-5 form-group" style="padding-bottom: 15px; padding-left: 15px;">
                                        <div class="control-label col-lg-12">
                                            <div class="col-lg-12">
                                                <asp:LinkButton ID="ADD" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="ADD" OnClick="ADD_Click" CausesValidation="true" ValidationGroup="form"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>


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
                                            ShowFooter="false" DataKeyNames="ID"
                                            EnableHeaderContextMenu="true">
                                            <Columns>

                                                <telerik:GridBoundColumn DataField="ID" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="ID" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="s" Visible="false">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Answer" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Answer" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="Answer">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Order" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Order" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="Order">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="Status">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Mode" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Mode" Display="false" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="Mode">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Delete" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                    <ItemTemplate>
                                                        <asp:ImageButton CommandName="Delete" ID="RadImageButton3" Visible="true" AlternateText="Delete" runat="server"
                                                            ImageUrl="../assets/media/svg/general/Trash.svg"></asp:ImageButton>
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
                                <!--End Detail Body-->
                                <!--Delete Anser-->


                                <!--end::Portlet-->
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                        </div>
                    </asp:PlaceHolder>
                </div>
            </div>
        </div>
    </div>
        </div>
    <!--begin::ValidationModal-->
    <div class="modal fade" id="kt_modal_1_3" tabindex="-1" role="dialog" style="height:auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to save ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="LinkButton1_Click">
                                                    Save
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_3);">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::ValidationModal-->

    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" style="height:auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Question has been updated successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">Ok</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

    <!--begin::FailureModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" style="height:auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span id="failres"></span>
                </div>
                <div class="modal-footer">
                   <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailureModal-->

    <!--begin::ValidationModal-->
    <div class="modal fade" id="kt_modal_1_7" tabindex="-1" role="dialog" style="height:auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to delete ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="LinkButton2_Click">
                                                    Yes
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                  <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_7);">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::ValidationModal-->

    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_8" tabindex="-1" role="dialog" style="height:auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Answer has been deleted successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" CssClass="btn btn-sm fw-bold btn-secondary">Ok</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->
</asp:Content>
