import nakai/attr
import nakai/html
import views/layout

pub fn render() {
  layout.root("About", "about", [
    html.main([attr.class("main main--about")], [
      html.h1_text([], "About Me"),
      html.p_text([], "Content placeholder."),
    ]),
  ])
}
