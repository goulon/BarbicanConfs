get_id () {
    echo `$@ | awk '/ id / { print $4 }'`
}

SERVICE_ID=$(get_id keystone service-create --name=barbican --type="key-manager" --description="Key_Management_Service")
keystone endpoint-create \
    --region RegionOne \
    --service-id=$SERVICE_ID \
    --publicurl=http://localhost:9311/v1 \
    --internalurl=http://localhost:9311/v1 \
    --adminurl=http://localhost:9311/v1


ADMIN_ROLE=$(get_id keystone role-get admin)
tenant_id=$(get_id keystone tenant-create --name="service")
user_id=$(get_id keystone user-create --name="barbican" --pass="barbican" --email=admin@domain.com)
keystone user-role-add --user $user_id --role $ADMIN_ROLE --tenant-id $tenant_id
