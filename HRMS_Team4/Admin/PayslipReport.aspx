<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PayslipReport.aspx.cs" Inherits="HRMS_Team4.Admin.PayslipReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">

				<!-- Breadcrumb -->
				<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
					<div class="my-auto mb-2">
						<h2 class="mb-1">Payslip Report</h2>
						<nav>
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item">
									<a href="index.html"><i class="ti ti-smart-home"></i></a>
								</li>
								<li class="breadcrumb-item">
									HR
								</li>
								<li class="breadcrumb-item active" aria-current="page">Payslip Report</li>
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

					<!-- Total Exponses -->
					<div class="col-xl-6 d-flex">
						<div class="row flex-fill">
							<div class="col-md-6 d-flex">
								<div class="card flex-fill">
									<div class="card-body">
										<div class="d-flex align-items-center justify-content-between bg-light border rounded p-2 mb-2">
											<div class="">
												<span class="fs-14 fw-normal text-truncate mb-1">Total Payroll</span>
												<h5>
    <asp:Label ID="lblTotalPayroll" runat="server"></asp:Label>
</h5>
											</div>
											<a href="#" class="avatar avatar-md avatar-rounded bg-transparent-primary border border-primary">
												<span class="text-primary"><i class="ti ti-brand-shopee"></i></span>
											</a>
										</div>
										<p class="fs-12 fw-normal d-flex align-items-center text-truncate">
											<span class="text-success fs-12 d-flex align-items-center me-1">
												<i class="ti ti-arrow-wave-right-up me-1"></i>+20.01% 
											</span> from last week
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-6 d-flex">
								<div class="card flex-fill">
									<div class="card-body">
										<div class="d-flex align-items-center justify-content-between bg-light border rounded p-2 mb-2">
											<div class="">
												<span class="fs-14 fw-normal text-truncate mb-1">Deductions</span>
												<h5>
    <asp:Label ID="lblDeductions" runat="server"></asp:Label>
</h5>
											</div>
											<a href="#" class="avatar avatar-md avatar-rounded bg-transparent-danger border border-danger">
												<span class="text-danger"><i class="ti ti-brand-shopee"></i></span>
											</a>
										</div>
										<p class="fs-12 fw-normal d-flex align-items-center text-truncate">
											<span class="text-success fs-12 d-flex align-items-center me-1">
												<i class="ti ti-arrow-wave-right-up me-1"></i>+17.01% 
											</span> from last week
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-6 d-flex">
								<div class="card flex-fill">
									<div class="card-body">
										<div class="d-flex align-items-center justify-content-between bg-light border rounded p-2 mb-2">
											<div class="">
												<span class="fs-14 fw-normal text-truncate mb-1">Net Pay</span>
												<h5>
    <asp:Label ID="lblNetPay" runat="server"></asp:Label>
</h5>
											</div>
											<a href="#" class="avatar avatar-md avatar-rounded bg-transparent-success border border-success">
												<span class="text-success"><i class="ti ti-brand-shopee"></i></span>
											</a>
										</div>
										<p class="fs-12 fw-normal d-flex align-items-center text-truncate">
											<span class="text-success fs-12 d-flex align-items-center me-1">
												<i class="ti ti-arrow-wave-right-up me-1"></i>+10.01% 
											</span> from last week
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-6 d-flex">
								<div class="card flex-fill">
									<div class="card-body">
										<div class="d-flex align-items-center justify-content-between bg-light border rounded p-2 mb-2">
											<div class="">
												<span class="fs-14 fw-normal text-truncate mb-1">Allowances</span>
												<h5>
    <asp:Label ID="lblAllowances" runat="server"></asp:Label>
