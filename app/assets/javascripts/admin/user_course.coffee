$(document).on 'turbolinks:load', ->
  $('#day_chart').highcharts
    chart:
        type: 'areaspline'
    title:
      text: ''
    subtitle:
      text: ''
    xAxis:
      categories: $('#day_chart').data('day')
    yAxis:
      title: text: ''
    legend:
      enable: false
    series: [
        name: 'Lượt mua'
        data: $('#day_chart').data('point')
        pointPlacement: 'on'
    ]
return
