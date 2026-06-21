<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="HRMS_Team4.Admin.Role" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">

			<!-- Breadcrumb -->
			<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
				<div class="my-auto mb-2">
					<h2 class="mb-1">Roles</h2>
					<nav>
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item">
								<a href="index.html"><i class="ti ti-smart-home"></i></a>
							</li>
							<li class="breadcrumb-item">
								Employee
							</li>
							<li class="breadcrumb-item active" aria-current="page">Role</li>
						</ol>
					</nav>
				</div>
				<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
					<div class="me-2 mb-2">
						<div class="dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
								<i class="ti ti-file-export me-1"></i>Export
							</a>
							<ul class="dropdown-menu  dropdown-menu-end p-3">
								<li>
									<a id="exportToPDF" href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
								</li>
								<li>
									<a id="exportToExcel" href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
								</li>
							</ul>
						</div>
					</div>
					<div class="mb-2">
						<a href="#" id="openmod" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>Add Role</a>
					</div>
					<div class="head-icons ms-2">
						<a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
							<i class="ti ti-chevrons-up"></i>
						</a>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			<!-- Performance Indicator list -->
			<div class="card">
				<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
					<h5>Role List</h5>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

						<div class="dropdown me-3">
							<select id="sts" class="form-control" fdprocessedid="tzzt7">
								<option value="select">Status</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>


						<div class="dropdown">
							<select id="opt" class="form-control" fdprocessedid="14s4le">
								<option value="select">Sort By</option>
								<option value="asc">ascending</option>
								<option value="desc">descending</option>
							</select>
						</div>

					</div>
				</div>
				<div class="card-body p-0">
					<div class="custom-datatable-filter table-responsive">
						<div id="table_wrapper" class="dt-container dt-empty-footer"><div class="dt-layout-row"><div class="dt-layout-cell dt-layout-start"><div class="dt-length"><select aria-controls="table" class="dt-input" id="dt-length-0" fdprocessedid="a8add"><option value="5">5</option><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select><label for="dt-length-0"> entries per page</label></div></div><div class="dt-layout-cell dt-layout-end"><div class="dt-search"><label for="dt-search-0">Search:</label><input type="search" class="dt-input" id="dt-search-0" placeholder="" aria-controls="table"></div></div></div><div class="dt-layout-row dt-layout-table"><div class="dt-layout-cell dt-layout-full table-responsive"><table class="table dataTable" id="table" aria-describedby="table_info"><colgroup><col data-dt-column="0"><col data-dt-column="1"><col data-dt-column="2"><col data-dt-column="3"><col data-dt-column="4"><col data-dt-column="5"></colgroup>
							<thead class="thead-light">
								<tr><th scope="col" data-dt-column="0" rowspan="1" colspan="1" class="dt-type-numeric dt-orderable-asc dt-orderable-desc dt-ordering-asc" aria-sort="ascending" aria-label="Id: Activate to invert sorting"><span class="dt-column-title">Id</span><span class="dt-column-order" role="button" tabindex="0"></span></th><th scope="col" data-dt-column="1" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Role Name: Activate to sort"><span class="dt-column-title">Role Name</span><span class="dt-column-order" role="button" tabindex="0"></span></th><th scope="col" data-dt-column="2" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Status: Activate to sort"><span class="dt-column-title">Status</span><span class="dt-column-order" role="button" tabindex="0"></span></th><th scope="col" data-dt-column="3" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="CreatedBy: Activate to sort"><span class="dt-column-title">CreatedBy</span><span class="dt-column-order" role="button" tabindex="0"></span></th><th scope="col" data-dt-column="4" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="ModifiedBy: Activate to sort"><span class="dt-column-title">ModifiedBy</span><span class="dt-column-order" role="button" tabindex="0"></span></th><th scope="col" data-dt-column="5" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label=": Activate to sort"><span class="dt-column-title"></span><span class="dt-column-order" role="button" tabindex="0"></span></th></tr>
							</thead>
							<tbody id="mydata"><tr><td class="dt-type-numeric sorting_1">3</td><td>Admin</td><td><span class="badge bg-success"><i class="ti ti-point-filled me-1"></i>Active</span></td><td>null</td><td>null</td><td><a href="#" class="edit-btn" data-id="3"><i class="ti ti-edit"></i></a> <a href="#" class="delete-btn" data-id="3"><i class="bi bi-trash"></i></a></td></tr><tr><td class="dt-type-numeric sorting_1">8</td><td>Manager</td><td><span class="badge bg-success"><i class="ti ti-point-filled me-1"></i>Active</span></td><td>null</td><td>admin</td><td><a href="#" class="edit-btn" data-id="8"><i class="ti ti-edit"></i></a> <a href="#" class="delete-btn" data-id="8"><i class="bi bi-trash"></i></a></td></tr><tr><td class="dt-type-numeric sorting_1">10</td><td>Employee</td><td><span class="badge bg-success"><i class="ti ti-point-filled me-1"></i>Active</span></td><td>null</td><td>null</td><td><a href="#" class="edit-btn" data-id="10"><i class="ti ti-edit"></i></a> <a href="#" class="delete-btn" data-id="10"><i class="bi bi-trash"></i></a></td></tr><tr><td class="dt-type-numeric sorting_1">11</td><td>Test1</td><td><span class="badge bg-success"><i class="ti ti-point-filled me-1"></i>Active</span></td><td>admin</td><td>null</td><td><a href="#" class="edit-btn" data-id="11"><i class="ti ti-edit"></i></a> <a href="#" class="delete-btn" data-id="11"><i class="bi bi-trash"></i></a></td></tr><tr><td class="dt-type-numeric sorting_1">12</td><td>Test2</td><td><span class="badge bg-danger"><i class="ti ti-point-filled me-1"></i>Inactive</span></td><td>admin</td><td>admin</td><td><a href="#" class="edit-btn" data-id="12"><i class="ti ti-edit"></i></a> <a href="#" class="delete-btn" data-id="12"><i class="bi bi-trash"></i></a></td></tr></tbody>
						<tfoot></tfoot></table></div></div><div class="dt-layout-row"><div class="dt-layout-cell dt-layout-start"><div class="dt-info" aria-live="polite" id="table_info" role="status">Showing 1 to 5 of 5 entries</div></div><div class="dt-layout-cell dt-layout-end"><div class="dt-paging"><nav aria-label="pagination"><button class="dt-paging-button disabled first" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="First" data-dt-idx="first" tabindex="-1">«</button><button class="dt-paging-button disabled previous" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="Previous" data-dt-idx="previous" tabindex="-1">‹</button><button class="dt-paging-button current" role="link" type="button" aria-controls="table" aria-current="page" data-dt-idx="0" fdprocessedid="xf81b">1</button><button class="dt-paging-button disabled next" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="Next" data-dt-idx="next" tabindex="-1">›</button><button class="dt-paging-button disabled last" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="Last" data-dt-idx="last" tabindex="-1">»</button></nav></div></div></div></div>
					</div>
				</div>
			</div>
			<!-- /Performance Indicator list -->

		</div>

</asp:Content>
