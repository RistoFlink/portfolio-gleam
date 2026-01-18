import gleam/list
import models.{type Project}
import nakai/attr
import nakai/html
import views/layout

pub fn render(project: Project) {
  layout.root(project.name, "project", [
    html.main([attr.class("main main--project")], [
      html.img([
        attr.class("project__image"),
        attr.src(project.hero),
        attr.alt(project.name),
      ]),
      html.header([attr.class("project__header")], [
        html.h1([attr.class("project__title")], [html.Text(project.name)]),
        html.ul(
          [attr.class("categories")],
          list.map(project.categories, fn(category) {
            html.li([attr.class("categories__tag")], [html.Text(category)])
          }),
        ),
      ]),
      html.p([attr.class("project__description")], [
        html.Text(project.description),
      ]),
      html.a_text(
        [
          attr.class("project__link"),
          attr.href(project.prod),
          attr.target("_blank"),
        ],
        "View Live Project",
      ),
    ]),
  ])
}
