<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DailyReport.aspx.cs" Inherits="HRMS_Team4.Admin.DailyReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">

				<!-- Breadcrumb -->
				<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
					<div class="my-auto mb-2">
						<h2 class="mb-1">Daily Report</h2>
						<nav>
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item">
									<a href="index.html"><i class="ti ti-smart-home"></i></a>
								</li>
								<li class="breadcrumb-item">
									HR
								</li>
								<li class="breadcrumb-item active" aria-current="page">Daily Report</li>
							</ol>
						</nav>
					</div>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
						<div class="mb-2">
							<div class="dropdown">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									<i class="ti ti-file-export me-1"></i>Export
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
									</li>
								</ul>
							</div>
							
						</div>
						<div class="head-icons ms-2">
							<a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
								<i class="ti ti-chevrons-up"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /Breadcrumb -->
                <div class="row">
                    <div class="col-xl-6 d-flex">
                        <div class="row flex-fill">
                            <!-- Total Companies -->
                            <div class="col-lg-6 col-md-6 d-flex">
                                <div class="card flex-fill">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div>
                                                <p class="fs-12 fw-normal mb-1 text-truncate">Total Present</p>
                                                <h4>
    <asp:Label ID="lblTotalPresent" runat="server"></asp:Label>
</h4>
                                            </div>
											<div class="leave-report-icon">
												<a href="#"><span class="p-2 border border-primary bg-transparent-primary rounded-circle d-flex align-items-center justify-content-center"><i class="ti ti-user-check text-primary"></i></span></a>
											</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Total Companies -->

                             <!-- Total Companies -->
                             <div class="col-lg-6 col-md-6 d-flex">
                                <div class="card flex-fill">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div>
                                                <p class="fs-12 fw-normal mb-1 text-truncate">Completed Tasks</p>
                                               <h4>
    <asp:Label ID="lblCompletedTasks" runat="server"></asp:Label>
</h4>
                                            </div>
											<div class="leave-report-icon">
												<a href="#"><span class="p-2 border border-success bg-transparent-success rounded-circle d-flex align-items-center justify-content-center"><i class="ti ti-subtask text-success"></i></span></a>
											</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Total Companies -->

                            <!-- Inactive Companies -->
                             <div class="col-lg-6 col-md-6 d-flex">
                                <div class="card flex-fill">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div>
                                                <p class="fs-12 fw-normal mb-1 text-truncate">Total Absent</p>
                                               <h4>
    <asp:Label ID="lblTotalAbsent" runat="server"></asp:Label>
</h4>
                                            </div>
											<div class="leave-report-icon">
												<a href="#"><span class="p-2 border border-danger bg-transparent-danger rounded-circle d-flex align-items-center justify-content-center"><i class="ti ti-user-x text-danger"></i></span></a>
											</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Inactive Companies -->

                            <!-- Company Location -->
                             <div class="col-lg-6 col-md-6 d-flex">
                                <div class="card flex-fill">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div>
                                                <p class="fs-12 fw-normal mb-1 text-truncate">Pending Tasks</p>
                                                <h4>
    <asp:Label ID="lblPendingTasks" runat="server"></asp:Label>
