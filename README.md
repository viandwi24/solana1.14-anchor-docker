# solana1.14-anchor-docker
Run solana 1.14 with anchor in docker

## Why
this repo im create because after solana release ^1.16, i dont know why so slow when we deploy program, im search in many place, and apparently, many people experience this issue too.

so im create this for me to run solana 1.14 so only for deploying program without installing to our system, cuz in our computer im always using solana latest version for better build program, but when i want to deploy im using this

## how to use

you can build `Dockerfile` to image, or you can run with docker compose with command `docker compose up -d`, and im creating shorcut to fast access anchor and solana inside docker container with `./danchor`

- `docker compose up -d`
- your current directory working is attach as volume to container in `/app`
- `chmod +x ./danchor` - add execute permission to this, i create this for shorcut if you want
- you can interact with docker exec to run shell container, or using my shorcut with `./danchor`, like to build you can use `./danchor build` instead `anchor build`

you can try this example command :

- `./danchor solana --version` access solana cli
- `./danchor --version` if first arg not solana, is default access to anchor cli
- `./danchor build`
- `./danchor deploy`
- `./danchor solana config get`
- `./danchor solana config set --url devnet`
- etc.
