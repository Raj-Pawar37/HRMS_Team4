<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="HRMS_Team4.Admin.EmployeeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <!-- Breadcrumb -->
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h6 class="fw-medium d-inline-flex align-items-center mb-3 mb-sm-0">
                <a href="#">Employee Details
                </a>
            </h6>
        </div>
        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
            <div class="head-icons ms-2">
                <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                    <i class="ti ti-chevrons-up"></i>
                </a>
            </div>
        </div>
    </div>
    <!-- /Breadcrumb -->

    <div class="row">
        <div class="col-xl-4 ">
            <div class="card card-bg-1">
                <div class="card-body p-0">
                    <span class="avatar avatar-xl avatar-rounded border border-2 border-white m-auto d-flex mb-2">
                        <img src="/uploads/user/639178005423390129_dog1.jpg" class="w-auto h-auto" alt="Img">
                    </span>
                    <div class="text-center px-3 pb-3 border-bottom">
                        <div class="mb-3">
                            <h5 class="d-flex align-items-center justify-content-center mb-1">admin a<i class="ti ti-discount-check-filled text-success ms-1"></i></h5>
                            <span class="badge badge-soft-dark fw-medium me-2">
                                <i class="ti ti-point-filled me-1"></i>Software Developer
                            </span>
                        </div>
                        <div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <span class="d-inline-flex align-items-center">
                                    <i class="ti ti-id me-2"></i>
                                    Client ID
                                </span>
                                <p class="text-dark">1</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <span class="d-inline-flex align-items-center">
                                    <i class="ti ti-star me-2"></i>
                                    Department
                                </span>
                                <p class="text-dark">IT</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <span class="d-inline-flex align-items-center">
                                    <i class="ti ti-calendar-check me-2"></i>
                                    Date Of Join
                                </span>
                                <p class="text-dark">11/02/2025</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between">
                                <span class="d-inline-flex align-items-center">
                                    <i class="ti ti-calendar-check me-2"></i>
                                    Report Office
                                </span>
                                <div class="d-flex align-items-center">
                                    <p class="text-gray-9 mb-0">35</p>
                                </div>
                            </div>
                            <div class="row gx-2 mt-3">
                                <div class="col-12">
                                    <div>
                                        <a href="#" class="btn btn-dark w-100" data-bs-toggle="modal" data-bs-target="#edit_employee"><i class="ti ti-edit me-1"></i>Edit Info</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p-3 border-bottom">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <h6>Basic information</h6>
                            <a href="javascript:void(0);" class="btn btn-icon btn-sm" data-bs-toggle="modal" data-bs-target="#edit_employee"><i class="ti ti-edit"></i></a>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <span class="d-inline-flex align-items-center">
                                <i class="ti ti-phone me-2"></i>
                                Phone
                            </span>
                            <p class="text-dark">1222222222</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <span class="d-inline-flex align-items-center">
                                <i class="ti ti-mail-check me-2"></i>
                                Email
                            </span>
                            <a href="javascript:void(0);" class="text-info d-inline-flex align-items-center">admin@gmail.com<i class="ti ti-copy text-dark ms-2"></i></a>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <span class="d-inline-flex align-items-center">
                                <i class="ti ti-gender-male me-2"></i>
                                Gender
                            </span>
                            <p class="text-dark text-end">Male</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <span class="d-inline-flex align-items-center">
                                <i class="ti ti-cake me-2"></i>
                                Birdthday
                            </span>
                            <p class="text-dark text-end">11/02/2025</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <span class="d-inline-flex align-items-center">
                                <i class="ti ti-map-pin-check me-2"></i>
                                Address
                            </span>
                            <p class="text-dark text-end">Mumbai</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <div>
                <div class="tab-content custom-accordion-items">
                    <div class="tab-pane active show" id="bottom-justified-tab1" role="tabpanel">
                        <div class="accordion accordions-items-seperate" id="accordionExample">
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingOne">
                                    <div class="accordion-button">
                                        <div class="d-flex align-items-center flex-fill">
                                            <h5>About Employee</h5>
                                            <a href="#" class="btn btn-sm btn-icon ms-auto" data-bs-toggle="modal" data-bs-target="#edit_employee"><i class="ti ti-edit"></i></a>
                                            <a href="#" class="d-flex align-items-center collapsed collapse-arrow" data-bs-toggle="collapse" data-bs-target="#primaryBorderOne" aria-expanded="false" aria-controls="primaryBorderOne">
                                                <i class="ti ti-chevron-down fs-18"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="primaryBorderOne" class="accordion-collapse collapse show border-top" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="accordion-body mt-2">
                                        I am Software developer 	
												
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingTwo">
                                    <div class="accordion-button">
                                        <div class="d-flex align-items-center flex-fill justify-content-between">
                                            <h5 class="mb-0">Bank Information</h5>

                                            <div class="d-flex align-items-center gap-1">

                                                <a href="#" class="btn btn-icon btn-sm"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#editbankDetailsModal">
                                                    <i class="ti ti-plus"></i>
                                                </a>


                                                <a href="#"
                                                    class="btn btn-icon btn-sm collapse-arrow"
                                                    data-bs-toggle="collapse"
                                                    data-bs-target="#primaryBorderTwo"
                                                    aria-expanded="false"
                                                    aria-controls="primaryBorderTwo">
                                                    <i class="ti ti-chevron-down fs-18"></i>
                                                </a>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="primaryBorderTwo" class="accordion-collapse collapse border-top" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">

                                        <asp:Repeater ID="rptBankDetails" runat="server" OnItemCommand="rptBankDetails_ItemCommand">
                                            <ItemTemplate>

                                                <div class="row mb-3">

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">Bank Id
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Eval("BankDetailId") %>
                                                        </h6>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">Bank Name
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Eval("BankName") %>
                                                        </h6>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">Bank Account No
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Eval("AccountNumber") %>
                                                        </h6>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">IFSC Code
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Eval("IFSCCode") %>
                                                        </h6>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">Branch
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Eval("BranchName") %>
                                                        </h6>
                                                    </div>


                                                    <div class="col-md-2 text-end">
                                                        <asp:LinkButton ID="btnEditBank"
                                                            runat="server"
                                                            CssClass="btn btn-icon btn-sm"
                                                            CommandName="EditBank"
                                                            CommandArgument='<%# Eval("BankDetailId") %>'>
                                                            <i class="ti ti-edit"></i>
                                                        </asp:LinkButton>

                                                        <asp:LinkButton ID="btnDeleteBank"
                                                            runat="server"
                                                            CssClass="btn btn-icon btn-sm text-danger"
                                                            CommandName="DeleteBank"
                                                            CommandArgument='<%# Eval("BankDetailId") %>'
                                                            OnClientClick="return confirm('Are you sure you want to delete this bank detail?');">
                                                            <i class="ti ti-trash"></i>
                                                        </asp:LinkButton>
                                                    </div>

                                                </div>

                                                <hr />

                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>

                                </div>
                            </div>

                            <div class="accordion-item">
                                <div class="accordion-header" id="headingThree">
                                    <div class="accordion-button">
                                        <div class="d-flex align-items-center justify-content-between flex-fill">
                                            <h5 class="mb-0">Family Information</h5>

                                            <div class="d-flex align-items-center gap-1">

                                                <!-- Add -->
                                                <a href="#" class="btn btn-icon btn-sm"
                                                    id="addFamilyDetails"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#editFamilyDetailsModal">
                                                    <i class="ti ti-plus"></i>
                                                </a>


                                                <!-- Collapse -->
                                                <a href="#"
                                                    class="btn btn-icon btn-sm collapse-arrow"
                                                    data-bs-toggle="collapse"
                                                    data-bs-target="#primaryBorderThree"
                                                    aria-expanded="false"
                                                    aria-controls="primaryBorderThree">
                                                    <i class="ti ti-chevron-down fs-18"></i>
                                                </a>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="primaryBorderThree" class="accordion-collapse collapse border-top" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">

                                        <asp:Repeater ID="rptFamilyDetails" runat="server" OnItemCommand="rptFamilyDetails_ItemCommand">
                                            <ItemTemplate>

                                                <div class="row mb-3">

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">Family Id
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Eval("FamilyDetailId") %>
                                                        </h6>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">Name
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Eval("Name") %>
                                                        </h6>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">Relationship
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Eval("Relation") %>
                                                        </h6>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">Date of Birth
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Convert.ToDateTime(Eval("DateOfBirth")).ToString("dd/MM/yyyy") %>
                                                        </h6>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <span class="d-inline-flex align-items-center">Phone
                                                        </span>
                                                        <h6 class="d-flex align-items-center fw-medium mt-1">
                                                            <%# Eval("phone") %>
                                                        </h6>
                                                    </div>

                                                    <div class="col-md-2 text-end">

                                                    <asp:LinkButton ID="btnEditFamily"
                                                        runat="server"
                                                        CssClass="btn btn-icon btn-sm"
                                                        CommandName="EditFamily"
                                                        CommandArgument='<%# Eval("FamilyDetailId") %>'>
                                                        <i class="ti ti-edit"></i>
                                                    </asp:LinkButton>

                                                    <asp:LinkButton ID="btnDeleteFamily"
                                                        runat="server"
                                                        CssClass="btn btn-icon btn-sm text-danger"
                                                        CommandName="DeleteFamily"
                                                        CommandArgument='<%# Eval("FamilyDetailId") %>'
                                                        OnClientClick="return confirm('Are you sure?');">
                                                        <i class="ti ti-trash"></i>
                                                    </asp:LinkButton>

                                                </div>

                                                </div>

                                                <hr />

                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="accordion-item">
                                        <div class="row">
                                            <div class="accordion-header" id="headingFour">
                                                <div class="accordion-button">
                                                    <div class="d-flex align-items-center justify-content-between flex-fill">
                                                        <h5 class="mb-0">Education Details</h5>

                                                        <div class="d-flex align-items-center gap-1">

                                                            <!-- Add -->
                                                            <a href="#" class="btn btn-icon btn-sm"
                                                                id="editEducationDetails"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#editeducationDetailsModal">
                                                                <i class="ti ti-plus"></i>
                                                            </a>


                                                            <!-- Collapse -->
                                                            <a href="#"
                                                                class="btn btn-icon btn-sm collapse-arrow"
                                                                data-bs-toggle="collapse"
                                                                data-bs-target="#primaryBorderFour"
                                                                aria-expanded="false"
                                                                aria-controls="primaryBorderFour">
                                                                <i class="ti ti-chevron-down fs-18"></i>
                                                            </a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="primaryBorderFour" class="accordion-collapse collapse border-top" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <asp:Repeater ID="rptEducationDetails" runat="server" OnItemCommand="rptEducationDetails_ItemCommand">
                                                        <ItemTemplate>
                                                            <div class="mb-3">
                                                                <div class="d-flex align-items-center justify-content-between">
                                                                    <div>
                                                                        <span class="d-inline-flex align-items-center fw-normal">
                                                                            <%# Container.ItemIndex + 1 %> - <%# Eval("UniversityName") %>
                                                                            </span>

                                                                        <h6 class="d-flex align-items-center mt-1">
                                                                            <%# Eval("EducationType") %>
                                                                            </h6>
                                                                    </div>

                                                                    <p class="text-dark mb-0">
                                                                        <%# Convert.ToDateTime(Eval("startdate")).ToString("dd/MM/yyyy") %>
                            -
                           
                                                                        <%# Convert.ToDateTime(Eval("enddate")).ToString("dd/MM/yyyy") %>
                                                                    </p>

                                                                    <div>
                                                                        <asp:LinkButton ID="btnEditEducation"
                                                                            runat="server"
                                                                            CssClass="btn btn-icon btn-sm"
                                                                            CommandName="EditEducation"
                                                                            CommandArgument='<%# Eval("EducationDetailsId") %>'>
                                                                            <i class="ti ti-edit"></i>
                                                                        </asp:LinkButton>

                                                                        <asp:LinkButton ID="btnDeleteEducation"
                                                                            runat="server"
                                                                            CssClass="btn btn-icon btn-sm text-danger"
                                                                            CommandName="DeleteEducation"
                                                                            CommandArgument='<%# Eval("EducationDetailsId") %>'
                                                                            OnClientClick="return confirm('Are you sure?');">
                                                                            <i class="ti ti-trash"></i>
                                                                        </asp:LinkButton>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="accordion-item">
                                        <div class="row">
                                            <div class="accordion-header" id="headingFive">
                                                <div class="accordion-button">
                                                    <div class="d-flex align-items-center justify-content-between flex-fill">
                                                        <h5 class="mb-0">Experience</h5>

                                                        <div class="d-flex align-items-center gap-1">

                                                            <!-- Add -->
                                                            <a href="#" class="btn btn-icon btn-sm"
                                                                id="addExperienceDetails"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#editexperienceDetailsModal">
                                                                <i class="ti ti-plus"></i>
                                                            </a>


                                                            <!-- Collapse -->
                                                            <a href="#"
                                                                class="btn btn-icon btn-sm collapse-arrow"
                                                                data-bs-toggle="collapse"
                                                                data-bs-target="#primaryBorderFive"
                                                                aria-expanded="false"
                                                                aria-controls="primaryBorderFive">
                                                                <i class="ti ti-chevron-down fs-18"></i>
                                                            </a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="primaryBorderFive" class="accordion-collapse collapse border-top" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <asp:Repeater ID="rptExperienceDetails" runat="server" OnItemCommand="rptExperienceDetails_ItemCommand">
                                                        <ItemTemplate>

                                                            <div class="mb-3">
                                                                <div class="d-flex align-items-center justify-content-between">
                                                                    <div>
                                                                        <h6 class="d-inline-flex align-items-center fw-medium">
                                                                            <%# Container.ItemIndex + 1 %> . <%# Eval("CompanyName") %>
                                                                        </h6>

                                                                        <span class="d-flex align-items-center badge bg-secondary-transparent mt-1">
                                                                            <i class="ti ti-point-filled me-1"></i>
                                                                            <%# Eval("DesignationName") %>
                                                                        </span>
                                                                    </div>

                                                                    <p class="text-dark mb-0">
                                                                        <%# Eval("FromDate") == DBNull.Value ? "" : Convert.ToDateTime(Eval("FromDate")).ToString("dd/MM/yyyy") %>
                        -
                       
                                                                        <%# Eval("ToDate") == DBNull.Value ? "" : Convert.ToDateTime(Eval("ToDate")).ToString("dd/MM/yyyy") %>
                                                                    </p>

                                                                    <div>
                                                                        <asp:LinkButton ID="btnEditExperience"
                                                                            runat="server"
                                                                            CssClass="btn btn-icon btn-sm"
                                                                            CommandName="EditExperience"
                                                                            CommandArgument='<%# Eval("ExperienceId") %>'>
                                                                            <i class="ti ti-edit"></i>
                                                                        </asp:LinkButton>

                                                                        <asp:LinkButton ID="btnDeleteExperience"
                                                                            runat="server"
                                                                            CssClass="btn btn-icon btn-sm text-danger"
                                                                            CommandName="DeleteExperience"
                                                                            CommandArgument='<%# Eval("ExperienceId") %>'
                                                                            OnClientClick="return confirm('Are you sure?');">
                                                                            <i class="ti ti-trash"></i>
                                                                        </asp:LinkButton>
                                                                    </div>

                                                                </div>
                                                            </div>

                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


















    <%--MODALS--%>
    <%--MODALS--%>
    <%--MODALS--%>

















    <div class="modal fade" id="edit_employee" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="d-flex align-items-center">
                        <h4 class="modal-title me-2">Edit Employee</h4>
                    </div>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="contact-grids-tab">
                    <ul class="nav nav-underline" id="myTab2" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="info-tab3" data-bs-toggle="tab" data-bs-target="#basic-info3" type="button" role="tab" aria-selected="true">Basic Information</button>
                        </li>
                    </ul>
                </div>
                <div class="tab-content" id="myTabContent2">
                    <div class="tab-pane fade show active" id="basic-info3" role="tabpanel" aria-labelledby="info-tab3" tabindex="0">
                        <div class="modal-body pb-0 ">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">
                                        <div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">
                                            <img src="assets/img/users/user-13.jpg" alt="img" class="rounded-circle">
                                        </div>
                                        <input type="hidden" id="editUserId" name="UserId" value="1">

                                        <div class="profile-upload">
                                            <div class="mb-2">
                                                <h6 class="mb-1">Upload Profile Image</h6>
                                                <p class="fs-12">Image should be below 4 mb</p>
                                            </div>
                                            <div class="profile-uploader d-flex align-items-center">
                                                <div class="drag-upload-btn btn btn-sm btn-primary me-2">
                                                    Upload
															<input type="file" class="form-control image-sign" multiple="" id="editProfilePicture" name="ProfilePicture" value="/uploads/user/639178005423390129_dog1.jpg">
                                                </div>
                                                <a href="javascript:void(0);" class="btn btn-light btn-sm">Cancel</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">First Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="FirstName" name="FirstName" value="admin">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Last Name</label>
                                        <input type="text" class="form-control" id="editLastName" name="LastName" value="a">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Date of Birth<span class="text-danger"> *</span></label>
                                        <div class="input-icon-end position-relative">
                                            <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" id="editDOB" name="DateOfBirth" value="11/02/2025 00:00:00">
                                            <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Email <span class="text-danger">*</span></label>
                                        <input type="email" class="form-control" id="editEmail" name="Email" value="admin@gmail.com">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Phone Number <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="editPhoneNumber" name="PhoneNumber" value="1222222222">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Address <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="editAddress" name="Address" value="Mumbai">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">About <span class="text-danger">*</span></label>
                                        <textarea class="form-control" rows="3" id="editAboutEmployee" name="AboutEmployee">																																																																																																																																																												I am Software developer 
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-primary" id="saveEditProfile">Save </button>
                        </div>

                    </div>
                </div>


            </div>
        </div>
    </div>

    <div class="modal fade" id="editexperienceDetailsModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">Company Information</h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>

                <div class="modal-body pb-0">
                    <div class="row">

                        <asp:HiddenField ID="hfExperienceId" runat="server" />
                        <asp:HiddenField ID="hfExperienceUserId" runat="server" Value="40" />

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Previous Company Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Designation <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtDesignationName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Start Date <span class="text-danger">*</span></label>
                                <div class="input-icon-end position-relative">
                                    <asp:TextBox
                                        ID="txtFromDate"
                                        runat="server"
                                        CssClass="form-control datetimepicker"
                                        placeholder="dd/MM/yyyy">
                                    </asp:TextBox>

                                    <span class="input-icon-addon">
                                        <i class="ti ti-calendar text-gray-7"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">End Date <span class="text-danger">*</span></label>
                                <div class="input-icon-end position-relative">
                                    <asp:TextBox
                                        ID="txtToDate"
                                        runat="server"
                                        CssClass="form-control datetimepicker"
                                        placeholder="dd/MM/yyyy">
                                    </asp:TextBox>

                                    <span class="input-icon-addon">
                                        <i class="ti ti-calendar text-gray-7"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-check-label d-flex align-items-center mt-0">
                                    <asp:CheckBox
                                        ID="chkCurrentlyWorking"
                                        runat="server"
                                        CssClass="form-check-input mt-0 me-2" />

                                    <span class="text-dark">Check if you are currently working here
                                    </span>
                                </label>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white border me-2" data-bs-dismiss="modal">
                        Cancel
                    </button>

                    <asp:Button
                        ID="btnSaveExperienceDetails"
                        runat="server"
                        Text="Save"
                        CssClass="btn btn-primary"
                        OnClick="btnSaveExperienceDetails_Click" />
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="editeducationDetailsModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">Education Information</h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>

                <div class="modal-body pb-0">
                    <div class="row">

                        <asp:HiddenField ID="hfEducationDetailsId" runat="server" />
                        <asp:HiddenField ID="hfEducationUserId" runat="server" Value="40" />

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Institution Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtUniversityName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Course <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtEducationType" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Start Date <span class="text-danger">*</span></label>
                                <div class="input-icon-end position-relative">
                                    <asp:TextBox
                                        ID="txtEducationStartDate"
                                        runat="server"
                                        CssClass="form-control datetimepicker"
                                        placeholder="dd/MM/yyyy">
                                    </asp:TextBox>

                                    <span class="input-icon-addon">
                                        <i class="ti ti-calendar text-gray-7"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">End Date <span class="text-danger">*</span></label>
                                <div class="input-icon-end position-relative">
                                    <asp:TextBox
                                        ID="txtEducationEndDate"
                                        runat="server"
                                        CssClass="form-control datetimepicker"
                                        placeholder="dd/MM/yyyy">
                                    </asp:TextBox>

                                    <span class="input-icon-addon">
                                        <i class="ti ti-calendar text-gray-7"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white border me-2" data-bs-dismiss="modal">Cancel</button>

                    <asp:Button
                        ID="btnSaveEducationDetails"
                        runat="server"
                        Text="Save"
                        CssClass="btn btn-primary"
                        OnClick="btnSaveEducationDetails_Click" />
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="editFamilyDetailsModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">Family Information</h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>

                <div class="modal-body pb-0">
                    <div class="row">

                        <asp:HiddenField ID="hfFamilyDetailId" runat="server" />
                        <asp:HiddenField ID="hfFamilyUserId" runat="server" Value="40" />

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtFamilyName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Relationship <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtRelation" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Phone <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Date Of Birth <span class="text-danger">*</span></label>
                                <div class="input-icon-end position-relative">
                                    <asp:TextBox
                                        ID="txtDateOfBirth"
                                        runat="server"
                                        CssClass="form-control datetimepicker"
                                        placeholder="dd/MM/yyyy">
                                    </asp:TextBox>

                                    <span class="input-icon-addon">
                                        <i class="ti ti-calendar text-gray-7"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white border me-2" data-bs-dismiss="modal">
                        Cancel
                    </button>

                    <asp:Button
                        ID="btnSaveFamilyDetails"
                        runat="server"
                        Text="Save"
                        CssClass="btn btn-primary"
                        OnClick="btnSaveFamilyDetails_Click" />
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="editbankDetailsModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">Bank Details</h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>

                <div class="modal-body pb-0">
                    <div class="row">

                        <asp:HiddenField ID="hfBankUserId" runat="server" Value="40" />
                        <asp:HiddenField ID="hfBankDetailId" runat="server" />

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Bank Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Bank Account No <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">IFSC Code <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtIFSCCode" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Branch Address <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtBranchName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white border me-2" data-bs-dismiss="modal">Cancel</button>

                    <asp:Button
                        ID="btnSaveBankDetails"
                        runat="server"
                        Text="Save"
                        CssClass="btn btn-primary"
                        OnClick="btnSaveBankDetails_Click" />
                </div>

            </div>
        </div>
    </div>





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</asp:Content>
