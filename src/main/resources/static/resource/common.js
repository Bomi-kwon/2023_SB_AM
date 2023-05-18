$('select[data-value]').each(function(index, item){
	const items = $(item);
	const defaultValue = items.attr('data-value').trim();
	if (defaultValue.length > 0) {
		items.val(defaultValue);
	}
})

$('.modal-exam').click(function(){
	$('.layer-bg, .layer').show();
})

$('.close-btn').click(function(){
	$('.layer-bg, .layer').hide();
})

$('.layer-bg').click(function(){
	$('.layer-bg, .layer').hide();
})