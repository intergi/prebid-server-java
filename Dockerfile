FROM amazoncorretto:17

WORKDIR /app/prebid-server

VOLUME /app/prebid-server/conf
VOLUME /app/prebid-server/data

COPY src/main/docker/run.sh ./
COPY src/main/docker/application.yaml ./
COPY src/main/docker/app-settings.yaml ./ 
COPY target/prebid-server.jar ./
COPY stored_requests/ ./stored_requests/
COPY stored_responses/ ./stored_responses/

EXPOSE 8080
EXPOSE 8060

ENTRYPOINT [ "/app/prebid-server/run.sh" ]