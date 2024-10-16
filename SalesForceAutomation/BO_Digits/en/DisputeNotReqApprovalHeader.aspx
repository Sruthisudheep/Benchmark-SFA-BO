﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="DisputeNotReqApprovalHeader.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.DisputeNotReqApprovalHeader" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function successModal(a) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#success').text(a);
        }
        function failedModal(b) {
            $('#kt_modal_1_5').modal('show');
            $('#failtext').text(b);
        }
        function Delete() {
            $('#kt_modal_1_7').modal('show');
        }
        function deleteSucces(c) {
            $('#kt_modal_1_7').modal('hide');
            $('#kt_modal_1_8').modal('show');
            $('#delsuccess').text(c);
        }

    </script>
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
                <asp:LinkButton ID="btnActionTaken" runat="server" CssClass="nav-link btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4 me-1" OnClick="btnActionTaken_Click"></asp:LinkButton>
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="btnApproved" runat="server" CssClass="nav-link btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4" OnClick="btnApproved_Click"> </asp:LinkButton>
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="btnRejected" runat="server" CssClass="nav-link btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4" OnClick="btnRejected_Click"> </asp:LinkButton>
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
                    <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                    <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="btnPending">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                    <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                    <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="btnApproved">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                    <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="btnRejected">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                    <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="lnkFilter">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                    <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="DateCheck">
                <UpdatedControls>

                    <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                    <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="grvRpt">
                <UpdatedControls>

                    <telerik:AjaxUpdatedControl ControlID="btnAll" />
                    <telerik:AjaxUpdatedControl ControlID="btnPending" />
                    <telerik:AjaxUpdatedControl ControlID="btnApproved" />
                    <telerik:AjaxUpdatedControl ControlID="btnRejected" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>

    </telerik:RadAjaxManagerProxy>

    <div class="card-body p-8" style="background-color: white;">
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">

            <%-- Filter starts --%>
            <div class="col-lg-12 row" style="padding-bottom: 10px;">
                <div class="col-lg-12 ">
                    <b style="margin-right: 10px;">
                        <asp:Label Text="Need to consider Date filter" runat="server"></asp:Label>
                    </b>
                    <asp:CheckBox ID="DateCheck" runat="server" Height="15px" Width="15px" OnCheckedChanged="DateCheck_CheckedChanged" AutoPostBack="true" Checked="false" Style="margin-bottom: 0;" />
                </div>
            </div>
            <div class="col-lg-12 row mb-4">
                <div class="col-lg-2">
                    <label class="control-label col-lg-12">From Date</label>
                    <div class="col-lg-12">
                        <telerik:RadDatePicker RenderMode="Lightweight" ID="rdfromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" OnSelectedDateChanged="rdfromDate_SelectedDateChanged" AutoPostBack="true">
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdfromDate"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-lg-2">
                    <label class="control-label col-lg-12">To Date</label>
                    <div class="col-lg-12">
                        <telerik:RadDatePicker RenderMode="Lightweight" ID="rdendDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" OnSelectedDateChanged="rdendDate_SelectedDateChanged" AutoPostBack="true">
                        </telerik:RadDatePicker>
                        <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdendDate" ControlToCompare="rdfromDate" ErrorMessage="End date must be greater"
                            Display="Dynamic" ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdendDate"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-lg-2">
                    <label class="control-label col-lg-12">Route</label>
                    <div class="col-lg-12">
                        <telerik:RadComboBox ID="rdRoute" runat="server" EmptyMessage="Select Route" Filter="Contains" Width="100%" RenderMode="Lightweight" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" AutoPostBack="true"></telerik:RadComboBox>

                    </div>
                </div>
                <div class="col-lg-2">
                    <label class="control-label col-lg-12">Customer</label>
                    <div class="col-lg-12">
                        <telerik:RadComboBox ID="rdCustomer" runat="server" EmptyMessage="Select Customer" Filter="Contains" Width="100%" RenderMode="Lightweight" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" AutoPostBack="true"></telerik:RadComboBox>

                    </div>

                </div>

                <%--   <div class="col-lg-2">
                                   <label class="control-label col-lg-12">Status</label>
                                   <div class="col-lg-12">
                                       <telerik:RadComboBox ID="rdStatus" runat="server" EmptyMessage="Select Status" Filter="Contains" Width="100%" RenderMode="Lightweight" AutoPostBack="true">
                                           <Items>                                               
                                               <telerik:RadComboBoxItem Text="Pending" Value="P" Selected="true"/>
                                               <telerik:RadComboBoxItem Text="Approved" Value="A" />
                                              
                                           </Items>
                                       </telerik:RadComboBox>
                                   </div>
                               </div>
                --%>

                <div class="col-lg-2 pt-5 mt-2" style="text-align: center;">
                    <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" OnClick="lnkFilter_Click">
                                                    Apply Filter
                    </asp:LinkButton>
                </div>

            </div>

            <%-- Filter ends --%>

            <%-- Grid starts --%>
            <div class="kt-form kt-form--label-right">
                <div class="kt-portlet__body">
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
                        AllowPaging="true" PageSize="50" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                        <ClientSettings>
                            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                            ShowFooter="false" DataKeyNames="drh_ID"
                            EnableHeaderContextMenu="true">
                            <Columns>

                                <telerik:GridTemplateColumn HeaderStyle-Width="50px" AllowFiltering="false" HeaderText="Detail" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Detail">
                                    <ItemTemplate>
                                        <asp:ImageButton CommandName="Detail" ID="Detail" Visible="true" AlternateText="Detail" runat="server"
                                            ImageUrl="../assets/media/icons/details.png"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>



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


                                <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Customer Code" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="180px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Customer" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                </telerik:GridBoundColumn>



                                <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="User" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                </telerik:GridBoundColumn>


                                <telerik:GridBoundColumn DataField="drh_TransID" AllowFiltering="true" HeaderStyle-Width="200px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Request ID" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="rrh_RequestNumber">
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="drh_Amount" AllowFiltering="true" HeaderStyle-Width="100px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Amount" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="drh_Amount">
                                    <ItemStyle HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="TransTime" AllowFiltering="true" HeaderStyle-Width="150px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Date" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="TransTime">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="drh_DisputeType" AllowFiltering="true" HeaderStyle-Width="100px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Dispute Type" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="drh_DisputeType" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DisputeType" AllowFiltering="true" HeaderStyle-Width="100px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Dispute Type" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="DisputeType">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="drh_OtherInfo" AllowFiltering="true" HeaderStyle-Width="150px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Other Info" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="drh_OtherInfo">
                                </telerik:GridBoundColumn>


                                <telerik:GridBoundColumn DataField="drh_Image" AllowFiltering="true" HeaderStyle-Width="100px" Display="false"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="drh_Image">
                                </telerik:GridBoundColumn>

                                <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Images" UniqueName="Images" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                    <ItemTemplate>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>


                                <telerik:GridBoundColumn DataField="drh_Remarks" AllowFiltering="true" HeaderStyle-Width="150px"
                                    HeaderStyle-Font-Size="Smaller" HeaderText="Remarks" FilterControlWidth="100%"
                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                    HeaderStyle-Font-Bold="true" UniqueName="drh_Remarks">
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

            <%-- Grid ends --%>

            <%-- Dispatch button starts --%>

            <div class="col-lg-12 pt-4" style="display: flex; justify-content: flex-end;">


                <div class="col-lg-1 pt-4">
                </div>

                <div class="col-lg-2 ps-12">
                </div>
                <div class="col-lg-2">
                </div>

            </div>

            <%-- Dispatch button ends --%>
        </telerik:RadAjaxPanel>
        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
            BackColor="Transparent"
            ForeColor="Blue">
            <div class="col-lg-12 text-center mt-5">
                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
            </div>
        </telerik:RadAjaxLoadingPanel>
    </div>


    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" style="height: auto;" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
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
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
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
    <div class="modal fade" id="kt_modal_1_4" style="height: auto;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <div class="modal fade" id="kt_modal_1_5" style="height: auto;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span id="failtext"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
    <!--begin::DeleteValidationModal-->


    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_8" style="height: auto;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="delsuccess"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" CssClass="btn btn-sm fw-bold btn-secondary">Ok</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
