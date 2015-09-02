google.maps.event.addDomListener(window, "load", function () {
  handler = Gmaps.build('Google');
  handler.buildMap({ internal: { id: 'map' } }, function() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(setupMap);
    }
  });

  var setupMap = function(pos) {
    var marker = handler.addMarker({
      lat: pos.coords.latitude,
      lng: pos.coords.longitude
    }, 
    {
      draggable: true
    });
    handler.map.centerOn(marker);
  };
});