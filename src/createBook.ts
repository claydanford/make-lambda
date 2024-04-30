import { AppSyncResolverEvent } from 'aws-lambda'

interface Args {
  book: string
  author: string
}

export const handler = async (event: AppSyncResolverEvent<Args>) => {
  return event.arguments
}
