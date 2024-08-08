#let section(counter, body) = {
  counter.step()
  body
  counter.step()
}
