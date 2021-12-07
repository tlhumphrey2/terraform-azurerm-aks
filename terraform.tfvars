
# Abbreviated product name, suitable for use in Azure naming.
# Must be 3-16 characters in length, all lowercase letters or numbers, no spaces.
# Value type: string
# Example entry: "my-product"

product_name="tlh2hpcc"

#------------------------------------------------------------------------------

# Enable RBAC and AD integration for AKS?
# This provides additional security for accessing the Kubernetes cluster and settings (not HPCC Systems' settings).
# Value type: boolean
# Recommended value: true
# Example entry: true

enable_rbac_ad=false

#------------------------------------------------------------------------------

# Map of name => value tags that can will be associated with the cluster.
# Format is '{"name"="value" [, "name"="value"]*}'.
# The 'name' portion must be unique.
# To add no tags, use '{}'.
# Value type: map of string

extra_tags={}

#------------------------------------------------------------------------------

# The VM size for each node in the HPCC Systems node pool.
# Recommend "Standard_B4ms" or better.
# See https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-general for more information.
# Value type: string

node_size="Standard_F2"

#------------------------------------------------------------------------------

# Must be 2 or more.
# Value type: integer

max_node_count=4

#------------------------------------------------------------------------------

# Email address of the administrator of this HPCC Systems cluster.
# Value type: string
# Example entry: "jane.doe@hpccsystems.com"

admin_email="tlhumphrey2@gmail.com"

#------------------------------------------------------------------------------

# Name of the administrator of this HPCC Systems cluster.
# Value type: string
# Example entry: "Jane Doe"

admin_name="Timothy Humphrey"

#------------------------------------------------------------------------------

# Username of the administrator of this HPCC Systems cluster.
# Value type: string
# Example entry: "jdoe"

admin_username="tlhumphrey2"

#------------------------------------------------------------------------------

# The Azure region abbreviation in which to create these resources.
# Must be one of ["eastus2", "centralus"].
# Value type: string
# Example entry: "eastus2"

azure_region="eastus2"

#------------------------------------------------------------------------------

# Map of name => CIDR IP addresses that can administrate this AKS.
# Format is '{"name"="cidr" [, "name"="cidr"]*}'.
# The 'name' portion must be unique.
# To add no CIDR addresses, use '{}'.
# The corporate network and your current IP address will be added automatically, and these addresses will have access to the HPCC cluster as a user.
# Value type: map of string

admin_ip_cidr_map={}

#------------------------------------------------------------------------------

# If you are attaching to an existing storage account, put its name here.
# Leave as an empty string if you do not have a storage account.
# If you put something here then you must also define a resource group for the storage account.
# Value type: string
# Example entry: "my-product-sa"

storage_account_name=""

#------------------------------------------------------------------------------

# If you are attaching to an existing storage account, put its resource group name here.
# Leave as an empty string if you do not have a storage account.
# If you put something here then you must also define a name for the storage account.
# Value type: string

storage_account_resource_group_name=""
