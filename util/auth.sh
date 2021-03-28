aws cognito-idp initiate-auth \
    --region $region \
    --profile $profileName \
    --auth-flow USER_PASSWORD_AUTH \
    --client-id $clientId \
    --auth-parameters USERNAME=$email,PASSWORD=$password \
    --query 'AuthenticationResult.IdToken' \
    --output text | xclip -selection c
