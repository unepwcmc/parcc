window.Settings = {
  vulnerability_table: {
    "sScrollX": "100%",
    "scrollCollapse": true,
    "columns" : [
      { "sWidth": "200px" },
      { "sWidth": "120px" },
      { "sWidth": "200px" },
      { "sWidth": "120px" },
      { "sWidth": "400px" },
      { "sWidth": "380px" }
    ],
    "columnDefs": [
      { "sortable": true, "targets": 0 },
      { "sortable": true, "targets": 1 },
      { "sortable": false, "targets": 2 },
      { "sortable": true, "targets": 3 },
      { "sortable": false, "targets": 4 },
      { "sortable": false, "targets": 5 },
    ],
    "language": {
      "emptyTable": "No species of this taxon have been assessed as being vulnerable to climate change"
    }
  },
  suitability_table: {
    "columns" : [
      { "sWidth": "30%" },
      { "sWidth": "25%" },
      { "sWidth": "25%" },
      { "sWidth": "20%" }
    ],
    "columnDefs": [
      { "sortable": true, "targets": 0 },
      { "sortable": true, "targets": 1 },
      { "sortable": true, "targets": 2 },
      { "sortable": false, "targets": 3 }
    ],
    "language": {
      "emptyTable": "No species of this taxon have been assessed as being vulnerable to climate change"
    }
  }
}
