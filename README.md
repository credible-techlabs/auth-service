create docker image
```bash
docker build -t auth-service:local .
```

start docker
```bash
docker run -d -p 8000:8000 --name auth-service-container --network medx_network auth-service:local
```

############################################################################################
build   : Changes that affect the build system or external dependencies
ci      : Changes to our CI configuration files and scripts(example : azure pipeline)
docs    : Documentation only changes
feat    : A new feature
fix     : A bug Fix
perf    : A code change that improves performance
refactor: A code change that neither fixes a bug nor adds a feature
style   : Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
test    : Adding missing tests or correcting existing tests
chore   : Other changes that don't modify src or test files
revert  : Reverts a previous commit