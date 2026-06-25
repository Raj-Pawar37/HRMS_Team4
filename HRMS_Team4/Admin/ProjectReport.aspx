<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProjectReport.aspx.cs" Inherits="HRMS_Team4.Admin.ProjectReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">

        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Project Report</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="ti ti-smart-home"></i></a>
                        </li>
                        <li class="breadcrumb-item">HR
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Project Report</li>
                    </ol>
                </nav>
            </div>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                <div class="mb-2">
                  <div class="dropdown">
    <a href="javascript:void(0);"
        class="dropdown-toggle btn btn-orange"
        data-bs-toggle="dropdown">

        <i class="ti ti-file-export me-1"></i>
        Export
    </a>

    <ul class="dropdown-menu dropdown-menu-end">

        <li>
            <asp:LinkButton ID="btnExportPdf"
                runat="server"
                CssClass="dropdown-item"
                OnClick="btnExportPdf_Click">

                <i class="ti ti-file-type-pdf me-2"></i>
                Export as PDF

            </asp:LinkButton>
        </li>

        <li>
            <asp:LinkButton ID="btnExportExcel"
                runat="server"
                CssClass="dropdown-item"
                OnClick="btnExportExcel_Click">

                <i class="ti ti-file-type-xls me-2"></i>
                Export as Excel

            </asp:LinkButton>
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
            <div class="col-lg-6 col-md-6 d-flex">
                <div class="row flex-fill">
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body ">
                                <div>
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Total Projects</span>
                                        <h5>
                                            <asp:Label ID="lblTotalProjects" runat="server"></asp:Label></h5>
                                    </div>
                                    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 100%; height: 5px;">
                                       <div id="divTotalProjectsBar"
     runat="server"
     class="progress-bar bg-pink">
</div>
                                    </div>
                                </div>
                                <div class="d-flex mt-2">
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i><asp:Label ID="lblTotalGrowth"
    runat="server">
</asp:Label></span>from last month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body ">
                                <div>
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Completed Projects</span>
                                        <h5>
                                            <asp:Label ID="lblCompletedProjects" runat="server"></asp:Label>
                                        </h5>
                                    </div>
                                    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 100%; height: 5px;">
                                        <div id="divCompletedProjectsBar"
     runat="server"
     class="progress-bar bg-success">
</div>
                                    </div>
                                </div>
                                <div class="d-flex mt-2">
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i><asp:Label ID="lblCompletedGrowth"
    runat="server">
</asp:Label></span>from last month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body ">
                                <div>
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Pending Projects</span>
                                        <h5>
                                            <asp:Label ID="lblOnHoldProjects" runat="server"></asp:Label></asp:Label></h5>
                                    </div>
                                    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 100%; height: 5px;">
                                        <div id="divOnHoldProjectsBar"
     runat="server"
     class="progress-bar bg-danger">
</div>
                                    </div>
                                </div>
                                <div class="d-flex mt-2">
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-danger fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i><asp:Label ID="lblOnHoldGrowth"
    runat="server">
</asp:Label></span>from last month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body ">
                                <div>
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">New Projects</span>
                                        <h5>
                                            <asp:Label ID="lblOverDueProjects" runat="server"></asp:Label>
                                        </h5>
                                    </div>
                                    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 100%; height: 5px;">
<div id="divOverDueProjectsBar"
     runat="server"
     class="progress-bar bg-purple">
</div>
                                    </div>
                                </div>
                                <div class="d-flex mt-2">
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i><asp:Label ID="lblOverDueGrowth"
    runat="server">
