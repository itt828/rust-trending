FROM --platform=linux/amd64 messense/rust-musl-cross:x86_64-musl AS build
COPY . /app
RUN cargo install --path /app --root /x

FROM alpine
COPY --from=build /x/bin/rust-trending /usr/local/bin/rust-trending
COPY --from=build  /app/config.toml /config.toml
CMD ["rust-trending"]