</h5>
											</div>
											<a href="#" class="avatar avatar-md avatar-rounded bg-transparent-skyblue border border-skyblue">
												<span class="text-skyblue"><i class="ti ti-brand-shopee"></i></span>
											</a>
										</div>
										<p class="fs-12 fw-normal d-flex align-items-center text-truncate">
											<span class="text-danger fs-12 d-flex align-items-center me-1">
												<i class="ti ti-arrow-wave-right-up me-1"></i>-10.01% 
											</span> from last week
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /Total Exponses -->

					<!-- Total Exponses -->
					<div class="col-xl-6 d-flex">
						<div class="card flex-fill">
							<div class="card-header border-0 pb-0">
								<div class="d-flex flex-wrap justify-content-between align-items-center">
									<div class="d-flex align-items-center ">
										<span class="me-2"><i class="ti ti-chart-area-line text-danger"></i></span>
										<h5>Payroll</h5>
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

							<!-- Graph -->

							<div class="card-body py-0">
								<div id="payslip-chart" class="" style="min-height: 215px;"><div id="apexchartsdl12r1b" class="apexcharts-canvas apexchartsdl12r1b apexcharts-theme-" style="width: 734px; height: 200px;"><svg id="SvgjsSvg1112" width="734" height="200" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg apexcharts-zoomable" xmlns:data="ApexChartsNS" transform="translate(0, 0)"><foreignObject x="0" y="0" width="734" height="200"><div class="apexcharts-legend" xmlns="http://www.w3.org/1999/xhtml" style="max-height: 100px;"></div><style type="text/css">
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
      }</style></foreignObject><rect id="SvgjsRect1117" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG1122" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g><g id="SvgjsG1123" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g><g id="SvgjsG1193" class="apexcharts-yaxis" rel="0" transform="translate(9.25, 0)"><g id="SvgjsG1194" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1196" font-family="Helvetica, Arial, sans-serif" x="20" y="33.666666666666664" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1197">80</tspan><title>80</title></text><text id="SvgjsText1199" font-family="Helvetica, Arial, sans-serif" x="20" y="66.75366666666667" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1200">60</tspan><title>60</title></text><text id="SvgjsText1202" font-family="Helvetica, Arial, sans-serif" x="20" y="99.84066666666668" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1203">40</tspan><title>40</title></text><text id="SvgjsText1205" font-family="Helvetica, Arial, sans-serif" x="20" y="132.92766666666668" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1206">20</tspan><title>20</title></text><text id="SvgjsText1208" font-family="Helvetica, Arial, sans-serif" x="20" y="166.0146666666667" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1209">0</tspan><title>0</title></text></g></g><g id="SvgjsG1114" class="apexcharts-inner apexcharts-graphical" transform="translate(39.25, 30)"><defs id="SvgjsDefs1113"><clipPath id="gridRectMaskdl12r1b"><rect id="SvgjsRect1119" width="672.580078125" height="132.348" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectBarMaskdl12r1b"><rect id="SvgjsRect1120" width="681.580078125" height="141.348" x="-4.5" y="-4.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectMarkerMaskdl12r1b"><rect id="SvgjsRect1121" width="672.580078125" height="132.348" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskdl12r1b"></clipPath><clipPath id="nonForecastMaskdl12r1b"></clipPath></defs><line id="SvgjsLine1118" x1="0" y1="0" x2="0" y2="132.348" stroke="#b6b6b6" stroke-dasharray="3" stroke-linecap="butt" class="apexcharts-xcrosshairs" x="0" y="0" width="1" height="132.348" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><line id="SvgjsLine1133" x1="0" y1="132.348" x2="0" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1134" x1="61.14364346590909" y1="132.348" x2="61.14364346590909" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1135" x1="122.28728693181819" y1="132.348" x2="122.28728693181819" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1136" x1="183.43093039772728" y1="132.348" x2="183.43093039772728" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1137" x1="244.57457386363637" y1="132.348" x2="244.57457386363637" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1138" x1="305.7182173295455" y1="132.348" x2="305.7182173295455" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1139" x1="366.8618607954546" y1="132.348" x2="366.8618607954546" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1140" x1="428.00550426136374" y1="132.348" x2="428.00550426136374" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1141" x1="489.14914772727286" y1="132.348" x2="489.14914772727286" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1142" x1="550.292791193182" y1="132.348" x2="550.292791193182" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1143" x1="611.4364346590911" y1="132.348" x2="611.4364346590911" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1144" x1="672.5800781250002" y1="132.348" x2="672.5800781250002" y2="138.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><g id="SvgjsG1129" class="apexcharts-grid"><g id="SvgjsG1130" class="apexcharts-gridlines-horizontal"><line id="SvgjsLine1146" x1="0" y1="33.087" x2="672.580078125" y2="33.087" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1147" x1="0" y1="66.174" x2="672.580078125" y2="66.174" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1148" x1="0" y1="99.26100000000001" x2="672.580078125" y2="99.26100000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line></g><g id="SvgjsG1131" class="apexcharts-gridlines-vertical"></g><line id="SvgjsLine1151" x1="0" y1="132.348" x2="672.580078125" y2="132.348" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1150" x1="0" y1="1" x2="0" y2="132.348" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line></g><g id="SvgjsG1132" class="apexcharts-grid-borders"><line id="SvgjsLine1145" x1="0" y1="0" x2="672.580078125" y2="0" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1149" x1="0" y1="132.348" x2="672.580078125" y2="132.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1192" x1="0" y1="132.348" x2="672.580078125" y2="132.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt"></line></g><g id="SvgjsG1124" class="apexcharts-line-series apexcharts-plot-series"><g id="SvgjsG1125" class="apexcharts-series" zIndex="0" seriesName="series-1" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath1128" d="M 0 95.95230000000001 H 61.14364346590909 V 99.26100000000001 H 122.28728693181819 V 82.7175 H 183.43093039772728 V 57.902249999999995 H 244.57457386363637 V 41.35875 H 305.7182173295455 V 57.902249999999995 H 366.86186079545456 V 99.26100000000001 H 428.0055042613637 V 16.543499999999995 H 489.14914772727275 V 90.98925 H 550.2927911931819 V 82.7175 H 611.436434659091 V 115.80450000000002 H 672.580078125 V 82.7175" fill="none" fill-opacity="1" stroke="rgba(255,87,51,0.85)" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-line" index="0" clip-path="url(#gridRectMaskdl12r1b)" pathTo="M 0 95.95230000000001 H 61.14364346590909 V 99.26100000000001 H 122.28728693181819 V 82.7175 H 183.43093039772728 V 57.902249999999995 H 244.57457386363637 V 41.35875 H 305.7182173295455 V 57.902249999999995 H 366.86186079545456 V 99.26100000000001 H 428.0055042613637 V 16.543499999999995 H 489.14914772727275 V 90.98925 H 550.2927911931819 V 82.7175 H 611.436434659091 V 115.80450000000002 H 672.580078125 V 82.7175" pathFrom="M 0 132.348 L 0 132.348 L 61.14364346590909 132.348 L 122.28728693181819 132.348 L 183.43093039772728 132.348 L 244.57457386363637 132.348 L 305.7182173295455 132.348 L 366.86186079545456 132.348 L 428.0055042613637 132.348 L 489.14914772727275 132.348 L 550.2927911931819 132.348 L 611.436434659091 132.348 L 672.580078125 132.348" fill-rule="evenodd"></path><g id="SvgjsG1126" class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown" data:realIndex="0"><g class="apexcharts-series-markers"><path id="SvgjsPath1213" d="M 0, 0 
           m -0, 0 
           a 0,0 0 1,0 0,0 
           a 0,0 0 1,0 -0,0" fill="#ff5733" fill-opacity="1" stroke="#ffffff" stroke-opacity="0.9" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" cx="0" cy="0" shape="circle" class="apexcharts-marker wo45z5iyi no-pointer-events" default-marker-size="0"></path></g></g></g><g id="SvgjsG1127" class="apexcharts-datalabels" data:realIndex="0"></g></g><line id="SvgjsLine1152" x1="0" y1="0" x2="672.580078125" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1153" x1="0" y1="0" x2="672.580078125" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1154" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1155" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"><text id="SvgjsText1157" font-family="Helvetica, Arial, sans-serif" x="0" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1158">Jan</tspan><title>Jan</title></text><text id="SvgjsText1160" font-family="Helvetica, Arial, sans-serif" x="61.14364346590909" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1161">Feb</tspan><title>Feb</title></text><text id="SvgjsText1163" font-family="Helvetica, Arial, sans-serif" x="122.2872869318182" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1164">Mar</tspan><title>Mar</title></text><text id="SvgjsText1166" font-family="Helvetica, Arial, sans-serif" x="183.4309303977273" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1167">Apr</tspan><title>Apr</title></text><text id="SvgjsText1169" font-family="Helvetica, Arial, sans-serif" x="244.57457386363637" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1170">May</tspan><title>May</title></text><text id="SvgjsText1172" font-family="Helvetica, Arial, sans-serif" x="305.71821732954544" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1173">Jun</tspan><title>Jun</title></text><text id="SvgjsText1175" font-family="Helvetica, Arial, sans-serif" x="366.86186079545456" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1176">Jul</tspan><title>Jul</title></text><text id="SvgjsText1178" font-family="Helvetica, Arial, sans-serif" x="428.0055042613637" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1179">Aug</tspan><title>Aug</title></text><text id="SvgjsText1181" font-family="Helvetica, Arial, sans-serif" x="489.1491477272728" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1182">Sep</tspan><title>Sep</title></text><text id="SvgjsText1184" font-family="Helvetica, Arial, sans-serif" x="550.292791193182" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1185">Oct</tspan><title>Oct</title></text><text id="SvgjsText1187" font-family="Helvetica, Arial, sans-serif" x="611.4364346590911" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1188">Nov</tspan><title>Nov</title></text><text id="SvgjsText1190" font-family="Helvetica, Arial, sans-serif" x="672.5800781250002" y="160.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1191">Dec</tspan><title>Dec</title></text></g></g><g id="SvgjsG1210" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1211" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1212" class="apexcharts-point-annotations"></g><rect id="SvgjsRect1214" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-zoom-rect"></rect><rect id="SvgjsRect1215" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-selection-rect"></rect></g></svg><div class="apexcharts-tooltip apexcharts-theme-light"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div><div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-0" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(255, 87, 51);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light"><div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div><div class="apexcharts-toolbar" style="top: 0px; right: 3px;"><div class="apexcharts-zoomin-icon" title="Zoom In"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" fill="none"></path>
    <path d="M13 7h-2v4H7v2h4v4h2v-4h4v-2h-4V7zm-1-5C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"></path>
