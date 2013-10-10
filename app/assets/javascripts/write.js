//= require modernizr
//= require jquery
//= require jquery_ujs
//= require jquery.simplyCountable
//= require jquery.slugit

// for p-location geo fields
// TODO: extract into plugin and out of global namespace
function getLocation() {
  if (Modernizr.geolocation) {
    navigator.geolocation.getCurrentPosition(populateGeoFields);
  }
}

// TODO: extract into plugin and out of global namespace
function populateGeoFields(position) {
  var latitude  = position.coords.latitude;
  var longitude = position.coords.longitude;
  var altitude  = position.coords.altitude;

  $("#notes.new #note_location_latitude" ).val(latitude);
  $("#notes.new #note_location_longitude").val(longitude);
  $("#notes.new #note_location_altitude" ).val(altitude);
}


// for dt-published datetime field
// TODO: extract into plugin and out of global namespace
function ISODateString(d){
  function pad(n) { return n < 10 ? '0' + n : n }
  return d.getUTCFullYear()+'-'
    + pad(d.getUTCMonth()+1)+'-'
    + pad(d.getUTCDate())+'T'
    + pad(d.getUTCHours())+':'
    + pad(d.getUTCMinutes())+':'
    + pad(d.getUTCSeconds())+'-07:00'
}


$(function() {
  // disable subtitle field by default
  $('.p-hs-subtitle').attr("disabled", "disabled");

  // enable subtitle if title already has a value
  if($("#note_title").val() != "") {
    $("#note_subtitle").removeAttr("disabled");
  }

  // re-enable subtitle field if title exists
  // combine title and subtitle fields
  $("#note_title, #note_subtitle").keyup(function() {
    if($("#note_title").val() != "") {
      $("#note_subtitle").removeAttr("disabled");
    }

    var slugText = $("#note_title").val() + " " + $("#note_subtitle").val();

    // triggers a manual keyup for slugIt to update the $("slug") field live
    $("#p-name").val(slugText).keyup();
  });

  // generate slug from title + subtitle
  $("#p-name").slugIt( { output: "#note_slug" } );

  // for notes
  // $('#content').simplyCountable({
  //   counter:           '#content-count',
  //   countDirection:    'up',
  //   maxCount:          120,
  //   safeClass:         'under',
  //   overClass:         'over',
  //   thousandSeparator: ','
  // });

  // for notes
  // content word count
  $('#note_content').simplyCountable({
    counter:           '#content-count',
    countType:         'words',
    countDirection:    'up',
    safeClass:         '',
    thousandSeparator: ','
  });

  // prints something like 2009-09-28T19:03:12Z
  $("#notes.new .dt-published").val(ISODateString(new Date()))

  // ask user to access their location
  // populate lat/lon/alt fields
  // TODO: extract into plugin and out of global namespace
  getLocation();
});
