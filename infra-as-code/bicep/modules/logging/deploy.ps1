param(
    [switch]$Create
)

$ManagementSubscriptionId="c2862439-f7c2-4c48-b830-beac83fc1888"
az account set --subscription $ManagementSubscriptionId

$TopLevelMGPrefix="as-alz"
$dateYMD=$(Get-Date -Format "yyyyMMddTHHmmssZ")
$GROUP="rg-$TopLevelMGPrefix-logging"
$NAME="alz-loggingDeployment-${dateYMD}"
$LOCATION="uksouth"
$TEMPLATEFILE="logging.bicep"
$PARAMETERS="@parameters/logging.parameters.all.json"

az group create --name $GROUP --location $LOCATION

if ($Create) {
    az deployment group create --name $NAME --resource-group $GROUP --template-file $TEMPLATEFILE --parameters $PARAMETERS
} else {
    az deployment group what-if --name $NAME --resource-group $GROUP --template-file $TEMPLATEFILE --parameters $PARAMETERS
}
