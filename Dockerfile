# using linux alpine to reduce image size
# FROM --platform=linux/amd64 alpine:latest
FROM --platform=linux/amd64 ubuntu:latest

# update
# RUN apk update
RUN apt update

# install git, curl, rust
# RUN apk add git curl rustup bash
RUN apt install -y git curl bash pkg-config build-essential libudev-dev libssl-dev

# install rust
# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sed 's#/proc/self/exe#\/bin\/sh#g' | sh -s -- -y

# add path
ENV PATH="$PATH:/root/.cargo/bin/"

# install solana
RUN sh -c "$(curl -sSfL https://release.solana.com/v1.14.21/install)"

# install anchor
RUN cargo install --git https://github.com/coral-xyz/anchor avm --locked --force

# enable avm
RUN avm install latest
RUN avm use latest

# add path
ENV PATH="$PATH:/root/.local/share/solana/install/active_release/bin"

# add to bashrc
RUN echo 'export PATH="$PATH:/root/.local/share/solana/install/active_release/bin"' >> ~/.bashrc

# run in background
CMD ["tail", "-f", "/dev/null"]
