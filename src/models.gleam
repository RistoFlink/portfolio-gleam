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
    description: String,
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
      description: "This project demonstrates a microservices architecture using Go, Docker, gRPC, and RabbitMQ.",
    ),
    Project(
      slug: "book-recommender",
      name: "Book recommendation with Python, LangChain, and Gradio",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/book-recommender.png",
      categories: ["python", "llm", "openai"],
      prod: "https://book-recommender-rf.up.railway.app",
      description: "This semantic book recommender was built with Python, OpenAI, LangChain, Chroma, and Gradio. It allows users to find books semantically similar to a given description and filter them by category and emotional tone. The recommendations are generated using a Chroma vector database and OpenAI embeddings.",
    ),
    Project(
      slug: "habit-tracking",
      name: "Habit tracking app with Python and MongoDB",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/habit-tracker-code.png",
      categories: ["python", "web", "mongodb"],
      prod: "https://habit-tracker-flask.up.railway.app",
      description: "A habit tracking application built with Python and MongoDB.",
    ),
    Project(
      slug: "microblog",
      name: "Microblog with Python and MongoDB",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/microblog.png",
      categories: ["python", "web", "mongodb"],
      prod: "https://python-microblog-production.up.railway.app/",
      description: "A microblogging platform built with Python and MongoDB.",
    ),
    Project(
      slug: "task-list",
      name: "Task list with Go, React and MongoDB",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/tasklist.png",
      categories: ["go", "react", "mongodb"],
      prod: "https://go-tasks-production.up.railway.app/",
      description: "A task list application built with Go, React, and MongoDB.",
    ),
    Project(
      slug: "thesis",
      name: "Expanding an online store into the Estonian market",
      thumb: "/static/img/habit-tracking.png",
      hero: "/static/img/habit-tracking-hero.png",
      categories: ["writing"],
      prod: "https://urn.fi/URN:NBN:fi:amk-2020100721092",
      description: "A thesis regarding the expansion of an online store into the Estonian market.",
    ),
  ]

  let projects_dict =
    projects_list
    |> list.map(fn(p) { #(p.slug, p) })
    |> dict.from_list

  Context(projects: projects_dict, static_path: "/priv/static")
}
