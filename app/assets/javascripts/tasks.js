var client_lat = document.getElementById('lat').value;
var client_long = document.getElementById('long').value;
var client_name = document.getElementById('client-name').innerText;
var v_lat_one = document.getElementById('v-lat-one').value;
var v_long_one = document.getElementById('v-long-one').value;
var v_name_one = document.getElementById('v-name-one').value;
var v_lat_two = document.getElementById('v-lat-two').value;
var v_long_two = document.getElementById('v-long-two').value;
var v_name_two = document.getElementById('v-name-two').value;

var handler = Gmaps.build('Google');
handler.buildMap({ internal: {id: 'multi_markers'}}, function(){
var markers = handler.addMarkers([
{ lat: client_lat, lng: client_long, picture: {
          "url": "http://maps.google.com/mapfiles/kml/pal4/icon43.png",
          "width":  36,
          "height": 36 },
  infowindow: client_name },
{ lat: v_lat_one, lng: v_long_one, infowindow: v_name_one },
{ lat: v_lat_two, lng: v_long_two, infowindow: v_name_two }
]);
handler.bounds.extendWith(markers);
handler.fitMapToBounds();
});