</asp:Label></span>from last month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /Total Exponses -->

            <!-- Project Graph -->
            <div class="col-lg-6 col-md-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-header border-0">
                        <div class="d-flex flex-wrap justify-content-between align-items-center">
                            <div class="d-flex align-items-center ">
                                <span class="me-2"><i class="ti ti-chart-pie text-danger"></i></span>
                                <h5>Projects By Tasks</h5>
                            </div>
                            <div class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Office Management App
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-2">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">PRO-001</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">PRO-002</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">PRO-004</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row align-items-center">
                            <div class="col-md-6 d-flex justify-content-center">
                                <div id="project-report"></div>


                                    <!-- report Project
                                            <div id="apexcharts2vlgg6z0j" class="apexcharts-canvas apexcharts2vlgg6z0j apexcharts-theme-" style="width: 280px; height: 237px;">
                                                <svg id="SvgjsSvg1043" width="280" height="237" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)">
                                                    <foreignObject x="0" y="0" width="280" height="237">
                                                        <div class="apexcharts-legend" xmlns="http://www.w3.org/1999/xhtml"></div>
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
                                                    </foreignObject><g id="SvgjsG1045" class="apexcharts-inner apexcharts-graphical" transform="translate(23.33333333333333, 0)"><defs id="SvgjsDefs1044"><clipPath id="gridRectMask2vlgg6z0j"><rect id="SvgjsRect1046" width="233.33333333333334" height="233.33333333333334" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                                    </clipPath>
                                                        <clipPath id="gridRectBarMask2vlgg6z0j">
                                                            <rect id="SvgjsRect1047" width="239.33333333333334" height="239.33333333333334" x="-3" y="-3" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                                        </clipPath>
                                                        <clipPath id="gridRectMarkerMask2vlgg6z0j">
                                                            <rect id="SvgjsRect1048" width="233.33333333333334" height="233.33333333333334" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                                        </clipPath>
                                                        <clipPath id="forecastMask2vlgg6z0j"></clipPath>
                                                        <clipPath id="nonForecastMask2vlgg6z0j"></clipPath>
                                                    </defs>
                                                        <g id="SvgjsG1051" class="apexcharts-pie">
                                                            <g id="SvgjsG1052" transform="translate(0, 0) scale(1)">
                                                                <g id="SvgjsG1053" class="apexcharts-slices">
                                                                    <g id="SvgjsG1054" class="apexcharts-series apexcharts-pie-series" seriesName="Pending" rel="1" data:realIndex="0">
                                                                        <path id="SvgjsPath1055" d="M 116.66666666666667 8.845528455284537 A 107.82113821138213 107.82113821138213 0 0 1 219.21066275696202 149.98523072683378 L 120.47089273184729 117.90273464416646 C 118.56877969925698 117.28470065541657 116.66666666666667 114.66666666666667 116.66666666666667 112.66666666666667 L 116.66666666666667 8.845528455284537 " fill="rgba(13,202,240,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-pie-slice-0" index="0" j="0" data:angle="108" data:startAngle="0" data:strokeWidth="2" data:value="30" data:pathOrig="M 116.66666666666667 8.845528455284537 A 107.82113821138213 107.82113821138213 0 0 1 219.21066275696202 149.98523072683378 L 120.47089273184729 117.90273464416646 C 118.56877969925698 117.28470065541657 116.66666666666667 114.66666666666667 116.66666666666667 112.66666666666667 L 116.66666666666667 8.845528455284537 " stroke="#ffffff"></path>
                                                                    </g>
                                                                    <g id="SvgjsG1056" class="apexcharts-series apexcharts-pie-series" seriesName="OnxHold" rel="2" data:realIndex="1">
                                                                        <path id="SvgjsPath1057" d="M 219.21066275696202 149.98523072683378 A 107.82113821138213 107.82113821138213 0 0 1 180.04234159270553 203.89579983252486 L 119.01780767583656 119.90273464416646 C 117.84223717125161 118.28470065541657 118.56877969925698 117.28470065541657 120.47089273184729 117.90273464416646 L 219.21066275696202 149.98523072683378 " fill="rgba(171,71,188,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-pie-slice-1" index="0" j="1" data:angle="36" data:startAngle="108" data:strokeWidth="2" data:value="10" data:pathOrig="M 219.21066275696202 149.98523072683378 A 107.82113821138213 107.82113821138213 0 0 1 180.04234159270553 203.89579983252486 L 119.01780767583656 119.90273464416646 C 117.84223717125161 118.28470065541657 118.56877969925698 117.28470065541657 120.47089273184729 117.90273464416646 L 219.21066275696202 149.98523072683378 " stroke="#ffffff"></path>
                                                                    </g>
                                                                    <g id="SvgjsG1058" class="apexcharts-series apexcharts-pie-series" seriesName="InxProgress" rel="3" data:realIndex="2">
                                                                        <path id="SvgjsPath1059" d="M 180.04234159270553 203.89579983252486 A 107.82113821138213 107.82113821138213 0 0 1 53.29099174062782 203.89579983252486 L 114.31552565749678 119.90273464416646 C 115.49109616208173 118.28470065541657 117.84223717125161 118.28470065541657 119.01780767583656 119.90273464416646 L 180.04234159270553 203.89579983252486 " fill="rgba(255,193,7,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-pie-slice-2" index="0" j="2" data:angle="72" data:startAngle="144" data:strokeWidth="2" data:value="20" data:pathOrig="M 180.04234159270553 203.89579983252486 A 107.82113821138213 107.82113821138213 0 0 1 53.29099174062782 203.89579983252486 L 114.31552565749678 119.90273464416646 C 115.49109616208173 118.28470065541657 117.84223717125161 118.28470065541657 119.01780767583656 119.90273464416646 L 180.04234159270553 203.89579983252486 " stroke="#ffffff"></path>
                                                                    </g>
                                                                    <g id="SvgjsG1060" class="apexcharts-series apexcharts-pie-series" seriesName="Completed" rel="4" data:realIndex="3">
                                                                        <path id="SvgjsPath1061" d="M 53.29099174062782 203.89579983252486 A 107.82113821138213 107.82113821138213 0 0 1 116.64784832811183 8.845530097494375 L 116.66596853496942 112.66666672759015 C 116.66631760081805 114.66666669712842 115.49109616208173 118.28470065541657 114.31552565749678 119.90273464416646 L 53.29099174062782 203.89579983252486 " fill="rgba(3,201,90,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-pie-slice-3" index="0" j="3" data:angle="144" data:startAngle="216" data:strokeWidth="2" data:value="40" data:pathOrig="M 53.29099174062782 203.89579983252486 A 107.82113821138213 107.82113821138213 0 0 1 116.64784832811183 8.845530097494375 L 116.66596853496942 112.66666672759015 C 116.66631760081805 114.66666669712842 115.49109616208173 118.28470065541657 114.31552565749678 119.90273464416646 L 53.29099174062782 203.89579983252486 " stroke="#ffffff"></path>
                                                                    </g>
                                                                </g>
                                                            </g>
                                                        </g>
                                                        <line id="SvgjsLine1062" x1="0" y1="0" x2="233.33333333333334" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
                                                        <line id="SvgjsLine1063" x1="0" y1="0" x2="233.33333333333334" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line>
                                                    </g><g id="SvgjsG1049" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g><g id="SvgjsG1050" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g></svg><div class="apexcharts-tooltip apexcharts-theme-dark">
                                                        <div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-0" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(13, 202, 240);"></span>
                                                            <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                                <div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div>
                                                                <div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div>
                                                                <div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div>
                                                            </div>
                                                        </div>
                                                        <div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-1" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(171, 71, 188);"></span>
                                                            <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                                <div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div>
                                                                <div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div>
                                                                <div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div>
                                                            </div>
                                                        </div>
                                                        <div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-2" style="order: 3;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(255, 193, 7);"></span>
                                                            <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                                <div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div>
                                                                <div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div>
                                                                <div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div>
                                                            </div>
                                                        </div>
                                                        <div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-3" style="order: 4;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(3, 201, 90);"></span>
                                                            <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                                <div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div>
                                                                <div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div>
                                                                <div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
											-->

                                
                            </div>
                            <div class="col-md-6">
                                <div class="row gy-4">
                                    <div class="col-md-6">
                                        <p class="fs-16 project-report-badge-blue fw-normal mb-0 text-gray-5">Inprogress </p>
                                        <p class="fs-20 fw-bold text-dark ">
                                            <asp:Label ID="lblActivePercent" runat="server"></asp:Label>%</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="fs-16 project-report-badge-purple mb-0  fw-normal text-gray-5">On Hold</p>
                                        <p class="fs-20 fw-bold text-dark ">
                                            <asp:Label ID="lblOnHoldPercent" runat="server"></asp:Label>%</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="fs-16 project-report-badge-warning  mb-0 fw-normal text-gray-5"> Pending </p>
                                        <p class="fs-20 fw-bold text-dark ">
                                            <asp:Label ID="lblPendingPercent" runat="server"></asp:Label>%</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="fs-16 project-report-badge-success  mb-0 fw-normal text-gray-5">Completed</p>
                                        <p class="fs-20 fw-bold text-dark ">
                                            <asp:Label ID="lblCompletedPercent" runat="server"></asp:Label>%</p>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <!-- /Total Exponses -->


        </div>


        <!--Filter Table -->
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                <h5>Project List</h5>
                <div class="mb-3">
    Show
    <asp:DropDownList ID="ddlPageSize"
    runat="server"
    AutoPostBack="true"
    OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">

    <asp:ListItem Value="0">All</asp:ListItem>
    <asp:ListItem Value="5">5</asp:ListItem>
    <asp:ListItem Value="10" Selected="True">10</asp:ListItem>
    <asp:ListItem Value="25">25</asp:ListItem>
    <asp:ListItem Value="50">50</asp:ListItem>
    <asp:ListItem Value="100">100</asp:ListItem>

