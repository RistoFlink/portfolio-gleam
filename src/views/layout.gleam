import nakai
import nakai/attr
import nakai/html

pub fn root(page_title: String, current_page: String, content: List(html.Node)) {
  html.Fragment([
    html.Element("!DOCTYPE", [attr.Attr("html", "")], []),
    html.Html([attr.lang("en")], [
      html.Head([
        html.meta([attr.charset("UTF-8")]),
        html.meta([
          attr.name("viewport"),
          attr.content("width=device-width, initial-scale=1.0"),
        ]),
        html.title("Risto Flink | " <> page_title),
        html.link([attr.rel("stylesheet"), attr.href("/static/css/styles.css")]),
      ]),
      html.Body([], [header_component(current_page), html.main([], content)]),
    ]),
  ])
  |> nakai.to_string()
}

fn header_component(current_page: String) -> html.Node {
  html.header([attr.class("header")], [
    html.h1([], [html.Text("Risto Flink")]),
    html.nav([attr.class("nav")], [
      nav_link("/", "Projects", "home", current_page),
      nav_link("/about", "About", "about", current_page),
      nav_link("/contact", "Contact", "contact", current_page),
    ]),
  ])
}

fn nav_link(
  url: String,
  label: String,
  link_id: String,
  current_page: String,
) -> html.Node {
  let class_name = case current_page == link_id {
    True -> "nav__link nav__link--active"
    False -> "nav__link"
  }
  html.a([attr.href(url), attr.class(class_name)], [html.Text(label)])
}
