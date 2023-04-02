// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable();
});

$(document).ready(function() {
  $('#logTable').DataTable();
});

$(document).ready(function() {
$('#recentLog').dataTable({
    "bPaginate": true,
    "bLengthChange": true,
    "bFilter": true,
    "bInfo": true,
    "iDisplayLength": 5,
    "bAutoWidth": true });
});

$(document).ready(function() {
$('#CandidateTable_1').dataTable({
    "bPaginate": false,
    "bLengthChange": false,
    "bFilter": false,
    "bInfo": false,
    "iDisplayLength": 5,
    "bAutoWidth": false });
});

$(document).ready(function() {
$('#testTable').dataTable({
    "bPaginate": false,
    "bLengthChange": false,
    "bFilter": false,
    "bInfo": false,
    "iDisplayLength": 5,
    "bAutoWidth": false });
});

$(document).ready(function() {
$('#interviewTable').dataTable({
    "bPaginate": false,
    "bLengthChange": false,
    "bFilter": false,
    "bInfo": false,
    "iDisplayLength": 5,
    "bAutoWidth": false });
});

$(document).ready(function() {
$('#homeDataTable').dataTable({
    "bPaginate": false,
    "bLengthChange": false,
    "bFilter": false,
    "bInfo": false,
    "iDisplayLength": 5,
    "bAutoWidth": false });
});