</svg>
</div><div class="apexcharts-zoomout-icon" title="Zoom Out"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" fill="none"></path>
    <path d="M7 11v2h10v-2H7zm5-9C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"></path>
</svg>
</div><div class="apexcharts-zoom-icon apexcharts-selected" title="Selection Zoom"><svg xmlns="http://www.w3.org/2000/svg" fill="#000000" height="24" viewBox="0 0 24 24" width="24">
    <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
    <path d="M0 0h24v24H0V0z" fill="none"></path>
    <path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"></path>
</svg></div><div class="apexcharts-pan-icon" title="Panning"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000" height="24" viewBox="0 0 24 24" width="24">
    <defs>
        <path d="M0 0h24v24H0z" id="a"></path>
    </defs>
    <clipPath id="b">
        <use overflow="visible" xlink:href="#a"></use>
    </clipPath>
    <path clip-path="url(#b)" d="M23 5.5V20c0 2.2-1.8 4-4 4h-7.3c-1.08 0-2.1-.43-2.85-1.19L1 14.83s1.26-1.23 1.3-1.25c.22-.19.49-.29.79-.29.22 0 .42.06.6.16.04.01 4.31 2.46 4.31 2.46V4c0-.83.67-1.5 1.5-1.5S11 3.17 11 4v7h1V1.5c0-.83.67-1.5 1.5-1.5S15 .67 15 1.5V11h1V2.5c0-.83.67-1.5 1.5-1.5s1.5.67 1.5 1.5V11h1V5.5c0-.83.67-1.5 1.5-1.5s1.5.67 1.5 1.5z"></path>
