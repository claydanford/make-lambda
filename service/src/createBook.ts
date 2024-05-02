interface Event {
  book: string
  author: string
}

export const handler = async (event: Event) => event
