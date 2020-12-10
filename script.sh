#!/bin/bash

#create an access token key for authentication and keep it in file named eccess-token!! ***must***
ACCESS=$(cat eccess-token)

#Create a local repository
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/repositories/libs-release-local -vvv -X PUT -H "Content-Type: application/json" -d '{"description":"testrepo","packageType":"generic","rclass":"local"}'
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/repositories/libs-dev-local -vvv -X PUT -H "Content-Type: application/json" -d '{"description":"Local storage for developers uploading/deploying","packageType":"generic","rclass":"local"}'

#Create groups
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/security/groups/developers -vvv -X PUT -H "Content-Type: application/json" -d  @jsons/developers_group.json
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/security/groups/manegers -vvv -X PUT -H "Content-Type: application/json" -d @jsons/manegers_group.json
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/security/groups/2best-dev -vvv -X PUT -H "Content-Type: application/json" -d {"name":"2best-dev"}

#Create a users
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/security/users/dev1-leads -vvv -X PUT -H "Content-Type: application/json" -d @jsons/dev1-leads_user.json
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/security/users/dev1-user1 -vvv -X PUT -H "Content-Type: application/json" -d @jsons/dev1-user1_user.json
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/security/users/dev1-user2 -vvv -X PUT -H "Content-Type: application/json" -d @jsons/dev1-user2_user.json
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/security/users/dev2-leads -vvv -X PUT -H "Content-Type: application/json" -d @jsons/dev2-leads_user.json
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/security/users/dev2-user1 -vvv -X PUT -H "Content-Type: application/json" -d @jsons/dev2-user1_user.json
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/security/users/dev2-user2 -vvv -X PUT -H "Content-Type: application/json" -d @jsons/dev2-user2_user.json


#Create permissions
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/v2/security/permissions/developers-permissions -vvv -X PUT -H "Content-Type: application/json" -d @jsons/developers_permissions.json                                                                    
curl -H "Authorization: Bearer $ACCESS" -s -i https://task.jfrog.io/artifactory/api/v2/security/permissions/manegers-permissions -vvv -X PUT -H "Content-Type: application/json" -d @jsons/manegers_permission.json                                                                                                                                                                       
