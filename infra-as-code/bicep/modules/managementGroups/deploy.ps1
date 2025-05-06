param(
    [switch]$Create
)

$dateYMD=$(Get-Date -Format "yyyyMMddTHHmmssZ")
$NAME="alz-MGDeployment-${dateYMD}"
$LOCATION="uksouth"
$TEMPLATEFILE="managementGroups.bicep"
$PARAMETERS="@parameters/managementGroups.parameters.all.json"

if ($Create) {
    az deployment tenant create --name $NAME --location $LOCATION --template-file $TEMPLATEFILE --parameters $PARAMETERS
} else {
    az deployment tenant what-if --name $NAME --location $LOCATION --template-file $TEMPLATEFILE --parameters $PARAMETERS
}
