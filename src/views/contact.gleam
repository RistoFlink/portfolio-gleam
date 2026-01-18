import gleam/string_builder.{type StringBuilder}
import nakai/attr
import nakai/html
import portfolio/views/layout

pub fn render() -> StringBuilder {
  layout.root("Contact", "contact", [
    html.main([attr.class("main main--contact")], [
      html.h1([], [html.text("Contact")]),
      html.p([], [
        html.text("You can reach me at "),
        html.a([attr.href("mailto:email@example.com")], [
          html.text("email@example.com"),
        ]),
      ]),
    ]),
  ])
}
