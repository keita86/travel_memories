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

var windowwidth = window.innerWidth || document.documentElement.clientWidth || 0;
    if (windowwidth > 768){
      var responsiveImage = [//PC用の画像
        { src: 'https://cdn.pixabay.com/photo/2016/11/21/14/04/car-1845574_1280.jpg'},
        { src: 'https://cdn.pixabay.com/photo/2017/05/12/13/17/night-flight-2307018_1280.jpg'},
        { src: 'https://cdn.pixabay.com/photo/2017/08/06/12/06/people-2591874_1280.jpg'}
      ];
    } else {
      var responsiveImage = [//タブレットサイズ（768px）以下用の画像
        { src: 'https://images.unsplash.com/photo-1499363536502-87642509e31b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80' },
        { src: 'https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3034&q=80' },
        { src: 'https://images.unsplash.com/photo-1478860002487-680cc42afbeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3034&q=80' }
      ];
    }

//Vegas全体の設定
document.addEventListener("turbolinks:load", function () {
  $('#slider').vegas({
    overlay: true,
    transition: 'blur',
    transitionDuration: 2000,
    delay: 10000,
    animationDuration: 20000,
    animation: 'kenburns',
    slides: responsiveImage,
  });
});