import { generate } from "random-words";

export const handler = async () => {
  console.log(generate())
  return [{ book: 'The Fellowship of the Ring', Author: 'J.R.R. Tolkien' }]
}
