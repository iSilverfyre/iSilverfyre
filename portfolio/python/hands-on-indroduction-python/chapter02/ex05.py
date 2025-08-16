import os

DEVELOPMENT =  "development"
PRODUCTION = "production"
STAGING = "staging"
CODE_SPACE = "code_space"
LOCAL = "local"

current_env = os.environ.get("ENV_NAME", DEVELOPMENT)

if current_env == DEVELOPMENT:
    print ("Development Enviornment")
elif current_env == PRODUCTION:
    print ("Production Enviornment")
elif current_env == STAGING:
    print ("Staging Enviornment")
elif current_env in [CODE_SPACE, LOCAL]:
    print ("Codespace or Local Enviornment")
else:
    print ("Unknown Environment")
