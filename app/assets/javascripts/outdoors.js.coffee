handler = undefined
placeMarker = undefined

placeMarker = (location) ->
  marker = new google.maps.Marker(
    position: location
    map: handler.getMap()
    draggable: true
    title: "Drag me!"
  )
  document.getElementById("outdoor_name").value = "Novo Outdoor"
  document.getElementById("outdoor_latitude").value = location.lat()
  document.getElementById("outdoor_longitude").value = location.lng()

@buildMap = (markers) ->
  handler = Gmaps.build 'Google'
  
  handler.buildMap {
    provider: {}, 
    internal: {id: 'map2'}}
    , ->
      markers = handler.addMarkers(markers)
      handler.bounds.extendWith markers
      handler.fitMapToBounds()
      google.maps.event.addListener handler.getMap(), "click", (event) ->
        placeMarker event.latLng