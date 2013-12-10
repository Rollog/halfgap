$(document).ready(function(){
	var mapOptions = {
		zoom: 8,
		center: new google.maps.LatLng(43, 11),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map($('#map')[0], mapOptions);

	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(
			function(p) {
				var coords = new google.maps.LatLng(p.coords.latitude, p.coords.longitude);

				$('span#position').text(coords);
				if (myMarker) myMarker.setMap(null);
				var myMarker = new google.maps.Marker(
					{
						position: coords,
						map: map,
						title: "You are here"
					});
			},
			function(error) {
				alert(error.message);
			},
			{maximumAge: 600000}
		);
	}
	else { console.error("Your browser doesn't support GMAPS API"); }
});