</h4>
                                            </div>
											<div class="leave-report-icon">
												<a href="#"><span class="p-2 border border-skyblue bg-transparent-skyblue rounded-circle d-flex align-items-center justify-content-center"><i class="ti ti-user-x text-skyblue"></i></span></a>
											</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Company Location -->
                        </div>
                    </div>
					<div class="col-xl-6 d-flex">
                        <div class="card flex-fill">
							<div class="card-header border-0 pb-0">
								<div class="d-flex flex-wrap justify-content-between align-items-center">
									<div class="d-flex align-items-center ">
										<span class="me-2"><i class="ti ti-chart-bar text-danger"></i></span>
										<h5>Daily Attendance</h5>
									</div>
									<div class="d-flex align-items-center">
										<p class="d-inline-flex align-items-center me-2 mb-0">
											<i class="ti ti-square-filled fs-12 text-success me-2"></i>
											Present
										</p>
										<p class="d-inline-flex align-items-center mb-0 me-2">
											<i class="ti ti-square-filled fs-12 text-danger me-2"></i>
											Absent
										</p>
									</div>
									<div class="dropdown">
										<a href="javascript:void(0);" class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
											This Year
										</a>
										<ul class="dropdown-menu  dropdown-menu-end p-2">
											<li>
												<a href="javascript:void(0);" class="dropdown-item rounded-1">2024</a>
											</li>
											<li>
												<a href="javascript:void(0);" class="dropdown-item rounded-1">2023</a>
											</li>
											<li>
												<a href="javascript:void(0);" class="dropdown-item rounded-1">2022</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
                            <div class="card-body py-0">
								<div id="daily-report" style="min-height: 145px;"><div id="apexcharts65hyyzhz" class="apexcharts-canvas apexcharts65hyyzhz apexcharts-theme-" style="width: 734px; height: 130px;"><svg id="SvgjsSvg1081" width="734" height="130" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)"><foreignObject x="0" y="0" width="734" height="130"><div class="apexcharts-legend" xmlns="http://www.w3.org/1999/xhtml" style="max-height: 65px;"></div><style type="text/css">
      .apexcharts-flip-y {
        transform: scaleY(-1) translateY(-100%);
        transform-origin: top;
        transform-box: fill-box;
      }
      .apexcharts-flip-x {
        transform: scaleX(-1);
        transform-origin: center;
        transform-box: fill-box;
      }
      .apexcharts-legend {
        display: flex;
        overflow: auto;
        padding: 0 10px;
      }
      .apexcharts-legend.apx-legend-position-bottom, .apexcharts-legend.apx-legend-position-top {
        flex-wrap: wrap
      }
      .apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left {
        flex-direction: column;
        bottom: 0;
      }
      .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-left, .apexcharts-legend.apx-legend-position-top.apexcharts-align-left, .apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left {
        justify-content: flex-start;
      }
      .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-center, .apexcharts-legend.apx-legend-position-top.apexcharts-align-center {
        justify-content: center;
      }
      .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-right, .apexcharts-legend.apx-legend-position-top.apexcharts-align-right {
        justify-content: flex-end;
      }
      .apexcharts-legend-series {
        cursor: pointer;
        line-height: normal;
        display: flex;
        align-items: center;
      }
      .apexcharts-legend-text {
        position: relative;
        font-size: 14px;
      }
      .apexcharts-legend-text *, .apexcharts-legend-marker * {
        pointer-events: none;
      }
      .apexcharts-legend-marker {
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        margin-right: 1px;
      }

      .apexcharts-legend-series.apexcharts-no-click {
        cursor: auto;
      }
      .apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series {
        display: none !important;
      }
      .apexcharts-inactive-legend {
        opacity: 0.45;
      }</style></foreignObject><rect id="SvgjsRect1086" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG1091" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g><g id="SvgjsG1092" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g><g id="SvgjsG1138" class="apexcharts-yaxis" rel="0" transform="translate(0.359375, 0)"><g id="SvgjsG1139" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1141" font-family="Helvetica, Arial, sans-serif" x="20" y="33.666666666666664" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1142">100</tspan><title>100</title></text><text id="SvgjsText1144" font-family="Helvetica, Arial, sans-serif" x="20" y="64.84066666666666" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1145">50</tspan><title>50</title></text><text id="SvgjsText1147" font-family="Helvetica, Arial, sans-serif" x="20" y="96.01466666666667" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1148">0</tspan><title>0</title></text></g></g><g id="SvgjsG1083" class="apexcharts-inner apexcharts-graphical" transform="translate(45.359375, 30)"><defs id="SvgjsDefs1082"><clipPath id="gridRectMask65hyyzhz"><rect id="SvgjsRect1088" width="666.3046875" height="62.348" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectBarMask65hyyzhz"><rect id="SvgjsRect1089" width="675.3046875" height="71.348" x="-4.5" y="-4.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectMarkerMask65hyyzhz"><rect id="SvgjsRect1090" width="666.3046875" height="62.348" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMask65hyyzhz"></clipPath><clipPath id="nonForecastMask65hyyzhz"></clipPath></defs><line id="SvgjsLine1087" x1="0" y1="0" x2="0" y2="62.348" stroke="#b6b6b6" stroke-dasharray="3" stroke-linecap="butt" class="apexcharts-xcrosshairs" x="0" y="0" width="1" height="62.348" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><line id="SvgjsLine1106" x1="0" y1="62.348" x2="0" y2="68.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1107" x1="166.576171875" y1="62.348" x2="166.576171875" y2="68.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1108" x1="333.15234375" y1="62.348" x2="333.15234375" y2="68.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1109" x1="499.728515625" y1="62.348" x2="499.728515625" y2="68.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1110" x1="666.3046875" y1="62.348" x2="666.3046875" y2="68.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><g id="SvgjsG1102" class="apexcharts-grid"><g id="SvgjsG1103" class="apexcharts-gridlines-horizontal"><line id="SvgjsLine1112" x1="0" y1="31.174" x2="666.3046875" y2="31.174" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line></g><g id="SvgjsG1104" class="apexcharts-gridlines-vertical"></g><rect id="SvgjsRect1114" width="666.3046875" height="31.174" x="0" y="0" rx="0" ry="0" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#f3f3f3" clip-path="url(#gridRectMask65hyyzhz)" class="apexcharts-grid-row"></rect><rect id="SvgjsRect1115" width="666.3046875" height="31.174" x="0" y="31.174" rx="0" ry="0" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" fill="transparent" clip-path="url(#gridRectMask65hyyzhz)" class="apexcharts-grid-row"></rect><line id="SvgjsLine1117" x1="0" y1="62.348" x2="666.3046875" y2="62.348" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1116" x1="0" y1="1" x2="0" y2="62.348" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line></g><g id="SvgjsG1105" class="apexcharts-grid-borders"><line id="SvgjsLine1111" x1="0" y1="0" x2="666.3046875" y2="0" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1113" x1="0" y1="62.348" x2="666.3046875" y2="62.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1137" x1="0" y1="62.348" x2="666.3046875" y2="62.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt"></line></g><g id="SvgjsG1093" class="apexcharts-line-series apexcharts-plot-series"><g id="SvgjsG1094" class="apexcharts-series" zIndex="0" seriesName="Present" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath1097" d="M 0 24.9392C 58.301660156249994 24.9392 108.27451171875 37.4088 166.576171875 37.4088C 224.87783203125 37.4088 274.85068359375 43.6436 333.15234375 43.6436C 391.45400390625 43.6436 441.42685546875 49.8784 499.728515625 49.8784C 558.03017578125 49.8784 608.00302734375 18.7044 666.3046875 18.7044" fill="none" fill-opacity="1" stroke="rgba(76,175,80,0.85)" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-line" index="0" clip-path="url(#gridRectMask65hyyzhz)" pathTo="M 0 24.9392C 58.301660156249994 24.9392 108.27451171875 37.4088 166.576171875 37.4088C 224.87783203125 37.4088 274.85068359375 43.6436 333.15234375 43.6436C 391.45400390625 43.6436 441.42685546875 49.8784 499.728515625 49.8784C 558.03017578125 49.8784 608.00302734375 18.7044 666.3046875 18.7044" pathFrom="M 0 62.348 L 0 62.348 L 166.576171875 62.348 L 333.15234375 62.348 L 499.728515625 62.348 L 666.3046875 62.348" fill-rule="evenodd"></path><g id="SvgjsG1095" class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown" data:realIndex="0"><g class="apexcharts-series-markers"><path id="SvgjsPath1152" d="M 0, 0 
           m -0, 0 
           a 0,0 0 1,0 0,0 
           a 0,0 0 1,0 -0,0" fill="#4caf50" fill-opacity="1" stroke="#ffffff" stroke-opacity="0.9" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" cx="0" cy="0" shape="circle" class="apexcharts-marker wu6mgulrz no-pointer-events" default-marker-size="0"></path></g></g></g><g id="SvgjsG1098" class="apexcharts-series" zIndex="1" seriesName="Absent" data:longestSeries="true" rel="2" data:realIndex="1"><path id="SvgjsPath1101" d="M 0 49.8784C 58.301660156249994 49.8784 108.27451171875 24.9392 166.576171875 24.9392C 224.87783203125 24.9392 274.85068359375 34.291399999999996 333.15234375 34.291399999999996C 391.45400390625 34.291399999999996 441.42685546875 24.9392 499.728515625 24.9392C 558.03017578125 24.9392 608.00302734375 12.4696 666.3046875 12.4696" fill="none" fill-opacity="1" stroke="rgba(244,67,54,0.85)" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-line" index="1" clip-path="url(#gridRectMask65hyyzhz)" pathTo="M 0 49.8784C 58.301660156249994 49.8784 108.27451171875 24.9392 166.576171875 24.9392C 224.87783203125 24.9392 274.85068359375 34.291399999999996 333.15234375 34.291399999999996C 391.45400390625 34.291399999999996 441.42685546875 24.9392 499.728515625 24.9392C 558.03017578125 24.9392 608.00302734375 12.4696 666.3046875 12.4696" pathFrom="M 0 62.348 L 0 62.348 L 166.576171875 62.348 L 333.15234375 62.348 L 499.728515625 62.348 L 666.3046875 62.348" fill-rule="evenodd"></path><g id="SvgjsG1099" class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown" data:realIndex="1"><g class="apexcharts-series-markers"><path id="SvgjsPath1153" d="M 0, 0 
           m -0, 0 
           a 0,0 0 1,0 0,0 
           a 0,0 0 1,0 -0,0" fill="#f44336" fill-opacity="1" stroke="#ffffff" stroke-opacity="0.9" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" cx="0" cy="0" shape="circle" class="apexcharts-marker wie55rd1a no-pointer-events" default-marker-size="0"></path></g></g></g><g id="SvgjsG1096" class="apexcharts-datalabels" data:realIndex="0"></g><g id="SvgjsG1100" class="apexcharts-datalabels" data:realIndex="1"></g></g><line id="SvgjsLine1118" x1="0" y1="0" x2="666.3046875" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1119" x1="0" y1="0" x2="666.3046875" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1120" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1121" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"><text id="SvgjsText1123" font-family="Helvetica, Arial, sans-serif" x="0" y="90.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1124">Jan</tspan><title>Jan</title></text><text id="SvgjsText1126" font-family="Helvetica, Arial, sans-serif" x="166.576171875" y="90.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1127">Feb</tspan><title>Feb</title></text><text id="SvgjsText1129" font-family="Helvetica, Arial, sans-serif" x="333.15234375" y="90.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1130">Mar</tspan><title>Mar</title></text><text id="SvgjsText1132" font-family="Helvetica, Arial, sans-serif" x="499.728515625" y="90.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1133">Apr</tspan><title>Apr</title></text><text id="SvgjsText1135" font-family="Helvetica, Arial, sans-serif" x="666.3046875" y="90.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1136">May</tspan><title>May</title></text></g></g><g id="SvgjsG1149" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1150" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1151" class="apexcharts-point-annotations"></g></g></svg><div class="apexcharts-tooltip apexcharts-theme-light"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div><div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-0" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(76, 175, 80);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-1" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(244, 67, 54);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light"><div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div><div class="apexcharts-toolbar" style="top: 0px; right: 3px;"><div class="apexcharts-menu-icon" title="Menu"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"></path><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path></svg></div><div class="apexcharts-menu"><div class="apexcharts-menu-item exportSVG" title="Download SVG">Download SVG</div><div class="apexcharts-menu-item exportPNG" title="Download PNG">Download PNG</div><div class="apexcharts-menu-item exportCSV" title="Download CSV">Download CSV</div></div></div></div></div>
							</div>
                        </div>
                    </div>				
				</div>

				<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
						<h5>Daily Attendance List</h5>
						<div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                            <div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" class="form-control date-range bookingrange" placeholder="dd/mm/yyyy - dd/mm/yyyy">
									<span class="input-icon-addon">
										<i class="ti ti-chevron-down"></i>
									</span>
								</div>
							</div>
                            <div class="dropdown me-3">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									Select Status
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Present</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Absent</a>
									</li>
								</ul>
							</div>
                            <div class="dropdown">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									Sort By : Last 7 Days
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Recently Added</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Ascending</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Desending</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Last Month</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Last 7 Days</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card-body p-0">
						<div class="custom-datatable-filter table-responsive">
					

								<!-- Grid table-->
								<asp:GridView ID="gvDailyReport"
    runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-bordered table-striped">

    <Columns>

        <asp:BoundField
            DataField="Name"
            HeaderText="Name" />

        <asp:BoundField
            DataField="AttendanceDate"
            HeaderText="Date"
            DataFormatString="{0:dd-MMM-yyyy}" />

        <asp:BoundField DataField="DepartmentName"
    HeaderText="Department" />

        <asp:BoundField
            DataField="Status"
            HeaderText="Status" />

    </Columns>

</asp:GridView>




							</table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 - 10 of 10 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous"><a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="previous" tabindex="-1" class="page-link"><i class="ti ti-chevron-left"></i> </a></li><li class="paginate_button page-item active"><a href="#" aria-controls="DataTables_Table_0" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item next disabled" id="DataTables_Table_0_next"><a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="next" tabindex="-1" class="page-link"><i class="ti ti-chevron-right"></i></a></li></ul></div></div></div></div>
						</div>
					</div>
				</div>

			</div>
	<asp:HiddenField ID="hfPresent" runat="server" />
<asp:HiddenField ID="hfAbsent" runat="server" />

</asp:Content>
