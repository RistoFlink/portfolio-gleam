import gleam/erlang/process
import mist
import models
import router
import wisp
import wisp/wisp_mist

pub fn main() {
  wisp.configure_logger()

  let ctx = models.load_context()

  let handler = fn(req) { router.handle_request(req, ctx) }

  let assert Ok(_) =
    wisp_mist.handler(handler, "secret_key_change_this")
    |> mist.new
    |> mist.port(8000)
    |> mist.start

  process.sleep_forever()
}
