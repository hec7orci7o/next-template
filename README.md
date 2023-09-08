# next-template

![node](https://img.shields.io/badge/node-20.x-blue)
![npm](https://img.shields.io/badge/npm-9.8.1-blue)

![Next JS](https://img.shields.io/badge/Next-black?style=for-the-badge&logo=next.js&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white)
![ESLint](https://img.shields.io/badge/ESLint-4B3263?style=for-the-badge&logo=eslint&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

## Folder structure

> **Note** 
> **_document.js vs. _app.js -- [What is the difference?](https://github.com/vercel/next.js/discussions/39821)**

- `_app.js`: Core of the application, everything is assembled from here at runtime.
- `_document.js`: Where side effects are possible.
- `context`: Encapsulates a global state that can be accessed from anywhere in the application.
- `hooks`: Encapsulates small pieces of code that represent a certain type of logic.
- `lib`: Chaos property, stores here functionalities that do not have to do with the rest of the mentioned sections. 
- `public`: Static content.
- `styles`: Contains the styles of the application. Override or new styles in `tailwind.config.js`.

## Getting Started

### Install dependencies

```bash
npm run ci
```

### Run for a development environment

```bash
npm run dev
```

### Run for a production environment

```bash
npm run build
npm run start
```

### Compile for docker

```bash
docker build -t next-template:latest .
```

```bash
docker run -p 3000:3000 --env-file .env next-template:latest
```

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/)
