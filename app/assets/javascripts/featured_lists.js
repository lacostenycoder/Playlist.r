$(document).ready(function(){
  var frames = $('iframes');
  var testWidget;
  var playable = 0;
  var tracks = $('iframe')
  var checkLoaded = function(){
    if(playable > 5){
        deleteEmpty(tracks);// run when condition is met
    }
    else {
        setTimeout(checkLoaded, 1000); // check again in a second
    }
  }
  $('#list_search').click(function(){
    waitMessage();
  });
});

function waitMessage(){
  var target = $('#list_building')
  if(target.text() ==""){
    $('#list_building').append("Please wait, list is is being generated");
  }
}

var frames = $('iframe')

function deleteEmpty() {
  console.log('deleteEmpty called');
  for(i=0;i<songs.length;i++){
    var failed = 0
    testWidget = SC.Widget(songs[i]);
    console.log("testing" + i);
    try {
      testWidget.pause();
    }
    catch(err) {
      failed = 1;
      console.log('catch failed');
    }
    if(failed > 0){
      console.log("attempting to remove frame" + i);
      songs[i].remove();
      failed = 0;
    }
  }
}
