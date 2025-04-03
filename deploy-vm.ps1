# Login to Azure
Connect-AzAccount

# Variables
$resourceGroupName = "example-resources"
$location = "eastus"
$vmName = "ExampleVM"
$vmSize = "Standard_DS1_v2"
$image = "Win2019Datacenter"
$adminUsername = "azureuser"
$adminPassword = "P@ssw0rd1234!"

# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a virtual network
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroupName -Location $location `
  -Name "example-vnet" -AddressPrefix "10.0.0.0/16"

# Create a subnet
$subnet = Add-AzVirtualNetworkSubnetConfig -Name "example-subnet" -AddressPrefix "10.0.1.0/24" `
  -VirtualNetwork $vnet
$vnet | Set-AzVirtualNetwork

# Create a public IP address
$publicIp = New-AzPublicIpAddress -ResourceGroupName $resourceGroupName -Location $location `
  -Name "example-pip" -AllocationMethod Dynamic

# Create a network security group
$nsg = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Location $location `
  -Name "example-nsg"

# Create a network interface
$nic = New-AzNetworkInterface -ResourceGroupName $resourceGroupName -Location $location `
  -Name "example-nic" -SubnetId $subnet.Id -PublicIpAddressId $publicIp.Id -NetworkSecurityGroupId $nsg.Id

# Create a virtual machine
New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VMName $vmName `
  -Size $vmSize -Credential (New-Object PSCredential -ArgumentList $adminUsername, (ConvertTo-SecureString $adminPassword -AsPlainText -Force)) `
  -ImageName $image -NetworkInterfaceId $nic.Id
