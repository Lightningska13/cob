(function() {
	var activeInfoWindow
	window.onload=function() {
		var latlng=new google.maps.LatLng(41.915867, -85.059067);
		var options={
			center: latlng,
			zoom: 11,
			mapTypeId: google.maps.MapTypeId.HYBRID
		};
		var map=new google.maps.Map(document.getElementById("map"), options);
		
		var points = [
				new google.maps.LatLng(42.072035, -84.826271),
				new google.maps.LatLng(42.072312, -84.878431),
				new google.maps.LatLng(42.072783, -84.985675),
				new google.maps.LatLng(42.072425, -85.120083),
				new google.maps.LatLng(42.072068, -85.216958),
				new google.maps.LatLng(42.071546, -85.293660),
				new google.maps.LatLng(41.969754, -85.292847),
				new google.maps.LatLng(41.894248, -85.292187),
				new google.maps.LatLng(41.759791, -85.292027),
				new google.maps.LatLng(41.759233, -85.163298),
				new google.maps.LatLng(41.759496, -85.035044),
				new google.maps.LatLng(41.759632, -84.995297),
				new google.maps.LatLng(41.759755, -84.911503),
				new google.maps.LatLng(41.759944, -84.825025),
				new google.maps.LatLng(42.072035, -84.826271)
		];
				
		var polygon = new google.maps.Polygon({
				paths: points,
				map: map,
				strokeColor: "#0000FF",
				strokeOpacity: 0.75,
				strokeWeight: 2,
				fillOpacity: 0
		});

//Begin brownfield site code  ************************************************
//----------------------------------------------------------------------------		
//Begin site_1  **************************************************************
		var marker1 = new google.maps.Marker({
			position: new google.maps.LatLng(41.879597, -85.1958),
			map: map,
			title: "Former Putnam Hitch Site"
		});
		
		var content1 = "<div id='info'>"+
			"<h3>Former Putnam Hitch Site</h3>"+
			"<img src='images/brownfield/putnam.jpg' />"+
			"<p><b>Size:</b> 6.19 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<ul><li>Phase I Environmental Site Assessment</li>"+
			"<li>Phase II Environmental Site Assessment</li>"+
			"<li>Baseline Environmental Assessment Report</li></ul>"+
			"<p><b>Status:</b> No futher assessment required at this time.</p>"+
			"<p>The site has been purchased and redeveloped as <i>Wickey Custom Cabinets<i/></p>"
			"</div>";
		
		var infowindow1 = new google.maps.InfoWindow({
			});
			infowindow1.setContent(content1);
		
		google.maps.event.addListener(marker1, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow1.open(map, marker1);
			activeInfoWindow = infowindow1;
		});
//End site_1	****************************************************************	
//----------------------------------------------------------------------------		
//Begin site_2  **************************************************************
		var marker2 = new google.maps.Marker({
			position: new google.maps.LatLng(41.930040, -84.892630),
			map: map,
			title: "Former Wolverine Portland Cement Company Site"
		});
		
		var content2 = "<div id='info'>"+
			"<h3>Former Wolverine Portland Cement Company Site</h3>"+
			"<img src='images/brownfield/cement.jpg' />"+
			"<p><b>Size:</b> 3.42 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<ul><li>Phase II Environmental Site Assessment</li>"+
			"<li>Baseline Environmental Assessment</li></ul>"+
  		"<p><b>Status:</b> No futher assessment required at this time.</p>"+			
			"</div>";
		
		var infowindow2 = new google.maps.InfoWindow({
			});
			infowindow2.setContent(content2);
		
		google.maps.event.addListener(marker2, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow2.open(map, marker2);
			activeInfoWindow = infowindow2;
		});
//End site_2  *****************************************************************		
//-----------------------------------------------------------------------------		
//Begin site_3  ***************************************************************
		var marker3 = new google.maps.Marker({
			position: new google.maps.LatLng(41.946453, -84.889003),
			map: map,
			title: "Former Speedrack Advantage, LLC"
		});
		
		var content3 = "<div id='info'>"+
			"<h3>Former Speedrack Advantage, LLC</h3>"+
			"<img src='images/brownfield/acorn.jpg' />"+
			"<p><b>Size:</b> 15.92 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<ul><li>Phase II Environmental Site Assessment</li></ul>"+
			"</div>";
		
		var infowindow3 = new google.maps.InfoWindow({
			});
			infowindow3.setContent(content3);
		
		google.maps.event.addListener(marker3, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow3.open(map, marker3);
			activeInfoWindow = infowindow3;
		});
//End site_3	*****************************************************************	
//-----------------------------------------------------------------------------		
//Begin site_4*****************************************************************
		var marker4 = new google.maps.Marker({
			position: new google.maps.LatLng(41.93962, -84.99977),
			map: map,
			title: "Branch County Parking Lot"
		});
		
		var content4 = "<div id='info'>"+
			"<h3>Branch County Parking Lot</h3>"+
			"<p><b>Size:</b> 2.35 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<ul><li>Phase II Environmental Site Assessment</li></ul>"+			
			"</div>";
		
		var infowindow4 = new google.maps.InfoWindow({
			});
			infowindow4.setContent(content4);
		
		google.maps.event.addListener(marker4, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow4.open(map, marker4);
			activeInfoWindow = infowindow4;
		});
