# azure CLI

azure cli using service principal

## env

you make Service Principal and set following.
see https://docs.microsoft.com/ja-jp/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest

+ APP_ID - Service principal Application Id
+ PASSWORD - Service principal Tenant
+ TENANT -  Service principal Tenant

## run 

You can execute any az commands.
These commands run after `az login --service-principal ...`.

list resource groups

```
docker run --rm -e APP_ID=<APP ID> -e PASSWORD=<PASSOWRD> -e TENANT=<TENANT> kencharos/ac-cli az group list
```

change RU for Cosmos DB Collection

```
docker run --rm -e APP_ID=<APP ID> -e PASSWORD=<PASSOWRD> -e TENANT=<TENANT> kencharos/ac-cli az cosmosdb collection update -d <database> -c <collection> -n <cosmos db account name> -g <resource group> --throughput 3000
```
