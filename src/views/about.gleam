import gleam/string_builder.{type StringBuilder}
import nakai/attr
import nakai/html
import portfolio/views/layout

pub fn render() -> StringBuilder {
  layout.root("About", "about", [
    html.main([attr.class("main main--about")], [
      html.h1([], [html.text("About Me")]),
      html.p([], [html.text("Content placeholder.")]),
    ]),
  ])
}
