$(function() {
  $(".pagination a").live("click", function() {
    $.get(this.href, null, null, "script");
    var arr = this.href.split('/');
    window.history.replaceState(null, 'Drink Recipes', arr[arr.length-1]);
    return false;
  });
});