</asp:DropDownList>
    Records
</div>
                    <!-- Old 
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
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Select Priority
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Low</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Medium</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">High</a>
                            </li>
                        </ul>
                    </div>
                    <div class="dropdown me-3">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Select Status
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Active</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Inactive</a>
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


                    filter-->

                <div class="row align-items-center g-2 mb-3">
<!-- 
    <div class="col-md-3">
        <asp:TextBox ID="txtDateRange"
            runat="server"
            CssClass="form-control"
            placeholder="Date Range">
        </asp:TextBox>
    </div> -->

    <div class="col-md-2">
       <asp:DropDownList ID="ddlPriority"
    runat="server"
    CssClass="form-select"
    AutoPostBack="true"
    OnSelectedIndexChanged="FilterChanged">

    <asp:ListItem Text="All Priority" Value=""></asp:ListItem>
    <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
    <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
    <asp:ListItem Text="High" Value="High"></asp:ListItem>

</asp:DropDownList>
    </div>

    <div class="col-md-2">
       <asp:DropDownList ID="ddlStatus"
    runat="server"
    CssClass="form-select"
    AutoPostBack="true"
    OnSelectedIndexChanged="FilterChanged">

    <asp:ListItem Text="All Status" Value=""></asp:ListItem>
    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
    <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>