</svg></div><div class="apexcharts-reset-icon" title="Reset Zoom"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"></path>
    <path d="M0 0h24v24H0z" fill="none"></path>
</svg></div><div class="apexcharts-menu-icon" title="Menu"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"></path><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path></svg></div><div class="apexcharts-menu"><div class="apexcharts-menu-item exportSVG" title="Download SVG">Download SVG</div><div class="apexcharts-menu-item exportPNG" title="Download PNG">Download PNG</div><div class="apexcharts-menu-item exportCSV" title="Download CSV">Download CSV</div></div></div></div></div>
							</div>
						</div>
					</div>
					<!-- /Total Exponses -->


				</div>

				<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
						<h5>Payslip List</h5>
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
									$0.00 - $00
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">$3800</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">$4500</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">$3400</a>
									</li>
								</ul>
							</div>
							<div class="dropdown me-3">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									Payment Type
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Cash</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1">Cheque</a>
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
							
							<!-- Grid View  -->	
							<asp:GridView ID="gvPayslipReport"
    runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-bordered">

    <Columns>

        <asp:BoundField
            DataField="EmployeeName"
            HeaderText="Name" />

        <asp:BoundField
            DataField="PaidAmount"
            HeaderText="Paid Amount" />

        <asp:BoundField
            DataField="PaidMonth"
            HeaderText="Paid Month" />

        <asp:BoundField
            DataField="PaidYear"
            HeaderText="Paid Year" />

    </Columns>

</asp:GridView>




							</div>
					</div>
				</div>

			</div>
	<asp:HiddenField ID="hfJan" runat="server" />
<asp:HiddenField ID="hfFeb" runat="server" />
<asp:HiddenField ID="hfMar" runat="server" />
<asp:HiddenField ID="hfApr" runat="server" />
<asp:HiddenField ID="hfMay" runat="server" />
<asp:HiddenField ID="hfJun" runat="server" />
<asp:HiddenField ID="hfJul" runat="server" />
<asp:HiddenField ID="hfAug" runat="server" />
<asp:HiddenField ID="hfSep" runat="server" />
<asp:HiddenField ID="hfOct" runat="server" />
<asp:HiddenField ID="hfNov" runat="server" />
<asp:HiddenField ID="hfDec" runat="server" />
</asp:Content>
