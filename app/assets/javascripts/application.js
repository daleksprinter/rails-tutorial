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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
var cnt = 0

function op(){
    document.getElementById("layer").style.display = 'block';
    document.getElementById("popup").style.display = 'block';
    cnt = 0;
    document.getElementById("count").textContent = cnt;
}

function cls(){
    document.getElementById("layer").style.display = 'none';
    document.getElementById("popup").style.display = 'none';
    cnt = 0;
    document.getElementById("count").textContent = cnt;
}

function count(){
    cnt++;
    document.getElementById("count").textContent = cnt;
}

function finish(){
    
}