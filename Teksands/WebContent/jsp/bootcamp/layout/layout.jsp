<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Candidate Management System - Teksands</title>
    
    <META Http-Equiv="Cache-Control" Content="no-cache">
	<META Http-Equiv="Pragma" Content="no-cache">
	<META Http-Equiv="Expires" Content="0">
    
    <link rel="shortcut icon" href="/resources/images/cropped-ts-favicon.png" />
    
    <link href="/resources/cms/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/cms/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/resources/cms/css/custom.css" rel="stylesheet">
    <link href="/resources/cms/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="/resources/cms/vendor/datatables/select.dataTables.min.css" rel="stylesheet">
    <link href="/resources/cms/plugin/jquery-ui.css" rel="stylesheet">
    <link href="/resources/cms/plugin/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/cms/plugin/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="/resources/cms/plugin/sweetalerts/custom_sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="/resources/cms/plugin/flatpickr/form-widgets.css" rel="stylesheet" type="text/css">
    <link href="/resources/cms/plugin/flatpickr/flatpickr.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<link href="/resources/cms/plugin/toast/jquery.toast.css" rel="stylesheet" type="text/css">
	
	<script src="/resources/cms/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/cms/plugin/jquery-ui.js"></script>
   
</head>

<body id="page-top">
    <div id="wrapper">
        <tiles:insertAttribute name="menu"></tiles:insertAttribute>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <tiles:insertAttribute name="header"></tiles:insertAttribute>
                <tiles:insertAttribute name="content"></tiles:insertAttribute>
                <tiles:insertAttribute name="footer"></tiles:insertAttribute>
            </div>
        </div>
    </div>
    
    <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
    
    <script src="/resources/cms/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/cms/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/cms/js/sb-admin-2.min.js"></script>
    <script src="/resources/cms/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/cms/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="/resources/cms/js/demo/datatables-demo.js"></script>
    <script src="<c:url value="/resources/js/overlay/loadingoverlay.js"/>"></script>
	<script src="/resources/cms/plugin/sweetalerts/sweetalert2.min.js"></script>
    <script src="/resources/cms/plugin/sweetalerts/sweet_alerts.js"></script>
    <script src="/resources/cms/plugin/flatpickr/flatpickr.js"></script>
    <script src="/resources/cms/plugin/flatpickr/custom-flatpickr.js"></script>
    <script src="/resources/cms/plugin/toast/jquery.toast.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
</body>
</html>