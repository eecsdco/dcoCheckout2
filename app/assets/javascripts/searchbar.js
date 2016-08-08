function submit_search() {
  if ($("#searchbar").val() == "") {
    return true;
  }
  var query_str = jQuery.param({q: $("#searchbar").val()});
  jQuery.getJSON("/titles/search", query_str, function (results) {
    // process search results
    var new_html = ""
    jQuery.each(results, function (i, result) {
      console.log(result)
      new_html += '<a href="/titles/' + result.id + '">' + result.name + "</a>\n";
    });
    $("#searchbar-results").html(new_html);
    $("#searchbar-results a").mousedown(function () {
      window.location.replace(this.href);
    });
  });
}

function attach_to_search() {
  $("#searchbar").focus(function() {
    $("#searchbar-results")
      .css("display", "block")
      .css("position", "absolute")
      .css("left", $("#searchbar").position().left)
      .css("top", $("#searchbar").position().top + $("#searchbar").outerHeight());
    });

  $("#searchbar").blur(function() {
    $("#searchbar-results").css("display", "none");
  });

  $("#searchbar").keyup(submit_search);
}

$(document).ready(attach_to_search);
$(document).on('turbolinks:load page:load', attach_to_search);