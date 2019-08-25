# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph1 = ->
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["学習時間:"+totalstudytime+"時間", "達成まで"+(purposetime -  usertime -  totalstudytime)+"時間"],
            datasets: [{
                label: '# of Votes',
                data: [totalstudytime, purposetime -  usertime -  totalstudytime],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',

                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',

                ],
                borderWidth: 1


            }]

        },
        options: {
             legend: {
                 display: true
             },
             tooltips: {
                 callbacks: {
                   label: (tooltipItem) -> ["グラフ"]
                 }
             }
        }
    })

window.draw_graph2 = -> 
    ctx = document.getElementById("studyChart").getContext('2d')
    studyChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: graphdays,
            datasets: [{
                label: '学習時間',
                data: graphtimes,
                backgroundColor: [
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    })