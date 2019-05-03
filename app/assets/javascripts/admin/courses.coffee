$(document).on 'turbolinks:load', ->
  Highcharts.setOptions global: useUTC: false
  $('#day_chart').highcharts
    title:
      text: ''
    subtitle:
      text: ''
    xAxis:
      type: "datetime"
    yAxis:
      title: text: ''
    legend:
      enable: false
    plotOptions: series: {
      pointStart: Date.now() - 6 * 24 * 36e5,
      pointInterval: 24 * 36e5
    }
    series: [
      {
        name: 'Lượt mua'
        data: [
          7.0
          6.9
          9.5
          14.5
          18.2
          21.5
          25.2
        ]
      }
    ]
return
