import gleam/dict.{type Dict}
import gleam/list

pub type Project {
  Project(
    slug: String,
    name: String,
    hero: String,
    thumb: String,
    prod: String,
    categories: List(String),
  )
}

pub type Context {
  Context(projects: Dict(String, Project), static_path: String)
}

pub fn load_context() -> Context {
  let projects_list = [
    Project(
      slug: "microservices-go",
      name: "Microservices with Go, Docker, gRPC, and RabbitMQ",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/microservices-go.png",
      categories: ["go", "rabbitmq", "grpc"],
      prod: "https://swarm.ristoflink.dev",
    ),
    Project(
      slug: "book-recommender",
      name: "Book recommendation with Python, LangChain, and Gradio",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/book-recommender.png",
      categories: ["python", "llm", "openai"],
      prod: "https://book-recommender-rf.up.railway.app",
    ),
    Project(
      slug: "habit-tracking",
      name: "Habit tracking app with Python and MongoDB",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/habit-tracker-code.png",
      categories: ["python", "web", "mongodb"],
      prod: "https://habit-tracker-flask.up.railway.app",
    ),
    Project(
      slug: "microblog",
      name: "Microblog with Python and MongoDB",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/microblog.png",
      categories: ["python", "web", "mongodb"],
      prod: "https://python-microblog-production.up.railway.app/",
    ),
    Project(
      slug: "task-list",
      name: "Task list with Go, React and MongoDB",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/tasklist.png",
      categories: ["go", "react", "mongodb"],
      prod: "https://go-tasks-production.up.railway.app/",
    ),
    Project(
      slug: "thesis",
      name: "Expanding an online store into the Estonian market",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/habit-tracking-hero.png",
      categories: ["writing"],
      prod: "https://urn.fi/URN:NBN:fi:amk-2020100721092",
    ),
  ]

  let projects_dict =
    projects_list
    |> list.map(fn(p) { #(p.slug, p) })
    |> dict.from_list

  Context(projects: projects_dict, static_path: "/priv/static")
}
