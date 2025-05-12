param(
    [switch]$Create
)

$dateYMD=$(Get-Date -Format "yyyyMMddTHHmmssZ")
$NAME="alz-PolicyDefsDefaults-${dateYMD}"
$LOCATION="uksouth"
$MGID="as-alz-mg"
$TEMPLATEFILE="customPolicyDefinitions.bicep"
$PARAMETERS="@parameters/customPolicyDefinitions.parameters.all.json"

if ($Create) {
    az deployment mg create --name $NAME --location $LOCATION --management-group-id $MGID --template-file $TEMPLATEFILE --parameters $PARAMETERS
} else {
    az deployment mg what-if --name $NAME --location $LOCATION --management-group-id $MGID --template-file $TEMPLATEFILE --parameters $PARAMETERS
}
