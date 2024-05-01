import { generate } from 'random-words'
import { logsLikeADog } from '/opt/lib/logsLikeADog.js'

export const handler = async () => {
  console.log(generate())
  logsLikeADog()
  return [{ book: 'The Fellowship of the Ring', Author: 'J.R.R. Tolkien' }]
}
