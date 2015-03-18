handler = undefined
placeMarker = undefined
geocoder = undefined
marker = undefined
listenerMapClick = undefined
panorama = undefined;

### --------- Build maps, passed by html javascript call  ---------###
@buildMap = (markers) ->
  handler = Gmaps.build 'Google',  { markers: { clusterer: {gridSize: 20, maxZoom: 50} } }
  handler.buildMap {
    provider: { }, 
    internal: {id: 'map'}}
    , ->
      markers = handler.addMarkers(markers)
      handler.bounds.extendWith markers
      handler.fitMapToBounds()

  panorama = handler.getMap().getStreetView()
  panorama.setPov (
    heading: 265
    pitch: 0
  )


@buildEmptyMap = () ->
  handler = Gmaps.build 'Google'
  
  handler.buildMap {
    provider: {
      center: new google.maps.LatLng(-5.79447849999999900, -35.210953099999980000),  
      zoom: 13
    }, 
    internal: {id: 'map'}}
    , ->


@buildEditMap = (markers, lat, lng) ->
  handler = Gmaps.build 'Google',  { markers: { clusterer: {gridSize: 20, maxZoom: 50} } }
  geocoder = new google.maps.Geocoder()
  latLng = new google.maps.LatLng(lat, lng)
  handler.buildMap {
    provider: {
      center: latLng,  
      zoom: 15
    }, 
    internal: {id: 'map'}}
    , ->
      markers = handler.addMarkers(markers)
  placeNewMarker latLng

  panorama = handler.getMap().getStreetView()
  panorama.setPov (
    heading: 265
    pitch: 0
  )


@buildNewMap = (markers) ->
  handler = Gmaps.build 'Google',  { markers: { clusterer: {gridSize: 20, maxZoom: 50} } }
  geocoder = new google.maps.Geocoder()
  
  handler.buildMap {
    provider: {
      center: new google.maps.LatLng(-5.79447849999999900, -35.210953099999980000),  
      zoom: 13
    }, 
    internal: {id: 'map'}}
    , ->
      markers = handler.addMarkers(markers)
      listenerMapClick = google.maps.event.addListenerOnce handler.getMap(), "click", (event) ->
        placeNewMarker event.latLng

  panorama = handler.getMap().getStreetView()
  panorama.setPov (
    heading: 265
    pitch: 0
  )
### ------------------- End builded maps ------------------- ###

###
  When click on a new map add a marker and put the new position
###
placeNewMarker = (location) ->
  marker = new google.maps.Marker(
    position: location
    map: handler.getMap()
    animation: google.maps.Animation.DROP
    draggable: true
    title: "Drag me!!"
  )

  handler.getMap().panTo(location)
  document.getElementById("outdoor_latitude").value = location.lat()
  document.getElementById("outdoor_longitude").value = location.lng()
  google.maps.event.addListener marker, 'drag', (event) ->
    showNewPosition event.latLng
  google.maps.event.addListener marker, 'dragend', (event) ->
    showNewPositionAddress event.latLng
  codeLatLng(location)

###
  Refresh the new marker position Address
###
showNewPositionAddress = (location) ->
  handler.getMap().panTo(location)
  codeLatLng(location)

###
  Refresh the new marker position LatLng Code
###
showNewPosition = (location) ->
  document.getElementById("outdoor_latitude").value = location.lat()
  document.getElementById("outdoor_longitude").value = location.lng()

###
  When build a new map, convert the new marker "LatLng Position" to a "Formatted Address" 
###
codeLatLng = (location) ->
  lat = location.lat()
  lng = location.lng()
  latlng = new google.maps.LatLng(lat, lng)
  geocoder.geocode
    latLng: latlng
  , (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      if results[1]
        document.getElementById("outdoor_address").value = results[1].formatted_address
    else
      alert "ERRO Geocoder: " + status

###
  When build a new map, convert the Address to a marker "LatLng Position"
###
@codeAddress = () ->
  address = document.getElementById("outdoor_address").value
  geocoder.geocode
    address: address
  , (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      google.maps.event.removeListener(listenerMapClick)
      if marker != undefined
        marker.setMap(null)
      handler.getMap().setCenter results[0].geometry.location
      placeNewMarker(results[0].geometry.location)
    else
      alert "ERRO Geocoder: " + status


###
  Build stree viewer panorama
###
@toggleStreetView = (lat, lng) ->
  position = new google.maps.LatLng(lat, lng);
  panorama.setPosition position
  toggle = panorama.getVisible()
  if toggle is false
    panorama.setVisible true
  else
    panorama.setVisible false

###
  Build stree viewer panorama
###
@newMarkerStreetView = () ->
  lat = document.getElementById("outdoor_latitude").value
  lng = document.getElementById("outdoor_longitude").value 
  position = new google.maps.LatLng(lat, lng);
  panorama.setPosition position
  toggle = panorama.getVisible()
  if toggle is false
    panorama.setVisible true
  else
    panorama.setVisible false
