 //disable multiple checkbox
     $("input[type=checkbox]").on('change',function(){
    	 $("input[type=checkbox]").not(this).prop('checked',false);
     }); 
 //checkbox operation to fetch selected data 
    $("input[type=checkbox]").click(function(){
        let row = $(this).closest("tr");
		orderid = row.find(".orderID_edit").text();
		orderamount=row.find(".orderAmount_edit").text();
		$('#order_id').val("");
		$('#order_id').val($('#order_id').val() + orderid);	
		$('#order_amount').val("");
		$('#order_amount').val($('#order_amount').val() + orderamount);	
		$('#order_ID').val("");
		$('#order_ID').val($('#order_ID').val() + orderid);	
		$('#order_Amount').val("");
		$('#order_Amount').val($('#order_Amount').val() + orderamount);	
		});
  //disable approve untill checked
	   $('#button1').prop("disabled", true);
	   $('input:checkbox').click(function() {
	    if ($(this).is(':checked')) {
	    $('#button1').prop("disabled", false);
	    } else {
	    if ($('.checks').filter(':checked').length < 1){
	    $('#button1').attr('disabled',true);}
	    }
	   });
	 //disable reject untill checked
	   $('#button2').prop("disabled", true);
	   $('input:checkbox').click(function() {
	    if ($(this).is(':checked')) {
	    $('#button2').prop("disabled", false);
	    } else {
	    if ($('.checks').filter(':checked').length < 1){
	    $('#button2').attr('disabled',true);}
	    }
	   });
	  