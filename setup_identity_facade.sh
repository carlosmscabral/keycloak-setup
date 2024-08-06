# from Keycloak's cabral-idp config

export IDP_DISCOVERY_DOCUMENT=https://keycloak.35.190.9.46.nip.io/realms/cabral-idp/.well-known/openid-configuration
export TEST_IDP_APIGEE_CLIENT_ID=apigee-keycloak
export TEST_IDP_APIGEE_CLIENT_SECRET=mdW4DI88ASmLoH0Zcmwq5QuDqp5ruLiM # got from Keycloak

# Apigee callback, to be configured in KeyCloak https://dev.35.227.240.213.nip.io/v1/oauth20/callback

export IS_PKCE_ENABLED=true

export APIGEE_X_ORG=cabral-apigee
export APIGEE_X_ENV=dev
export APIGEE_X_HOSTNAME=dev.35.227.240.213.nip.io

./pipeline.sh --googleapi