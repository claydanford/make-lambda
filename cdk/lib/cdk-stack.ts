import { Stack, StackProps, aws_lambda as lambda } from 'aws-cdk-lib'
import { Construct } from 'constructs'
import * as path from 'path'

export class CdkStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props)

    const functionNames = ['createBook', 'getBooks']

    const layer = new lambda.LayerVersion(this, 'layer', {
      code: lambda.Code.fromAsset(path.join(__dirname, '../../dist/layer')),
      compatibleRuntimes: [lambda.Runtime.NODEJS_20_X],
      license: 'Apache-2.0',
    })

    functionNames.forEach((fn) => {
      new lambda.Function(this, fn, {
        runtime: lambda.Runtime.NODEJS_20_X,
        handler: `${fn}.handler`,
        code: lambda.Code.fromAsset(path.join(__dirname, `../../service/out`), {
          exclude: ['*', `!${fn}.js*`, '!package.json'],
        }),
        layers: [layer],
      })
    })
  }
}
