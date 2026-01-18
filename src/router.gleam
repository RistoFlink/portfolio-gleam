import gleam/dict
import gleam/http/request.{Get}
import gleam/string_builder
import portfolio/models.{type Context}
import portfolio/views/about
import portfolio/views/contact
import portfolio/views/home
import portfolio/views/project
import wisp.{type Request, type Response}

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use req <- wisp.log_request(req)
  use req <- wisp.rescue_crashes
  use req <- wisp.serve_static(req, under: "/static", from: ctx.static_path)

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
  string_builder.from_string("<h1>404 - Page Not Found</h1>")
  |> wisp.html_response(404)
}