//End site_4*******************************************************************
//-----------------------------------------------------------------------------
//Begin site_5*****************************************************************
		var marker5 = new google.maps.Marker({
			position: new google.maps.LatLng(41.953300, -85.000500),
			map: map,
			title: "Emro #6153"
		});
		
		var content5 = "<div id='info'>"+
			"<h3>Emro #6153</h3>"+
			"<img src='images/brownfield/emro6153.jpg' />"+
			"<p><b>Size:</b> 0.44 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<li>Phase I Environmental Site Assessment</li></ul>"+			
			"</div>";
		
		var infowindow5 = new google.maps.InfoWindow({
			});
			infowindow5.setContent(content5);
		
		google.maps.event.addListener(marker5, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow5.open(map, marker5);
			activeInfoWindow = infowindow5;
		});
//End site_5*******************************************************************
//-----------------------------------------------------------------------------
//Begin site_6*****************************************************************
		var marker6 = new google.maps.Marker({
			position: new google.maps.LatLng(41.87264, -85.19417),
			map: map,
			title: "113 E. Chicago Street, Bronson"
		});
		
		var content6 = "<div id='info'>"+
			"<h3>113 E. Chicago St.</h3>"+
			"<img src='images/brownfield/113_E_Chicago.jpg' />"+
			"<p><b>Size:</b> 11 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<li>Phase I Environmental Site Assessment</li>"+
			"<li>Baseline Environmental Site Assessment</li></ul>"+				
			"</div>";
		
		var infowindow6 = new google.maps.InfoWindow({
			});
			infowindow6.setContent(content6);
		
		google.maps.event.addListener(marker6, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow6.open(map, marker6);
			activeInfoWindow = infowindow6;
		});
//End site_6*******************************************************************
//-----------------------------------------------------------------------------
//Begin site_7*****************************************************************
		var marker7 = new google.maps.Marker({
			position: new google.maps.LatLng(41.96267, -85.01432),
			map: map,
			title: "Former Ballard Junkyard"
		});
		
		var content7 = "<div id='info'>"+
			"<h3>Former Ballard Junkyard</h3>"+
			"<img src='images/brownfield/ballard_junkyard.jpg' />"+
			"<p><b>Size:</b> 10 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<li>Phase I Environmental Site Assessment</li></ul>"+				
			"</div>";
		
		var infowindow7 = new google.maps.InfoWindow({
			});
			infowindow7.setContent(content7);
		
		google.maps.event.addListener(marker7, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow7.open(map, marker7);
			activeInfoWindow = infowindow7;
		});
//End site_7*******************************************************************
//-----------------------------------------------------------------------------
//Begin site_8*****************************************************************
		var marker8 = new google.maps.Marker({
			position: new google.maps.LatLng(41.93183, -85.01314),
			map: map,
			title: "Former Coldwater City Dump"
		});
		
		var content8 = "<div id='info'>"+
			"<h3>Former Coldwater City Dump</h3>"+
			"<img src='images/brownfield/coldwater_city_dump.jpg' />"+
			"<p><b>Size:</b> 4.14 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<li>Phase I Environmental Site Assessment</li></ul>"+				
			"</div>";
		
		var infowindow8 = new google.maps.InfoWindow({
			});
			infowindow8.setContent(content8);
		
		google.maps.event.addListener(marker8, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow8.open(map, marker8);
			activeInfoWindow = infowindow8;
		});
//End site_8*******************************************************************
//-----------------------------------------------------------------------------
//Begin site_9*****************************************************************
		var marker9 = new google.maps.Marker({
			position: new google.maps.LatLng(41.932600, -85.005200),
			map: map,
			title: "Fomer Homer Foundry"
		});
		
		var content9 = "<div id='info'>"+
			"<h3>Fomer Homer Foundry</h3>"+
			"<img src='images/brownfield/homer_foundry.jpg' />"+
			"<p><b>Size:</b> 6.80 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<li>Phase I Environmental Site Assessment</li></ul>"+				
			"</div>";
		
		var infowindow9 = new google.maps.InfoWindow({
			});
			infowindow9.setContent(content9);
		
		google.maps.event.addListener(marker9, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow9.open(map, marker9);
			activeInfoWindow = infowindow9;
		});
//End site_9*******************************************************************
//-----------------------------------------------------------------------------
//Begin site_10*****************************************************************
		var marker10 = new google.maps.Marker({
			position: new google.maps.LatLng(41.934978, -85.195156),
			map: map,
			title: "Matteson Lake Store"
		});
		
		var content10 = "<div id='info'>"+
			"<h3>Matteson Lake Store</h3>"+
			"<img src='images/brownfield/matteson.jpg' />"+
			"<p><b>Size:</b> 0.29 acres</p>"+
			"<p><b>Environmental Assessments Completed:</b></p>"+
			"<li>Phase I Environmental Site Assessment</li>"+
			"<li>Phase II Environmental Site Assessment</li>"+
			"<li>Baseline Environmental Assessment</li>"+
			"<p><b>Status:</b> The store has been purchased and redeveloped</p>"+				
			"</div>";
		
		var infowindow10 = new google.maps.InfoWindow({
			});
			infowindow10.setContent(content10);
		
		google.maps.event.addListener(marker10, "click", function() {
			if(activeInfoWindow){
			activeInfoWindow.close();}
			infowindow10.open(map, marker10);
			activeInfoWindow = infowindow10;
		});
//End site_10*******************************************************************
//-----------------------------------------------------------------------------		
//End brownfield site code*****************************************************
		
										 											 
	};
})();