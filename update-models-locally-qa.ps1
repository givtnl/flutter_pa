Invoke-WebRequest -Uri https://poxv71al5m.execute-api.eu-west-3.amazonaws.com/prod/swagger/v1/swagger.json -OutFile swagger-codegen-input.json
docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate -i /local/swagger-codegen-input.json -g dart -c /local/swagger-cli-config.json -o /local/lib/generated/api
$files = Get-ChildItem '.\lib\generated\api\lib\*.dart' -Recurse -Force | ForEach {
    (Get-Content $_ | ForEach {$_ -replace 'OneOf', ''}) | Set-Content $_
}