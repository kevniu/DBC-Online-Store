// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
  $('.add_cart').on('submit', function(e){
    e.preventDefault();
    var product_id = $(this).find('#cart_item_id').val()
    var quantity = $(this).find('#name_quantity').val()
    var data = {product_id: product_id, quantity: quantity}
    var route = $(this).attr("action")  + product_id;

    $.ajax({
      url: 'carts/' + product_id,
      type: "PATCH",
      data: data
    }).done(function(data){
      $('#append_cart').empty();
      $('#append_cart').append(data);
    }).fail(function(data){
      console.error(data);
    })


  });

  $('#append_cart').on('click', 'button', function(e){
    e.preventDefault();
    console.log("Hello");
    // console.log($(this))
    var idHolder = $(this).parent().attr('id');

    $.ajax({
      url: '/carts/' + idHolder,
      type: "DELETE"
    }).done(function(data){
      console.log("AJAX RETURN")
      console.log(data);
      $('#append_cart').empty();
      $('#append_cart').append(data);
    }).fail(function(data){
      console.error(data);
    })
  })

});
