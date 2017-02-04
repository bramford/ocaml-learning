let html =
  let content = read_whole_file file in
  GHtml.html_from_string content
  ;;
