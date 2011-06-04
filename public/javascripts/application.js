function remove_fields(link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".quotesform").hide();
}

function add_quote_line(link, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("quote_lines", "g");
  var replacement = ["quote_lines", "quote_lines", "quote_lines", new_id, "quote_lines", "quote_lines", "quote_lines", new_id, "quote_lines", "quote_lines", "quote_lines", new_id];
  var index = 0;
  $(link).up().insert({
    before: content.replace(regexp, function () {
      return replacement[index++]
    })
  });
}
