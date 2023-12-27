FROM node:14-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install -g ts-node typescript
COPY . .
RUN npm run build

FROM node:14-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
RUN npm install -g ts-node typescript
COPY --from=builder /app/dist /app/dist
ENV PATH /app/node_modules/.bin:$PATH
EXPOSE 3000
CMD ["npm", "run", "start:prod"]
