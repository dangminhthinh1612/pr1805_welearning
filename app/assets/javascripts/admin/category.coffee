$(document).on 'turbolinks:load', ->
  arr_names = $('#category_chart').data('name')
  arr_size = $('#category_chart').data('count')
  data = arr_names.map (name, index) -> 
    return [name, arr_size[index]]
  $('#category_chart').highcharts
    chart: type: 'pie'
    title: text: ''
    subtitle: text: ''
    plotOptions: 
      pie:
        allowPointSelect: true
        cursor: 'pointer'
        dataLabels: enabled: false
        showInLegend: true
    series: [{
      name: 'Số lượng'
      colorByPoint: true
      data: data
    }]
return