</asp:DropDownList>
    </div>

    <div class="col-md-2">
        <asp:DropDownList ID="ddlSortBy"
    runat="server"
    CssClass="form-select"
    AutoPostBack="true"
    OnSelectedIndexChanged="FilterChanged">

    <asp:ListItem Text="Sort By" Value=""></asp:ListItem>
    <asp:ListItem Text="Recently Added" Value="Recently Added"></asp:ListItem>
    <asp:ListItem Text="Ascending" Value="Ascending"></asp:ListItem>
    <asp:ListItem Text="Desending" Value="Desending"></asp:ListItem>
    <asp:ListItem Text="Last Month" Value="Last Month"></asp:ListItem>
    <asp:ListItem Text="Last 7 Days" Value="Last 7 Days"></asp:ListItem>

</asp:DropDownList>
    </div>

    <div class="col-md-3">
        <asp:TextBox ID="txtSearch"
    runat="server"
    CssClass="form-control"
    AutoPostBack="true"
    OnTextChanged="FilterChanged"
    placeholder="Search">
</asp:TextBox>
    </div>

</div>

                </div>
            </div>



            <!-- List of project report-->
            <asp:GridView ID="gvProjectReport"
    runat="server"
    AutoGenerateColumns="False"
    AllowPaging="true"
    PageSize="10"
    OnPageIndexChanging="gvProjectReport_PageIndexChanging"
    CssClass="table table-bordered table-striped">

                <Columns>

                    <asp:BoundField DataField="ProjectId"
                        HeaderText="Project ID" />

                    <asp:BoundField DataField="ProjectName"
                        HeaderText="Project Name" />

                    <asp:BoundField DataField="Leader"
                        HeaderText="Leader" />

                    <asp:BoundField DataField="Members"
                        HeaderText="Members" />

                    <asp:BoundField DataField="Deadline"
                        HeaderText="Deadline"
                        DataFormatString="{0:dd-MMM-yyyy}" />

                    <asp:BoundField DataField="Priority"
                        HeaderText="Priority" />

                    <asp:BoundField DataField="Status"
                        HeaderText="Status" />

                </Columns>
            </asp:GridView>
        </div>

    <asp:HiddenField ID="hfPending" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hfOnHold" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hfInProgress" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hfCompleted" runat="server" ClientIDMode="Static" />

</asp:Content>
