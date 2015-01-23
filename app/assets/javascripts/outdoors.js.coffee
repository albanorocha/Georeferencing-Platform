handler = undefined
placeMarker = undefined
geocoder = undefined

### --------- Build maps, passed by html javascript call  ---------###
@buildMap = (markers) ->
  handler = Gmaps.build 'Google'
  handler.buildMap {
    provider: { }, 
    internal: {id: 'map'}}
    , ->
      markers = handler.addMarkers(markers)
      handler.bounds.extendWith markers
      handler.fitMapToBounds()


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
  handler = Gmaps.build 'Google'
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


@buildNewMap = (markers) ->
  handler = Gmaps.build 'Google'
  geocoder = new google.maps.Geocoder()
  
  handler.buildMap {
    provider: {
      center: new google.maps.LatLng(-5.79447849999999900, -35.210953099999980000),  
      zoom: 13
    }, 
    internal: {id: 'map'}}
    , ->
      markers = handler.addMarkers(markers)
      google.maps.event.addListenerOnce handler.getMap(), "click", (event) ->
        placeNewMarker event.latLng
### ------------------- End builded maps ------------------- ###

###
  When click on a new map add a marker and put the new position
###
placeNewMarker = (location) ->
  image = "/assets/marcador_red.png" 
  marker = new google.maps.Marker(
    position: location
    map: handler.getMap()
    animation: google.maps.Animation.DROP
    draggable: true
    icon: image
    title: "Drag me!"
  )
  handler.getMap().panTo(location)
  document.getElementById("dashboard_outdoor_name").value = "Novo Outdoor"
  document.getElementById("dashboard_outdoor_latitude").value = location.lat()
  document.getElementById("dashboard_outdoor_longitude").value = location.lng()
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
  document.getElementById("dashboard_outdoor_latitude").value = location.lat()
  document.getElementById("dashboard_outdoor_longitude").value = location.lng()

###
  When build a new map, convert the new marker "LatLng Position" to a "Formatted Address" 
###
codeLatLng = (location) ->
  console.log(location)
  lat = location.lat()
  lng = location.lng()
  latlng = new google.maps.LatLng(lat, lng)
  geocoder.geocode
    latLng: latlng
  , (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      if results[1]
        document.getElementById("dashboard_outdoor_address").value = results[1].formatted_address
    else
      alert "Geocoder failed due to: " + status