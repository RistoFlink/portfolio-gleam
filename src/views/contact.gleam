import nakai/attr
import nakai/html
import views/layout

pub fn render() {
  layout.root("Contact", "contact", [
    html.main([attr.class("main main--contact")], [
      html.h1_text([], "Contact"),
      html.p([], [
        html.Text("You can reach me at "),
        html.a_text(
          [attr.href("mailto:email@example.com")],
          "email@example.com",
        ),
      ]),
    ]),
  ])
}
