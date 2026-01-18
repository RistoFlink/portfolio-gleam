import gleam/dict
import gleam/http.{Get}
import models.{type Context}
import views/about
import views/contact
import views/home
import views/layout
import views/project
import wisp.{type Request, type Response}

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use <- wisp.log_request(req)
  use <- wisp.rescue_crashes
  use <- wisp.serve_static(req, under: "/static", from: ctx.static_path)

  case req.method, wisp.path_segments(req) {
    Get, [] -> {
      let projects = dict.values(ctx.projects)
      home.render(projects)
      |> wisp.html_response(200)
    }

    Get, ["about"] -> {
      about.render()
      |> wisp.html_response(200)
    }

    Get, ["contact"] -> {
      contact.render()
      |> wisp.html_response(200)
    }

    Get, ["project", slug] -> {
      case dict.get(ctx.projects, slug) {
        Ok(item) -> {
          project.render(item)
          |> wisp.html_response(200)
        }
        Error(_) -> not_found()
      }
    }

    _, _ -> not_found()
  }
}

fn not_found() -> Response {
  layout.root("404", "", [])
  |> wisp.html_response(404)
}
