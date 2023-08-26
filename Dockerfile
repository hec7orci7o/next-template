# Stage 1: Install dependencies
FROM node:alpine AS deps
RUN apk add --no-cache libc6-compat && \
    addgroup -g 1001 -S nodejs && \
    adduser -S nextjs -u 1001
WORKDIR /next-template
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile && \
    npm cache clean --force

# Stage 2: Build the source code
FROM node:alpine AS builder
WORKDIR /next-template
COPY . .
COPY --from=deps /next-template/node_modules ./node_modules
RUN npm run build && \
    npm install --force --production --ignore-scripts --prefer-offline

# Stage 3: Production image
FROM node:alpine AS runner
WORKDIR /next-template

ENV NODE_ENV production
ENV PORT 3000

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nextjs -u 1001

COPY --from=builder --chown=nextjs:nodejs /next-template/ .

USER nextjs

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD \
    wget --quiet --spider http://localhost:3000/ || exit 1

ENTRYPOINT ["npm", "start"]
