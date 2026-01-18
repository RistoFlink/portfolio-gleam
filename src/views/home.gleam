import gleam/list
import models.{type Project}
import nakai/attr
import nakai/html
import views/layout

pub fn render(projects: List(Project)) {
  layout.root("Home", "home", [
    html.main([attr.class("main main--home")], [
      html.section(
        [attr.class("projects")],
        list.map(projects, render_project_item),
      ),
    ]),
  ])
}

fn render_project_item(project: Project) -> html.Node {
  html.a([attr.class("u-bare-link"), attr.href("/project/" <> project.slug)], [
    html.article([attr.class("project-card")], [
      html.img([
        attr.class("project-card__image"),
        attr.src(project.thumb),
        attr.alt(project.name <> " hero image"),
      ]),
      html.header([attr.class("project-card__meta")], [
        html.ul(
          [attr.class("categories")],
          list.map(project.categories, fn(category) {
            html.li([attr.class("categories__tag")], [html.Text(category)])
          }),
        ),
        html.h2([attr.class("project-card__name")], [html.Text(project.name)]),
      ]),
    ]),
  ])
}
