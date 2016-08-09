function attach_to_office_selector () {
  $("#office-selector").change(function () {
    window.location.replace(URI().setSearch({office_id: this.value}));
  });
}

$(document).ready(attach_to_office_selector);
$(document).on('turbolinks:load page:load', attach_to_office_selector);