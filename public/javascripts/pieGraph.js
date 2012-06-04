
function pieGraphfunction(opt1,opt2,opt3,opt4,opt5){

  //opt1=<%= @nameOfOption1.string %> dont know why it cant output string??

  var data = [
    ["回答1",opt1],["回答2", opt2], ["回答3", opt3], 
    ["回答4", opt4],["回答５", opt5]];
  
  var plot1 = jQuery.jqplot ('chartDiv', [data], 
    { 
      seriesDefaults: {

        renderer: jQuery.jqplot.PieRenderer, 
        rendererOptions: {
          showDataLabels: true
        }
      }, 
      legend: { show:true, location: 'e' }
    }
  );
}



