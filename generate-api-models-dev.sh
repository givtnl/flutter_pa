#!/bin/sh

rm -r ./lib/generated/api
curl -o swagger-codegen-input.json 'https://poxv71al5m.execute-api.eu-west-3.amazonaws.com/prod/swagger/v1/swagger.json'
docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli:latest generate -i /local/swagger-codegen-input.json -g dart -c /local/swagger-cli-config.json -o /local/lib/generated/api
find ./lib/generated/api/lib -type f -name '*.dart' -exec sed -i '' s/OneOfo/O/ {} +
find ./lib/generated/api/lib -type f -name '*.dart' -exec sed -i '' s/OneOf// {} +