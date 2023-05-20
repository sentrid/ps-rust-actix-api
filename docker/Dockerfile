FROM rust:latest
LABEL Name=psrustactixapi Version=0.0.1
EXPOSE 3000 3001
COPY flight-plan /home
WORKDIR /home
RUN cargo clean
RUN cargo build
RUN mkdir ./target/debug/assets
RUN cp ./assets/*.* ./target/debug/assets
RUN cp ./config.toml ./target/debug
CMD ./target/debug/flight-plan