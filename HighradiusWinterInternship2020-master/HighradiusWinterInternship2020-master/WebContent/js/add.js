//Get the modal element
var modal1 = document.getElementById('id01');
var modal2= document.getElementById('id02');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal1 ){
        modal1.style.display = "none";
      }
    if (event.target==modal2)
    	{
    	modal2.style.display="none";
    	}
}
//disable multiple checkbox
     $("input[type=checkbox]").on('change',function(){
   	 $("input[type=checkbox]").not(this).prop('checked',false);
    });
//checkbox operation to fetch selected data into modal
   $("input[type=checkbox]").click(function(){
       let row = $(this).closest("tr");
		orderid = row.find(".orderID_edit").text();
		approvedby = row.find(".approvedBy_edit").text();
		orderamount=row.find(".orderAmount_edit").text();
		notes_ed=row.find(".notes_edit").text();
		$('#order_id').val("");
		$('#order_id').val($('#order_id').val() + orderid);	
		$('#Approved_By').val("");
		$('#Approved_By').val($('#Approved_By').val() + approvedby);
		$('#Order_Amount').val("");
		$('#Order_Amount').val($('#Order_Amount').val() + orderamount);
		$('#notes').val("");
		$('#notes').val($('#notes').val() + notes_ed);	
	});
	//disable untill checked
   $('#editbutton').prop("disabled", true);
   $('input:checkbox').click(function() {
    if ($(this).is(':checked')) {
    $('#editbutton').prop("disabled", false);
    } else {
    if ($('.checks').filter(':checked').length < 1){
    $('#editbutton').attr('disabled',true);}
    }
   });
