window.Parcc = class Parcc
  constructor: ->
    @initializeMap($('#map'))
    @initializeTooltip()
    @initializeVerticalNav()
    @initializeVulnerabilityTable()
    @initializeSuitabilityTable()

  initializeMap: ($mapContainer) ->
    new Map($mapContainer).render()

  initializeTooltip: ->
    $(".tooltip").tooltip()

  initializeVerticalNav: ->
    $verticalNavEl = $('.vertical-nav')

    if $verticalNavEl.length > 0
      new VerticalNav($verticalNavEl)

  initializeVulnerabilityTable: ->
    $container = $('.vulnerability-table-container')
    $tabs = $('#vulnerability-tabs')
    settings = Settings.vulnerability_table

    vulnerabilityTable = new Table('.vulnerability-table', $container, settings)
    new TabsPane($tabs, vulnerabilityTable, 'vulnerability_table')

  initializeSuitabilityTable: ->
    $container = $('.suitability-table-container')
    $tabs = $('#suitability-tabs')
    settings = Settings.suitability_table

    suitabilityTable = new Table('.suitability-table', $container, settings)
    new TabsPane($tabs, suitabilityTable, 'suitability_changes_table')

$(document).ready(-> new Parcc())
