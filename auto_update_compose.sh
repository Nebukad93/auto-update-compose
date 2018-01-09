#!/bin/bash

COMPOSE_VERSION=$(docker-compose version --short)
NEW_COMPOSE_VERSION=$(curl https://github.com/docker/compose/releases/latest 2> /dev/null | sed 's#.*tag/##;s#">.*##' |  cut -dv -f2)

echo locale: $COMPOSE_VERSION
echo git: $NEW_COMPOSE_VERSION


f_maj_compose() {

		curl -Ls https://github.com/docker/compose/releases/download/$NEW_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
}

if [ "${COMPOSE_VERSION}" != "${NEW_COMPOSE_VERSION}" ]; then
    echo "Mise à jour de ${COMPOSE_VERSION} vers ${NEW_COMPOSE_VERSION}"
    f_maj_compose
    else echo "Votre version de docker-compose est à jour"
fi

