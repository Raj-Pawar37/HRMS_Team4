<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AttendanceReport.aspx.cs" Inherits="HRMS_Team4.Admin.AttendanceReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">

        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Attendance Report</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="ti ti-smart-home"></i></a>
                        </li>
                        <li class="breadcrumb-item">HR
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Attendance Report</li>
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
                                <div class="d-flex align-items-center overflow-hidden mb-2">
                                    <div class="attendence-icon">
                                        <span><i class="ti ti-calendar text-primary"></i></span>
                                    </div>
                                    <div class="ms-2 overflow-hidden">
                                        <p class="fs-12 fw-normal mb-1 text-truncate">Total Working Days</p>
                                        <asp:Label ID="lblTotalWorkingDays" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="attendance-report-bar mb-2">
                                    <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="height: 5px;">
                                        <div class="progress-bar bg-success" style="width: 85%"></div>
                                    </div>
                                </div>
                                <div>
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Total Companies -->

                    <!-- Total Companies -->
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <div class="d-flex align-items-center overflow-hidden mb-2">
                                    <div class="attendence-icon">
                                        <span><i class="ti ti-calendar text-info"></i></span>
                                    </div>
                                    <div class="ms-2 overflow-hidden">
                                        <p class="fs-12 fw-normal mb-1 text-truncate">Total Leave Taken</p>
                                        <asp:Label ID="lblTotalLeaveTaken" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="attendance-report-bar mb-2">
                                    <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="height: 5px;">
                                        <div class="progress-bar bg-success" style="width: 85%"></div>
                                    </div>
                                </div>
                                <div>
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Total Companies -->

                    <!-- Inactive Companies -->
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <div class="d-flex align-items-center overflow-hidden mb-2">
                                    <div class="attendence-icon">
                                        <span><i class="ti ti-calendar text-pink"></i></span>
                                    </div>
                                    <div class="ms-2 overflow-hidden">
                                        <p class="fs-12 fw-normal mb-1 text-truncate">Total Holidays</p>
                                        <asp:Label ID="lblTotalHolidays" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="attendance-report-bar mb-2">
                                    <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="height: 5px;">
                                        <div class="progress-bar bg-success" style="width: 85%"></div>
                                    </div>
                                </div>
                                <div>
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Inactive Companies -->

                    <!-- Company Location -->
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <div class="d-flex align-items-center overflow-hidden mb-2">
                                    <div class="attendence-icon">
                                        <span><i class="ti ti-calendar text-warning"></i></span>
                                    </div>
                                    <div class="ms-2 overflow-hidden">
                                        <p class="fs-12 fw-normal mb-1 text-truncate">Total Halfdays</p>
                                        <asp:Label ID="lblTotalHalfDays" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="attendance-report-bar mb-2">
                                    <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="height: 5px;">
                                        <div class="progress-bar bg-success" style="width: 85%"></div>
                                    </div>
                                </div>
                                <div>
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Company Location -->
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-header border-0 pb-0">
                        <div class="d-flex flex-wrap justify-content-between align-items-center">
                            <div class="d-flex align-items-center ">
                                <span class="me-2"><i class="ti ti-chart-line text-danger"></i></span>
                                <h5>Attendance  </h5>
                            </div>
                            <div class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">This Year
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
                    <div class="card-body py-0 px-2">
                        <div id="attendance-report" style="min-height: 215px;">
                            <div id="apexchartsnyvpb1th" class="apexcharts-canvas apexchartsnyvpb1th apexcharts-theme-" style="width: 758px; height: 200px;">
                                <svg id="SvgjsSvg1113" width="758" height="200" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)">
                                    <foreignObject x="0" y="0" width="758" height="200">
                                        <div class="apexcharts-legend apexcharts-align-center apx-legend-position-bottom" xmlns="http://www.w3.org/1999/xhtml" style="right: 0px; position: absolute; left: 0px; top: 175px; max-height: 100px;">
                                            <div class="apexcharts-legend-series" rel="1" seriesname="Present" data:collapsed="false" style="margin: 4px 5px;">
                                                <span class="apexcharts-legend-marker" rel="1" data:collapsed="false" style="height: 16px; width: 16px; left: 0px; top: 0px;">
                                                    <svg id="SvgjsSvg1116" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev">
                                                        <defs id="SvgjsDefs1117">
                                                            <clipPath id="gridRectMasknyvpb1th">
                                                                <rect id="SvgjsRect1126" width="690.8017578125" height="108.34800000000001" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                                            </clipPath>
                                                            <clipPath id="gridRectBarMasknyvpb1th">
                                                                <rect id="SvgjsRect1127" width="699.8017578125" height="117.34800000000001" x="-4.5" y="-4.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                                            </clipPath>
                                                            <clipPath id="gridRectMarkerMasknyvpb1th">
                                                                <rect id="SvgjsRect1128" width="690.8017578125" height="108.34800000000001" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                                            </clipPath>
                                                            <clipPath id="forecastMasknyvpb1th"></clipPath>
                                                            <clipPath id="nonForecastMasknyvpb1th"></clipPath>
                                                        </defs><path id="SvgjsPath1118" d="M 0, 0 
           m -7, 0 
           a 7,7 0 1,0 14,0 
           a 7,7 0 1,0 -14,0"
                                                            fill="#28a745" fill-opacity="1" stroke="#ffffff" stroke-opacity="0.9" stroke-linecap="butt" stroke-width="1" stroke-dasharray="0" cx="0" cy="0" shape="circle" class="apexcharts-legend-marker apexcharts-marker apexcharts-marker-circle" style="transform: translate(50%, 50%);"></path></svg></span><span class="apexcharts-legend-text" rel="1" i="0" data:default-text="Present" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Present</span></div><div class="apexcharts-legend-series" rel="2" seriesname="Absent" data:collapsed="false" style="margin: 4px 5px;"><span class="apexcharts-legend-marker" rel="2" data:collapsed="false" style="height: 16px; width: 16px; left: 0px; top: 0px;"><svg id="SvgjsSvg1119" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"><defs id="SvgjsDefs1120"></defs><path id="SvgjsPath1121" d="M 0, 0 
           m -7, 0 
           a 7,7 0 1,0 14,0 
           a 7,7 0 1,0 -14,0"
                                                                fill="#ff69b4" fill-opacity="1" stroke="#ffffff" stroke-opacity="0.9" stroke-linecap="butt" stroke-width="1" stroke-dasharray="0" cx="0" cy="0" shape="circle" class="apexcharts-legend-marker apexcharts-marker apexcharts-marker-circle" style="transform: translate(50%, 50%);"></path></svg></span><span class="apexcharts-legend-text" rel="2" i="1" data:default-text="Absent" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Absent</span></div>
                                        </div>
                                        <style type="text/css">
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
                                            }
                                        </style>
                                    </foreignObject><rect id="SvgjsRect1124" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG1129" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g><g id="SvgjsG1130" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g><g id="SvgjsG1196" class="apexcharts-yaxis" rel="0" transform="translate(0.359375, 0)"><g id="SvgjsG1197" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1199" font-family="Helvetica, Arial, sans-serif" x="20" y="33.666666666666664" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1200">100</tspan>
                                        <title>100</title></text>
                                        <text id="SvgjsText1202" font-family="Helvetica, Arial, sans-serif" x="20" y="60.75366666666667" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1203">80</tspan>
                                            <title>80</title></text>
                                        <text id="SvgjsText1205" font-family="Helvetica, Arial, sans-serif" x="20" y="87.84066666666666" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1206">60</tspan>
                                            <title>60</title></text>
                                        <text id="SvgjsText1208" font-family="Helvetica, Arial, sans-serif" x="20" y="114.92766666666667" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1209">40</tspan>
                                            <title>40</title></text>
                                        <text id="SvgjsText1211" font-family="Helvetica, Arial, sans-serif" x="20" y="142.01466666666667" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1212">20</tspan>
                                            <title>20</title></text>
                                    </g>
                                    </g><g id="SvgjsG1115" class="apexcharts-inner apexcharts-graphical" transform="translate(45.359375, 30)"><defs id="SvgjsDefs1114"></defs>
                                        <line id="SvgjsLine1125" x1="0" y1="0" x2="0" y2="108.34800000000001" stroke="#b6b6b6" stroke-dasharray="3" stroke-linecap="butt" class="apexcharts-xcrosshairs" x="0" y="0" width="1" height="108.34800000000001" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line>
                                        <line id="SvgjsLine1144" x1="0" y1="108.34800000000001" x2="0" y2="114.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1145" x1="86.3502197265625" y1="108.34800000000001" x2="86.3502197265625" y2="114.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1146" x1="172.700439453125" y1="108.34800000000001" x2="172.700439453125" y2="114.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1147" x1="259.0506591796875" y1="108.34800000000001" x2="259.0506591796875" y2="114.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1148" x1="345.40087890625" y1="108.34800000000001" x2="345.40087890625" y2="114.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1149" x1="431.7510986328125" y1="108.34800000000001" x2="431.7510986328125" y2="114.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1150" x1="518.101318359375" y1="108.34800000000001" x2="518.101318359375" y2="114.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1151" x1="604.4515380859375" y1="108.34800000000001" x2="604.4515380859375" y2="114.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1152" x1="690.8017578125" y1="108.34800000000001" x2="690.8017578125" y2="114.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <g id="SvgjsG1140" class="apexcharts-grid">
                                            <g id="SvgjsG1141" class="apexcharts-gridlines-horizontal">
                                                <line id="SvgjsLine1154" x1="0" y1="27.087000000000003" x2="690.8017578125" y2="27.087000000000003" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1155" x1="0" y1="54.17400000000001" x2="690.8017578125" y2="54.17400000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1156" x1="0" y1="81.26100000000001" x2="690.8017578125" y2="81.26100000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                            </g>
                                            <g id="SvgjsG1142" class="apexcharts-gridlines-vertical"></g>
                                            <rect id="SvgjsRect1158" width="690.8017578125" height="27.087000000000003" x="0" y="0" rx="0" ry="0" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#f3f3f3" clip-path="url(#gridRectMasknyvpb1th)" class="apexcharts-grid-row"></rect>
                                            <rect id="SvgjsRect1159" width="690.8017578125" height="27.087000000000003" x="0" y="27.087000000000003" rx="0" ry="0" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" fill="transparent" clip-path="url(#gridRectMasknyvpb1th)" class="apexcharts-grid-row"></rect>
                                            <rect id="SvgjsRect1160" width="690.8017578125" height="27.087000000000003" x="0" y="54.17400000000001" rx="0" ry="0" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#f3f3f3" clip-path="url(#gridRectMasknyvpb1th)" class="apexcharts-grid-row"></rect>
                                            <rect id="SvgjsRect1161" width="690.8017578125" height="27.087000000000003" x="0" y="81.26100000000001" rx="0" ry="0" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" fill="transparent" clip-path="url(#gridRectMasknyvpb1th)" class="apexcharts-grid-row"></rect>
                                            <line id="SvgjsLine1163" x1="0" y1="108.34800000000001" x2="690.8017578125" y2="108.34800000000001" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line>
                                            <line id="SvgjsLine1162" x1="0" y1="1" x2="0" y2="108.34800000000001" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line>
                                        </g>
                                        <g id="SvgjsG1143" class="apexcharts-grid-borders">
                                            <line id="SvgjsLine1153" x1="0" y1="0" x2="690.8017578125" y2="0" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                            <line id="SvgjsLine1157" x1="0" y1="108.34800000000001" x2="690.8017578125" y2="108.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                            <line id="SvgjsLine1195" x1="0" y1="108.34800000000001" x2="690.8017578125" y2="108.34800000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt"></line>
                                        </g>
                                        <g id="SvgjsG1131" class="apexcharts-line-series apexcharts-plot-series">
                                            <g id="SvgjsG1132" class="apexcharts-series" zIndex="0" seriesName="Present" data:longestSeries="true" rel="1" data:realIndex="0">
                                                <path id="SvgjsPath1135" d="M 0 94.80449999999999C 30.222576904296872 94.80449999999999 56.12764282226563 47.402249999999995 86.3502197265625 47.402249999999995C 116.57279663085937 47.402249999999995 142.4778625488281 40.6305 172.700439453125 40.6305C 202.9230163574219 40.6305 228.8280822753906 33.858749999999986 259.0506591796875 33.858749999999986C 289.2732360839844 33.858749999999986 315.1783020019531 27.08699999999999 345.40087890625 27.08699999999999C 375.6234558105469 27.08699999999999 401.5285217285156 6.771749999999997 431.7510986328125 6.771749999999997C 461.9736755371094 6.771749999999997 487.8787414550781 0 518.101318359375 0C 548.3238952636718 0 574.2289611816407 40.6305 604.4515380859375 40.6305C 634.6741149902343 40.6305 660.5791809082032 47.402249999999995 690.8017578125 47.402249999999995" fill="none" fill-opacity="1" stroke="rgba(40,167,69,0.85)" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-line" index="0" clip-path="url(#gridRectMasknyvpb1th)" pathTo="M 0 94.80449999999999C 30.222576904296872 94.80449999999999 56.12764282226563 47.402249999999995 86.3502197265625 47.402249999999995C 116.57279663085937 47.402249999999995 142.4778625488281 40.6305 172.700439453125 40.6305C 202.9230163574219 40.6305 228.8280822753906 33.858749999999986 259.0506591796875 33.858749999999986C 289.2732360839844 33.858749999999986 315.1783020019531 27.08699999999999 345.40087890625 27.08699999999999C 375.6234558105469 27.08699999999999 401.5285217285156 6.771749999999997 431.7510986328125 6.771749999999997C 461.9736755371094 6.771749999999997 487.8787414550781 0 518.101318359375 0C 548.3238952636718 0 574.2289611816407 40.6305 604.4515380859375 40.6305C 634.6741149902343 40.6305 660.5791809082032 47.402249999999995 690.8017578125 47.402249999999995" pathFrom="M 0 135.435 L 0 135.435 L 86.3502197265625 135.435 L 172.700439453125 135.435 L 259.0506591796875 135.435 L 345.40087890625 135.435 L 431.7510986328125 135.435 L 518.101318359375 135.435 L 604.4515380859375 135.435 L 690.8017578125 135.435" fill-rule="evenodd"></path>
                                                <g id="SvgjsG1133" class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown" data:realIndex="0">
                                                    <g class="apexcharts-series-markers">
                                                        <path id="SvgjsPath1216" d="M 0, 0 
           m -0, 0 
           a 0,0 0 1,0 0,0 
           a 0,0 0 1,0 -0,0"
                                                            fill="#28a745" fill-opacity="1" stroke="#ffffff" stroke-opacity="0.9" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" cx="0" cy="0" shape="circle" class="apexcharts-marker w36wdg95dj no-pointer-events" default-marker-size="0">
                                                        </path>
                                                    </g>
                                                </g>
                                            </g>
                                            <g id="SvgjsG1136" class="apexcharts-series" zIndex="1" seriesName="Absent" data:longestSeries="true" rel="2" data:realIndex="1">
                                                <path id="SvgjsPath1139" d="M 0 94.80449999999999C 30.222576904296872 94.80449999999999 56.12764282226563 60.94574999999999 86.3502197265625 60.94574999999999C 116.57279663085937 60.94574999999999 142.4778625488281 54.17399999999999 172.700439453125 54.17399999999999C 202.9230163574219 54.17399999999999 228.8280822753906 47.402249999999995 259.0506591796875 47.402249999999995C 289.2732360839844 47.402249999999995 315.1783020019531 67.7175 345.40087890625 67.7175C 375.6234558105469 67.7175 401.5285217285156 40.6305 431.7510986328125 40.6305C 461.9736755371094 40.6305 487.8787414550781 27.08699999999999 518.101318359375 27.08699999999999C 548.3238952636718 27.08699999999999 574.2289611816407 54.17399999999999 604.4515380859375 54.17399999999999C 634.6741149902343 54.17399999999999 660.5791809082032 40.6305 690.8017578125 40.6305" fill="none" fill-opacity="1" stroke="rgba(255,105,180,0.85)" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-line" index="1" clip-path="url(#gridRectMasknyvpb1th)" pathTo="M 0 94.80449999999999C 30.222576904296872 94.80449999999999 56.12764282226563 60.94574999999999 86.3502197265625 60.94574999999999C 116.57279663085937 60.94574999999999 142.4778625488281 54.17399999999999 172.700439453125 54.17399999999999C 202.9230163574219 54.17399999999999 228.8280822753906 47.402249999999995 259.0506591796875 47.402249999999995C 289.2732360839844 47.402249999999995 315.1783020019531 67.7175 345.40087890625 67.7175C 375.6234558105469 67.7175 401.5285217285156 40.6305 431.7510986328125 40.6305C 461.9736755371094 40.6305 487.8787414550781 27.08699999999999 518.101318359375 27.08699999999999C 548.3238952636718 27.08699999999999 574.2289611816407 54.17399999999999 604.4515380859375 54.17399999999999C 634.6741149902343 54.17399999999999 660.5791809082032 40.6305 690.8017578125 40.6305" pathFrom="M 0 135.435 L 0 135.435 L 86.3502197265625 135.435 L 172.700439453125 135.435 L 259.0506591796875 135.435 L 345.40087890625 135.435 L 431.7510986328125 135.435 L 518.101318359375 135.435 L 604.4515380859375 135.435 L 690.8017578125 135.435" fill-rule="evenodd"></path>
                                                <g id="SvgjsG1137" class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown" data:realIndex="1">
                                                    <g class="apexcharts-series-markers">
                                                        <path id="SvgjsPath1217" d="M 0, 0 
           m -0, 0 
           a 0,0 0 1,0 0,0 
           a 0,0 0 1,0 -0,0"
                                                            fill="#ff69b4" fill-opacity="1" stroke="#ffffff" stroke-opacity="0.9" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" cx="0" cy="0" shape="circle" class="apexcharts-marker w7f15ziw1 no-pointer-events" default-marker-size="0">
                                                        </path>
                                                    </g>
                                                </g>
                                            </g>
                                            <g id="SvgjsG1134" class="apexcharts-datalabels" data:realIndex="0"></g>
                                            <g id="SvgjsG1138" class="apexcharts-datalabels" data:realIndex="1"></g>
                                        </g>
                                        <line id="SvgjsLine1164" x1="0" y1="0" x2="690.8017578125" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
                                        <line id="SvgjsLine1165" x1="0" y1="0" x2="690.8017578125" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line>
                                        <g id="SvgjsG1166" class="apexcharts-xaxis" transform="translate(0, 0)">
                                            <g id="SvgjsG1167" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)">
                                                <text id="SvgjsText1169" font-family="Helvetica, Arial, sans-serif" x="0" y="136.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1170">Jan</tspan>
                                                    <title>Jan</title></text>
                                                <text id="SvgjsText1172" font-family="Helvetica, Arial, sans-serif" x="86.3502197265625" y="136.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1173">Feb</tspan>
                                                    <title>Feb</title></text>
                                                <text id="SvgjsText1175" font-family="Helvetica, Arial, sans-serif" x="172.700439453125" y="136.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1176">Mar</tspan>
                                                    <title>Mar</title></text>
                                                <text id="SvgjsText1178" font-family="Helvetica, Arial, sans-serif" x="259.0506591796875" y="136.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1179">Apr</tspan>
                                                    <title>Apr</title></text>
                                                <text id="SvgjsText1181" font-family="Helvetica, Arial, sans-serif" x="345.40087890625" y="136.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1182">May</tspan>
                                                    <title>May</title></text>
                                                <text id="SvgjsText1184" font-family="Helvetica, Arial, sans-serif" x="431.7510986328125" y="136.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1185">Jun</tspan>
                                                    <title>Jun</title></text>
                                                <text id="SvgjsText1187" font-family="Helvetica, Arial, sans-serif" x="518.101318359375" y="136.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1188">Jul</tspan>
                                                    <title>Jul</title></text>
                                                <text id="SvgjsText1190" font-family="Helvetica, Arial, sans-serif" x="604.4515380859375" y="136.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1191">Aug</tspan>
                                                    <title>Aug</title></text>
                                                <text id="SvgjsText1193" font-family="Helvetica, Arial, sans-serif" x="690.8017578125" y="136.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1194">Sep</tspan>
                                                    <title>Sep</title></text>
                                            </g>
                                        </g>
                                        <g id="SvgjsG1213" class="apexcharts-yaxis-annotations"></g>
                                        <g id="SvgjsG1214" class="apexcharts-xaxis-annotations"></g>
                                        <g id="SvgjsG1215" class="apexcharts-point-annotations"></g>
                                    </g></svg><div class="apexcharts-tooltip apexcharts-theme-light">
                                        <div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div>
                                        <div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-0" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(40, 167, 69);"></span>
                                            <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                <div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div>
                                                <div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div>
                                                <div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div>
                                            </div>
                                        </div>
                                        <div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-1" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(255, 105, 180);"></span>
                                            <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                <div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div>
                                                <div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div>
                                                <div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                <div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light">
                                    <div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div>
                                </div>
                                <div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
                                    <div class="apexcharts-yaxistooltip-text"></div>
                                </div>
                                <div class="apexcharts-toolbar" style="top: 0px; right: 3px;">
                                    <div class="apexcharts-menu-icon" title="Menu">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                            <path fill="none" d="M0 0h24v24H0V0z"></path><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path></svg></div>
                                    <div class="apexcharts-menu">
                                        <div class="apexcharts-menu-item exportSVG" title="Download SVG">Download SVG</div>
                                        <div class="apexcharts-menu-item exportPNG" title="Download PNG">Download PNG</div>
                                        <div class="apexcharts-menu-item exportCSV" title="Download CSV">Download CSV</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                <h5>Employee Attendance</h5>
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
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Select Status
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
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Sort By : Last 7 Days
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
                    <asp:GridView ID="gvAttendanceReport"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-bordered table-striped">

                        <Columns>

                            <asp:BoundField DataField="AttendanceId"
                                HeaderText="Attendance ID" />

                            <asp:BoundField DataField="Employee"
                                HeaderText="Employee" />

                            <asp:BoundField DataField="AttendanceDate"
                                HeaderText="Date"
                                DataFormatString="{0:dd-MMM-yyyy}" />

                            <asp:BoundField DataField="CheckIn"
                                HeaderText="Check In" />

                            <asp:BoundField DataField="CheckOut"
                                HeaderText="Check Out" />

                            <asp:BoundField DataField="LunchIn"
                                HeaderText="Lunch In" />

                            <asp:BoundField DataField="LunchOut"
                                HeaderText="Lunch Out" />

                            <asp:BoundField DataField="Status"
                                HeaderText="Status" />

                            <asp:BoundField DataField="WorkingHours"
                                HeaderText="Working Hours" />

                            <asp:BoundField DataField="OvertimeHours"
                                HeaderText="Overtime" />

                            <asp:BoundField DataField="BreakHours"
                                HeaderText="Break" />

                            <asp:BoundField DataField="Late"
                                HeaderText="Late" />

                            <asp:BoundField DataField="ProductionHours"
                                HeaderText="Production Hours" />

                        </Columns>

                    </asp:GridView>


                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-5">
                        <div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 - 10 of 10 entries</div>
                    </div>
                    <div class="col-sm-12 col-md-7">
                        <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
                            <ul class="pagination">
                                <li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous"><a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="previous" tabindex="-1" class="page-link"><i class="ti ti-chevron-left"></i></a></li>
                                <li class="paginate_button page-item active"><a href="#" aria-controls="DataTables_Table_0" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link">1</a></li>
                                <li class="paginate_button page-item next disabled" id="DataTables_Table_0_next"><a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="next" tabindex="-1" class="page-link"><i class="ti ti-chevron-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

			</div>

	<asp:HiddenField ID="hfPresentCount" runat="server" />
    <asp:HiddenField ID="hfAbsentCount" runat="server" />
</asp:Content>
