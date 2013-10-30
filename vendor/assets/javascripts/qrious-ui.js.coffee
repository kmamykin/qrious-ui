#= require spin.js/dist/spin
#= require jquery/jquery
#= require bootstrap/dist/js/bootstrap
#= require angular/angular
#= require angular-ui/build/angular-ui
#= require_self

$ ()->
  # Enable Tooltips
  $("*[data-toggle='tooltip']").tooltip()
