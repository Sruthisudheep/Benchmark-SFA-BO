﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="JourneyPlanSeqApproval.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.JourneyPlanSeqApproval" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">

        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function Reject() {
            $('#kt_modal_1_2').modal('show');
        }
        function successModal(a) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_2').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#success').text(a);
        }
        function failedModal(b) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_2').modal('hide');
            $('#kt_modal_1_5').modal('show');
            $('#failtext').text(b);
        }
        function failedModals() {


            $('#kt_modal_1_7').modal('show');


        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">

        <asp:LinkButton ID="lnkReject" Width="100px" runat="server"
            Text="Reject" CssClass="btn btn-sm fw-bold btn-secondary"
            CausesValidation="False" OnClick="lnkReject_Click" />
        <asp:LinkButton ID="lnkApprove" Width="100px" runat="server" ValidationGroup="form" OnClick="lnkApprove_Click" UseSubmitBehavior="false" Text="Approve"
            CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" />
    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-12 row mb-4">
        <div class="col-lg-2">
            <label class="control-label col-lg-12">Status</label>
            <div class="col-lg-12">
                <telerik:RadComboBox ID="rdStatus" runat="server" EmptyMessage="Select Status" Filter="Contains" Width="100%" RenderMode="Lightweight" AutoPostBack="true" OnSelectedIndexChanged="rdStatus_SelectedIndexChanged">
                    <Items>
                        <telerik:RadComboBoxItem Text="Pending" Value="P" Selected="true" />
                        <telerik:RadComboBoxItem Text="Approved" Value="A" />
                        <telerik:RadComboBoxItem Text="Rejected" Value="R" />
                        <telerik:RadComboBoxItem Text="Cancel" Value="CN" />

                    </Items>
                </telerik:RadComboBox>
            </div>
        </div>

        <div class="col-lg-2 pt-5 mt-2" style="text-align: center;">
            <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" OnClick="lnkFilter_Click">
                                                    Apply Filter
            </asp:LinkButton>
        </div>
    </div>
    <div class="card-body" style="background-color: white; padding: 20px;">

        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!--begin::Portlet-->
                    <div class="kt-portlet">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
                                    <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

                                    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                    <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                        ID="grvRpt" GridLines="None"
                                        ShowFooter="True" AllowSorting="True"
                                        OnNeedDataSource="grvRpt_NeedDataSource"
                                        OnItemCommand="grvRpt_ItemCommand"
                                        OnItemDataBound="grvRpt_ItemDataBound"
                                        AllowFilteringByColumn="true"
                                        ClientSettings-Resizing-ClipCellContentOnResize="true"
                                        EnableAjaxSkinRendering="true"
                                        AllowPaging="true" PageSize="10" CellSpacing="0">
                                        <ClientSettings>
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                        </ClientSettings>
                                        <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                            ShowFooter="false" DataKeyNames="jps_ID"
                                            EnableHeaderContextMenu="true">
                                            <Columns>
                                                <telerik:GridClientSelectColumn HeaderStyle-Width="30px" UniqueName="chkAll"></telerik:GridClientSelectColumn>


                                                <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Route" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Route" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="Route">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Customer Code" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Customer" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Requested Date" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="jps_PrevSeq" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Last Visited Seq" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="jps_PrevSeq">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="jps_CurrentSeq" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Current Seq" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="jps_CurrentSeq">
                                                </telerik:GridBoundColumn>


                                                <telerik:GridBoundColumn DataField="rsn_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Reason" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="rsn_Name">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="Status">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ApprovedBy" AllowFiltering="true" HeaderStyle-Width="150px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Action Taken By" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="ApprovedBy">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ApprovedDate" AllowFiltering="true" HeaderStyle-Width="150px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Action Taken Date" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="ApprovedDate">
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
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" style="height: auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to approve/reject..??
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
                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(modalConfirm);">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="success"></span>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
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
    <!--end::SuccessModal-->
    <!--end::SuccessModal-->
    <div class="modal fade modal-center" id="kt_modal_1_2" tabindex="-1" role="dialog" style="height: auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Reject">Are you sure you want to Reject..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel4" runat="server" LoadingPanelID="RadAjaxLoadingPanel4">
                        <asp:LinkButton ID="btnRejectSave" runat="server" Text="Yes" OnClick="btnRejectSave_Click" CssClass="btn btn-sm fw-bold btn-primary" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
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

    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
