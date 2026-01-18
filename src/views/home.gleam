import gleam/list
import gleam/string_builder.{type StringBuilder}
import nakai/attr
import nakai/html
import portfolio/models.{type Portfolio}
import portfolio/views/layout

pub fn render(projects: List(Project)) -> StringBuilder {
  layout.root(page_title: "Portfolio", current_page: "home", content: [
    html.section(
      [attr.class("projects-grid")],
      list.map(projects, project_card),
    ),
  ])
}

fn project_card(project: Project) -> html.Node {
  html.article([attr.class("project-card")], [
    html.a([attr.href("/project/" <> project.slug)], [
      html.img([attr.src(project.thumb), attr.alt(project.name)]),
      html.h3([], [html.text(project.name)]),
    ]),
  ])
}
