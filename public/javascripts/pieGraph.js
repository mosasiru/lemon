function pieGraphfunction2(opt1,opt2,opt1s,opt2s){
  var data = [
      [opt1s,opt1],[opt2s, opt2]]; 
  plot1(data);
}

function pieGraphfunction3(opt1,opt2,opt3,opt1s,opt2s,opt3s){
  var data = [
      [opt1s,opt1],[opt2s, opt2], [opt3s, opt3]]; 
  plot1(data);
}

function pieGraphfunction4(opt1,opt2,opt3,opt4,opt1s,opt2s,opt3s,opt4s){
  var data = [
      [opt1s,opt1],[opt2s, opt2], [opt3s, opt3], [opt4s, opt4]] ; 
  plot1(data);
}

function pieGraphfunction5(opt1,opt2,opt3,opt4,opt5,opt1s,opt2s,opt3s,opt4s,opt5s){

  //opt1=<%= @nameOfOption1.string %> dont know why it cant output string??
  var data = [
      [opt1s,opt1],[opt2s, opt2], [opt3s, opt3], 
      [opt4s,opt4],[opt5s, opt5]];
//    ["回答1",opt1],["回答2", opt2], ["回答3", opt3], 
//    ["回答4", opt4],["回答５", opt5]];
  plot1(data);  
}

function plot1(data) {
  var plot1 = jQuery.jqplot ('chartDiv1', [data], 
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
	
};

