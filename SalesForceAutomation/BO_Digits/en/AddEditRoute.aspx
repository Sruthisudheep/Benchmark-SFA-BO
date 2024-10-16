﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditRoute.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.AddEditRoute" %>

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
        function Fail(b) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_6').modal('show');
            $('#fail').text(b);
        }

        function JPSeq() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_2').modal('show');

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">

<div style="border: 1px solid #ccc; padding: 10px; border-radius: 5px;">
        <h9 style="margin-top: 0;">Settings Profile</h9>
        <div style="display: flex; align-items: center;">
            <telerik:RadDropDownList ID="rdProfile" runat="server"  CausesValidation="false" Width="200px" Filter="Contains">
                <Items>
                   <telerik:DropDownListItem Text="Select Profile" Value="0" Selected="true"/>
               </Items>
            </telerik:RadDropDownList>
            <asp:LinkButton ID="ApplyProfile" runat="server"
                Text="Apply" CssClass="btn btn-sm fw-bold btn-secondary"
                CausesValidation="False" OnClick="ApplyProfile_Click" 
                style="margin-left: 10px; height: 30px; padding: 5px 10px; line-height: 20px;" />
        </div>
    </div>
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

        <asp:LinkButton ID="LinkButton2" runat="server"
            Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
            CausesValidation="False" OnClick="LinkButton2_Click" />
        <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="form" OnClick="LinkButton1_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed'
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

    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <br />
                <!--begin::Portlet-->
                <div class="kt-portlet" style="background-color: white; padding: 20px;">



                    <div class="kt-portlet__body">

                        <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>


                        <div class="col-lg-12 row"><b>Basic Info </b></div>
                        <br />
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                            <div class="col-lg-12 row">

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Route Code <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtcode" runat="server" CssClass="form-control" Width="100%" OnTextChanged="txtcode_TextChanged" AutoPostBack="true"></telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                            ControlToValidate="txtcode" ErrorMessage="Please Enter  Code" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                        <asp:Label ID="lblCodeDupli" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Route Name <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtname" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                            ControlToValidate="txtname" ErrorMessage="Please Enter   Name" Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Arabic Name </label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtArabicname" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>

                                    </div>
                                </div>

                            </div>


                            <div class="col-lg-12 row" style="padding-top: 9px;">

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Route Type <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlrotType" runat="server" Width="100%" OnSelectedIndexChanged="ddlrotType_SelectedIndexChanged" AutoPostBack="true" DefaultMessage="Select Route Type">
                                            <Items>
                                                <telerik:DropDownListItem Text="AR" Value="AR" />
                                                <telerik:DropDownListItem Text="MERCHANDISING" Value="MER" />
                                                <%--                                            <telerik:DropDownListItem Text="NORMAL" Value="NR" />--%>
                                                <telerik:DropDownListItem Text="ORDER" Value="OR" />
                                                <telerik:DropDownListItem Text="SALES" Value="SL" />
                                                <telerik:DropDownListItem Text="ORDER & AR" Value="OA" />
                                                <telerik:DropDownListItem Text="FIELD SERVICE" Value="FS" />
                                                <telerik:DropDownListItem Text="DELIVERY" Value="DL" />

                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="form"
                                            ControlToValidate="ddlrotType" ErrorMessage="<br/>Please Enter Type" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Route Password <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtpass" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                            ControlToValidate="txtpass" ErrorMessage="<br/>Please Enter password" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">User Name <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlname" runat="server" EmptyMessage="Select User Name" CausesValidation="false" Width="100%" Filter="Contains"></telerik:RadComboBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="form"
                                            ControlToValidate="ddlname" ErrorMessage="Please select User Name" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-12 row" style="padding-top: 9px;">



                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Device ID </label>
                                    <div class="col-lg-12">
                                        <%--<telerik:RadNumericTextBox ID="txtdevid" runat="server" CssClass="form-control" Width="90%"></telerik:RadNumericTextBox>--%>

                                        <telerik:RadTextBox ID="txtdeviceid" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtdeviceid" ErrorMessage="<br/>Please Enter Device Id" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />--%>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Depot SubArea <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlDepot" runat="server" EmptyMessage="Select Depot SubArea" CausesValidation="false" Width="100%" Filter="Contains"></telerik:RadComboBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="form"
                                            ControlToValidate="ddlDepot" ErrorMessage="Please select Depot SubArea" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Alternative Route Code <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtAltRotCode" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="form"
                                            ControlToValidate="txtAltRotCode" ErrorMessage="Please Enter  Code" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />

                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-12 row" style="padding-top: 9px;">


                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Status <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlStats" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Active" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="Inactive" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>


                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Vehicle ID </label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlVehicleID" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Un-assign" Value="0" />

                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>


                                </div>

                                <asp:PlaceHolder runat="server" ID="pnlProdVisits" Visible="false">

                                    <div class="col-lg-4 form-group">
                                        <label class="control-label col-lg-12">Productive Modes<span class="required"> </span></label>
                                        <div class="col-lg-12">

                                            <%-- Order & AR --%>

                                            <asp:PlaceHolder runat="server" ID="pnlOA" Visible="false">
                                                <telerik:RadComboBox ID="ddlProdVisitsOA" runat="server" DefaultMessage="Please Select" Width="100%" CausesValidation="false">
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="Order" Value="OR" />
                                                        <telerik:RadComboBoxItem Text="AR" Value="AR" Selected="true" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </asp:PlaceHolder>

                                            <%-- Merchandising --%>

                                            <asp:PlaceHolder runat="server" ID="pnlMerch" Visible="false">
                                                <telerik:RadComboBox ID="ddlProdVisitsMerch" runat="server" DefaultMessage="Please Select" Width="100%" CausesValidation="false">
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="Deliver Check" Value="DEC" />
                                                        <telerik:RadComboBoxItem Text="Out Of Stock" Value="OOS" />
                                                        <telerik:RadComboBoxItem Text="Competitor Activities" Value="COA" />
                                                        <telerik:RadComboBoxItem Text="Customer Complaints" Value="CUC" />
                                                        <telerik:RadComboBoxItem Text="Item Availability" Value="ITA" />
                                                        <telerik:RadComboBoxItem Text="Item Pricing" Value="ITP" />

                                                        <telerik:RadComboBoxItem Text="Customer Inventory" Value="CUI" />
                                                        <telerik:RadComboBoxItem Text="Survey" Value="SUY" Selected="true" />
                                                        <telerik:RadComboBoxItem Text="Display Agreements" Value="DIA" />
                                                        <telerik:RadComboBoxItem Text="Task" Value="TAS" />
                                                        <telerik:RadComboBoxItem Text="Image Capture" Value="IMC" />

                                                        <telerik:RadComboBoxItem Text="Customer Activity" Value="CUA" />
                                                        <telerik:RadComboBoxItem Text="Customer Request" Value="CUR" />
                                                        <telerik:RadComboBoxItem Text="Scheduled Return Request" Value="SRR" />
                                                        <telerik:RadComboBoxItem Text="Dispute Note Request" Value="DIS" />
                                                        <telerik:RadComboBoxItem Text="Credit Note request" Value="CNR" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </asp:PlaceHolder>


                                            <%-- Field Services --%>

                                            <asp:PlaceHolder runat="server" ID="pnlFS" Visible="false">
                                                <telerik:RadComboBox ID="ddlProdVisitsFS" runat="server" DefaultMessage="Please Select" Width="100%" CausesValidation="false">
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="Asset Tracking" Value="AT" />
                                                        <telerik:RadComboBoxItem Text="Service Request" Value="SR" />
                                                        <telerik:RadComboBoxItem Text="Service Job" Value="SJ" Selected="true" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </asp:PlaceHolder>


                                        </div>
                                    </div>

                                </asp:PlaceHolder>

                            </div>
                        </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>
                        <br />

                        <div class="col-lg-12 row"><b>General Settings </b></div>
                        <br />
                        <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel4">
                            <div class="col-lg-12 row">

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Routine Check<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlRC" runat="server" Width="100%"
                                            EmptyMessage="Select Routine Check">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Endorsement<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlEndorsement" runat="server" Width="100%"
                                            DefaultMessage="Please Select ">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Inventory Out Mode <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="rdInvOutMode" runat="server" Width="100%" DefaultMessage="Please Select" RenderMode="Lightweight">
                                            <Items>
                                                <telerik:DropDownListItem Text="Print" Value="prt" Selected="true" />
                                                <telerik:DropDownListItem Text="PDF" Value="pdf" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-12 row" style="padding-top: 9px;">

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Customer Trans Out Mode <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="rdCusOutMode" runat="server" DefaultMessage="Please Select" Width="100%" RenderMode="Lightweight">
                                            <Items>
                                                <telerik:DropDownListItem Text="Print" Value="prt" Selected="true" />
                                                <telerik:DropDownListItem Text="PDF" Value="pdf" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Odometer<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlodometer" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Opportunity Creation<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlEnOpt" runat="server" Width="100%"
                                            DefaultMessage="Please Select ">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-12 row" style="padding-top: 9px;">

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Helper<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddEnableHelper" runat="server" Width="100%" OnSelectedIndexChanged="SelectedIndexChanged_EnableHelper" CausesValidation="false" AutoPostBack="true">
                                            <Items>
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />

                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddEnableHelper" ErrorMessage="Please select" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <asp:PlaceHolder runat="server" ID="aspHelper1" Visible="false">
                                    <div class="col-lg-4 form-group">
                                        <label class="control-label col-lg-12">Helper 1</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlHelper1" runat="server" Width="100%" EmptyMessage="Please select" OnSelectedIndexChanged="ddlHelper1_SelectedIndexChanged" CausesValidation="false" AutoPostBack="true"></telerik:RadComboBox>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="aspHelper2" Visible="false">
                                    <div class="col-lg-4 form-group">
                                        <label class="control-label col-lg-12">Helper 2</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlHelper2" runat="server" EmptyMessage="Please select" Width="100%"></telerik:RadComboBox>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            </div>

                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Payment Mode<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlpaymode" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select Payment Mode">
                                            <Items>

                                                <telerik:RadComboBoxItem Text="OP" Value="OP" />
                                                <telerik:RadComboBoxItem Text="POS" Value="POS" />
                                                <telerik:RadComboBoxItem Text="Hard Cash" Value="HC" />

                                            </Items>
                                        </telerik:RadComboBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ValidationGroup="form"
                                            ControlToValidate="ddlpaymode" ErrorMessage="Please Select Payment Mode" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />

                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Is Advance Payment<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="rdAdvPay" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Allow settlement Discrepancy<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlstlmnt" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                            </div>


                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Settlement from<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlSettlefrom" runat="server" Width="100%"
                                            DefaultMessage="Please Select ">
                                            <Items>
                                                <telerik:DropDownListItem Text="App" Value="A" />
                                                <telerik:DropDownListItem Text="Web" Value="W" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>


                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enforce Scheduled Visit</label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlSchVisit" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>



                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enforce JourneyPlan Seq</label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlJPlanSeq" runat="server" Width="100%" OnSelectedIndexChanged="ddlJPlanSeq_SelectedIndexChanged" AutoPostBack="true">
                                            <Items>
                                                <telerik:RadComboBoxItem Text="Yes" Value="Y" />
                                                <telerik:RadComboBoxItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </div>
                                </div>




                                <%-- <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-12">Misc Activities Name <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtTransName" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="form"
                                                                ControlToValidate="txtTransName" ErrorMessage="Please Enter Trans Name" Display="Dynamic" ForeColor="Red"
                                                                SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>
                            </div>--%>
                            </div>

                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Petty Cash</label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlPettycash" runat="server" Width="100%" OnSelectedIndexChanged="ddlPettycash_SelectedIndexChanged" CausesValidation="false" AutoPostBack="true">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <asp:PlaceHolder runat="server" ID="pnlPettyLimit" Visible="false">
                                    <div class="col-lg-4 form-group">
                                        <label class="control-label col-lg-12">Petty Cash Limit</label>
                                        <div class="col-lg-12">
                                            <telerik:RadNumericTextBox ID="txtPettyLimit" runat="server" CssClass="form-control" Width="100%"></telerik:RadNumericTextBox>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>


                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Asset Tracking</label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlAssetTracking" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>


                            </div>


                            <div class="col-lg-12 row" style="padding-top: 9px;">

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Service Request</label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlServiceReq" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Vehicle<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlEnbVehicle" runat="server" DefaultMessage="Please Select" Width="100%" CausesValidation="false">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>

                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Is Vehicle Number Mandatory<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlIsVehicleNo" runat="server" DefaultMessage="Please Select" Width="100%" CausesValidation="false">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>

                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Variance Limit</label>
                                    <div class="col-lg-12">
                                        <telerik:RadNumericTextBox ID="txtvarlimit" runat="server" CssClass="form-control" Width="100%"></telerik:RadNumericTextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Fencing Radius</label>
                                    <div class="col-lg-12">
                                        <telerik:RadNumericTextBox ID="rdFence" runat="server" CssClass="form-control" Width="100%"></telerik:RadNumericTextBox>
                                    </div>
                                </div>
                                    <div class="col-lg-4 form-group">
        <label class="control-label col-lg-12">Enable logout after end day<span class="required"> </span></label>
        <div class="col-lg-12">
            <telerik:RadDropDownList ID="ddlenablogout" runat="server" DefaultMessage="Please Select" Width="100%" CausesValidation="false">
                <Items>
                    <telerik:DropDownListItem Text="Yes" Value="Y" />
                    <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                </Items>
            </telerik:RadDropDownList>

        </div>
    </div>

                            </div>

                              <div class="col-lg-12 row" style="padding-top: 9px;">

  <div class="col-lg-4 form-group">
      <label class="control-label col-lg-12">ERP_Cash_Bank <span class="required"></span></label>
      <div class="col-lg-12">
          <telerik:RadTextBox ID="txtERPCashBank" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
              ControlToValidate="txtERPCashBank" ErrorMessage="Please Enter" ForeColor="Red" Display="Dynamic"
              SetFocusOnError="True"></asp:RequiredFieldValidator><br />

      </div>
  </div>
                                    <div class="col-lg-4 form-group">
      <label class="control-label col-lg-12">ERP_Cashier_Bank <span class="required"></span></label>
      <div class="col-lg-12">
          <telerik:RadTextBox ID="txtERPCashierBank" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="form"
              ControlToValidate="txtERPCashierBank" ErrorMessage="Please Enter" ForeColor="Red" Display="Dynamic"
              SetFocusOnError="True"></asp:RequiredFieldValidator><br />

      </div>
  </div>

                                  </div>

                        </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>
                        <br />

                        <div class="col-lg-12 row"><b>Transactional Settings </b></div>
                        <br />
                        <telerik:RadAjaxPanel ID="RadAjaxPanel4" runat="server" LoadingPanelID="RadAjaxLoadingPanel5">
                            <div class="col-lg-12 row ">
                                <span class="min-w-50px fw-semibold text-gray-800 " style="padding-bottom: 10px;"><b>Van Stock</b></span>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Good Return End Stock<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlis" runat="server" Width="100%"
                                            EmptyMessage="Select UnLoad">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Van to Van<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="rcbVantoVan" runat="server" Width="100%"
                                            DefaultMessage="Please Select ">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Van to Van Approval<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlVavApproval" runat="server" Width="100%"
                                            DefaultMessage="Please Select ">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Van Stock Excess Allow<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlVanstockexcessallow" runat="server" Width="100%"
                                            EmptyMessage="Select Van Stock Excess Allow">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Non-Van Stock Allow<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlNonvanstockallow" runat="server" Width="100%"
                                            EmptyMessage="Select Non-Van Stock Excess Allow">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">System Stock Enable<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlsysstkenable" runat="server" Width="100%"
                                            EmptyMessage="Select System Stock Enable">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>




                            </div>


                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Bad Return End Stock</label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlattribute" runat="server" Width="100%"
                                            EmptyMessage="Select Bad Return Upload">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Weekend Days<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlWeekendDays" runat="server" Width="100%"
                                            EmptyMessage="Select Weekend Days">
                                            <Items>

                                                <telerik:DropDownListItem Text="Sunday" Value="Sun" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Inventory Transactions</label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlInvTrans" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select Inventort Transactions">
                                            <Items>
                                                <telerik:RadComboBoxItem Text="Load In" Value="LI" />
                                                <telerik:RadComboBoxItem Text="Load Out" Value="LO" />
                                                <telerik:RadComboBoxItem Text="Load Transfer" Value="LT" />
                                                <telerik:RadComboBoxItem Text="Load Request" Value="LR" />
                                                <telerik:RadComboBoxItem Text="Van Transfer" Value="VT" />
                                                <telerik:RadComboBoxItem Text="Inventory Verification" Value="IV" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Customer Transactions</label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlCusTrans" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select Inventort Transactions">
                                            <Items>
                                                <telerik:RadComboBoxItem Text="Sales Job" Value="SJ" />
                                                <telerik:RadComboBoxItem Text="Order Request" Value="OR" />
                                                <telerik:RadComboBoxItem Text="Account Receivable" Value="AR" />
                                                <telerik:RadComboBoxItem Text="Advance Payment" Value="AD" />
                                                <telerik:RadComboBoxItem Text="Field Service" Value="FS" />

                                            </Items>
                                        </telerik:RadComboBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Merchandising Transactions</label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlMerchTrans" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select Inventort Transactions">
                                            <Items>
                                                <telerik:RadComboBoxItem Text="Deliver Check" Value="DEC" />
                                                <telerik:RadComboBoxItem Text="Out Of Stock" Value="OOS" />
                                                <telerik:RadComboBoxItem Text="Competitor Activities" Value="COA" />
                                                <telerik:RadComboBoxItem Text="Customer Complaints" Value="CUC" />
                                                <telerik:RadComboBoxItem Text="Item Availability" Value="ITA" />
                                                <telerik:RadComboBoxItem Text="Item Pricing" Value="ITP" />

                                                <telerik:RadComboBoxItem Text="Customer Inventory" Value="CUI" />
                                                <telerik:RadComboBoxItem Text="Survey" Value="SUY" />
                                                <telerik:RadComboBoxItem Text="Display Agreements" Value="DIA" />
                                                <telerik:RadComboBoxItem Text="Task" Value="TAS" />
                                                <telerik:RadComboBoxItem Text="Image Capture" Value="IMC" />

                                                <telerik:RadComboBoxItem Text="Customer Activity" Value="CUA" />
                                                <telerik:RadComboBoxItem Text="Customer Request" Value="CUR" />
                                                <telerik:RadComboBoxItem Text="Scheduled Return Request" Value="SRR" />
                                                <telerik:RadComboBoxItem Text="Dispute Note Request" Value="DIS" />
                                                <telerik:RadComboBoxItem Text="Credit Note request" Value="CNR" />

                                            </Items>
                                        </telerik:RadComboBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Field Service Transactions</label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlFSTrans" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select Inventort Transactions">
                                            <Items>
                                                <telerik:RadComboBoxItem Text="Asset Tracking" Value="AT" />
                                                <telerik:RadComboBoxItem Text="Service Request" Value="SR" />
                                                <telerik:RadComboBoxItem Text="Service Job" Value="SJ" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable AR Manual Allocation<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlARManAalloc" runat="server" Width="100%"
                                            EmptyMessage="Select Load Request">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Inventory Reconfirm Approval<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlInvReconfAppr" runat="server" Width="100%"
                                            EmptyMessage="Select an option">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-12 row " style="padding-top: 9px;">
                                <span class="min-w-50px fw-semibold text-gray-800" style="padding-bottom: 10px; padding-top: 10px;"><b>Load </b></span>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Load Request<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlLR" runat="server" Width="100%"
                                            EmptyMessage="Select Load Request">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable loadIn Sign<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlLIS" runat="server" Width="100%"
                                            EmptyMessage="Select Enable LoadIn Sign">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">LoadIn Edit<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlLEdit" runat="server" Width="100%"
                                            EmptyMessage="Select LoadIn Edit">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Suggested Load Req<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="rcbsugloreq" runat="server" Width="100%"
                                            EmptyMessage="Please Select ">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Load Rejection<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="rcbLodRej" runat="server" Width="100%"
                                            DefaultMessage="Please Select ">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Load Transfer<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlLT" runat="server" Width="100%"
                                            EmptyMessage="Select Load Transfer">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 row" style="padding-top: 9px;">

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable Load Transfer Sign<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlLTS" runat="server" Width="100%"
                                            EmptyMessage="Select Enable Load Transfer Sign">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Enable LoadOut Sign<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlLOS" runat="server" Width="100%"
                                            EmptyMessage="Select Enable LoadOut Sign">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">LoadOut Edit<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlLOEdit" runat="server" Width="100%"
                                            EmptyMessage="Select LoadOut Edit">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>


                            </div>
                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">LoadOut Excess Allow<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlLOExcess" runat="server" Width="100%"
                                            EmptyMessage="Select LoadOut Excess Allow">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Load Transfer Approval<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlLTApproval" runat="server" Width="100%"
                                            EmptyMessage="Select LoadTransfer Approval">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>


                            </div>
                        </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel5" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>
                        <telerik:RadAjaxPanel ID="RadAjaxPanel5" runat="server" LoadingPanelID="RadAjaxLoadingPanel6">
                            <div class="col-lg-12 row" style="padding-top: 9px;">
                                <span class="min-w-50px fw-semibold text-gray-800 " style="padding-bottom: 10px; padding-top: 10px;"><b>Return </b></span>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Return Type<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="rcbreturnType" runat="server" Width="100%"
                                            DefaultMessage="Please Select ">
                                            <Items>
                                                <telerik:DropDownListItem Text="Normal" Value="NR" Selected="true" />
                                                <telerik:DropDownListItem Text="Controlled" Value="CR" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Open Return Image<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlOpnRtnImg" runat="server" Width="100%"
                                            EmptyMessage="Select Open Return Image">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>


                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Restricted Return Image<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlResRtnImg" runat="server" Width="100%"
                                            EmptyMessage="Select Open Return Image">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                            </div>










                            <div class="col-lg-12 row" style="padding-top: 9px;">




                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Scheduled Return Image<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlSchRtnImg" runat="server" Width="100%"
                                            EmptyMessage="Select Scheduled Return Image">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Open Return Approval</label>
                                    <div class="col-lg-12">

                                        <telerik:RadComboBox ID="ddlOpnRtnApl" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select Restricted Return Approval">
                                            <Items>

                                                <telerik:RadComboBoxItem Text="Good Return" Value="GR" />
                                                <telerik:RadComboBoxItem Text="Bad Return" Value="BR" />

                                            </Items>
                                        </telerik:RadComboBox>
                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="form"
                                                                ControlToValidate="ddlOpnRtnApl" ErrorMessage="Please Select Open Return Aproval" ForeColor="Red" Display="Dynamic"
                                                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />--%>
                                    </div>
                                </div>



                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Restricted Return Approval</label>
                                    <div class="col-lg-12">

                                        <telerik:RadComboBox ID="ddlResRtnApl" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select Restricted Return Approval">
                                            <Items>

                                                <telerik:RadComboBoxItem Text="Good Return" Value="GR" />
                                                <telerik:RadComboBoxItem Text="Bad Return" Value="BR" />

                                            </Items>
                                        </telerik:RadComboBox>
                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="form"
                                                                ControlToValidate="ddlResRtnApl" ErrorMessage="Please Select Open Return Aproval" ForeColor="Red" Display="Dynamic"
                                                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />--%>
                                    </div>
                                </div>


                            </div>


                            <div class="col-lg-12 row" style="padding-top: 9px;">


                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">GR Image</label>
                                    <div class="col-lg-12">

                                        <telerik:RadComboBox ID="ddlGRImage" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select GR Image">
                                            <Items>

                                                <telerik:RadComboBoxItem Text="Open" Value="OP" />
                                                <telerik:RadComboBoxItem Text="Restricted" Value="RS" />
                                                <telerik:RadComboBoxItem Text="Scheduled" Value="SC" />

                                            </Items>
                                        </telerik:RadComboBox>
                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="form"
                                                            ControlToValidate="ddlResRtnApl" ErrorMessage="Please Select Open Return Aproval" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />--%>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">GR Image Mandatory</label>
                                    <div class="col-lg-12">

                                        <telerik:RadComboBox ID="ddlGRImgMand" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select GR Image">
                                            <Items>

                                                <telerik:RadComboBoxItem Text="Open" Value="OP" />
                                                <telerik:RadComboBoxItem Text="Restricted" Value="RE" />
                                                <telerik:RadComboBoxItem Text="Scheduled" Value="SC" />

                                            </Items>
                                        </telerik:RadComboBox>
                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="form"
                                                            ControlToValidate="ddlResRtnApl" ErrorMessage="Please Select Open Return Aproval" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />--%>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">BR Image Mandatory</label>
                                    <div class="col-lg-12">

                                        <telerik:RadComboBox ID="ddlBRimgMand" runat="server" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select GR Image">
                                            <Items>

                                                <telerik:RadComboBoxItem Text="Open" Value="OP" />
                                                <telerik:RadComboBoxItem Text="Restricted" Value="RE" />
                                                <telerik:RadComboBoxItem Text="Scheduled" Value="SC" />

                                            </Items>
                                        </telerik:RadComboBox>
                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="form"
                                                            ControlToValidate="ddlResRtnApl" ErrorMessage="Please Select Open Return Aproval" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />--%>
                                    </div>
                                </div>



                                <div class="col-lg-4 form-group" hidden="hidden">
                                    <label class="control-label col-lg-12">Enforce Journey Plan <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlenforcejp" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="No" Value="N" Selected="true" />
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />

                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                            </div>
                            <asp:PlaceHolder runat="server" ID="phERPlocs">
                                <div class="col-lg-12 row" style="padding-top: 9px;">
                                    <div class="col-lg-4 form-group">
                                        <label class="control-label col-lg-12">ERP Inventory Request Location</label>
                                        <div class="col-lg-12">
                                            <telerik:RadTextBox ID="txtInvReqLoc" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                            <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="form"
                                            ControlToValidate="txtcode" ErrorMessage="Please Enter  Code" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                        <asp:Label ID="Label2" runat="server" Visible="false" ForeColor="Red"></asp:Label>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 form-group">
                                        <label class="control-label col-lg-12">ERP Inventory Location</label>
                                        <div class="col-lg-12">
                                            <telerik:RadTextBox ID="txtInvLoc" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                            <%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                            ControlToValidate="txtcode" ErrorMessage="Please Enter  Code" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                        <asp:Label ID="Label1" runat="server" Visible="false" ForeColor="Red"></asp:Label>--%>
                                        </div>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                        </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel6" EnableEmbeddedSkins="false"
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
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" style="height: auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
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
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

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
                    <%-- <button data-dismiss="modal" class="btn btn-sm fw-bold btn-secondary">Ok</button>--%>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->

    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_6" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span id="fail"></span>
                </div>
                <div class="modal-footer">
                    <%-- <button data-dismiss="modal" class="btn btn-sm fw-bold btn-secondary">Ok</button>--%>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_6);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->

    <div class="modal fade" id="kt_modal_1_2" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Remember..</h5>
                </div>
                <div class="modal-body">
                    <span>If you enabled journey plan seq, you should apply distinct sequence for each customer for the same weekseq within route.
                     Otherwise, the system will automatically assign a sequence number.
                    </span>
                </div>
                <div class="modal-footer">
                    <%-- <button data-dismiss="modal" class="btn btn-sm fw-bold btn-secondary">Ok</button>--%>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_2);">Ok</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
