class pontisusers {
require system::groups
require system::groups::realize
$accounts = hiera('accounts')
create_resources(account, $accounts)
}
