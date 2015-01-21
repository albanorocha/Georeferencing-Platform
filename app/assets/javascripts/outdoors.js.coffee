handler = undefined
placeMarker = undefined

placeMarker = (location) ->
  marker = new google.maps.Marker(
    position: location
    map: handler.getMap()
    draggable: true
    title: "Drag me!"
  )
  document.getElementById("dashboard_outdoor_name").value = "Novo Outdoor"
  document.getElementById("dashboard_outdoor_latitude").value = location.lat()
  document.getElementById("dashboard_outdoor_longitude").value = location.lng()

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

@buildNewMap = (markers) ->
  handler = Gmaps.build 'Google'
  
  handler.buildMap {
    provider: {
      center: new google.maps.LatLng(-5.79447849999999900, -35.210953099999980000),  
      zoom: 13
    }, 
    internal: {id: 'map'}}
    , ->
      markers = handler.addMarkers(markers)
      google.maps.event.addListener handler.getMap(), "click", (event) ->
        placeMarker event.latLng
