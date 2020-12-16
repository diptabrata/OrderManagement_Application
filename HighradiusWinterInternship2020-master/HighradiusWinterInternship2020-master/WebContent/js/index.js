//table   
  $(document).ready(function() {
  	$('#myTable').dataTable( {   
  		"pagingType": "full_numbers",
  		 "pageLength": 10, 
  		 "ordering": false,
  		 "dom": '<"top"f>t<"bottom"p><"bottom-left"i>', 	
  		"language": {
  	        "search": "_INPUT_",            // Removes the 'Search' field label
  	        "searchPlaceholder":"Search" ,  // Placeholder for the search box
  	        	"paginate": {
  	                "previous": '&#8592;',
  	                    "next": '&#8594;',
  	                    "first":"&#8592;&#8592;",
  	                    "last":"&#8594;&#8594;"
  	            } 
  		}
  			} );
  	} );
  
  