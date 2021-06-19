// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function initMap() {
    geocoder = new google.maps.Geocoder()

    map = new google.maps.Map(document.getElementById('map'), {
      // コントローラーで定義した変数から緯度経度を呼び出し、マップの中心に表示
      center: {
        lat: gon.blog.latitude,
        lng: gon.blog.longitude
      },
      zoom: 12,
    });

    marker = new google.maps.Marker({
      // コントローラーで定義した変数から緯度経度を呼び出し、マーカーを立てる
      position: {
        lat: gon.blog.latitude,
        lng: gon.blog.longitude
      },
      map: map
    });
  }
document.addEventListener("turbolinks:load", function () {
  $(document).ready(function(){
    $(".openbtn1").click(function () {
      $(this).toggleClass('active');
        $("#g-nav").toggleClass('panelactive');
    });

    $("#g-nav a").click(function () {
      $(".openbtn1").removeClass('active');
        $("#g-nav").removeClass('panelactive');
    });
  });
});
