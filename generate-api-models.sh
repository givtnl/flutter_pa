#!/bin/sh

rm -r ./lib/generated/api
curl -o swagger-codegen-input.json 'https://0v9xof580f.execute-api.eu-west-3.amazonaws.com/prod/swagger/v1/swagger.json'
if [[ "$(docker images -q openapitools/openapi-generate:latest 2> /dev/null)" == "" ]]; then
  # nothing
  echo "Found docker image, continuing..."
else
  echo "Did not find docker image, pulling latest..."
  docker pull openapitools/openapi-generator-cli:latest
fi
docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate -i /local/swagger-codegen-input.json -g dart -c /local/swagger-cli-config.json -o /local/lib/generated/api
find ./lib/generated/api/lib -type f -name '*.dart' -exec sed -i '' s/OneOfo/O/ {} +
find ./lib/generated/api/lib -type f -name '*.dart' -exec sed -i '' s/OneOf// {} +