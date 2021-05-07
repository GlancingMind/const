FROM node:15.9.0-slim

WORKDIR /home/node/app
RUN chown -R node: /home/node/app
USER node

COPY --chown=node package.json package-lock.json ./
RUN npm ci
COPY --chown=node . .
# NOTE Must run compilation of the rescript files to let rescript create the
# the output directories with above user permissions. Otherwise the first call
# to npm done by the user will fail with `EACCESS: mkdir` error. This also
# happens when the user is root. Still not sure why this is the case, but this
# step resolves the issue.
RUN npm run re:build
# Remove lock-file if not done by above command due to race condition
RUN rm -f .bsb.lock
ENTRYPOINT ["npm"]
