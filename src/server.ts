import Fastify from 'fastify';

const app = Fastify({ logger: true });

// Declare a route
app.get('/', async function handler (request, reply) {
  reply.send({ hello: 'world' });
});

// Run the server!
app.listen({ port: parseInt(process.env.PORT || '3000'), host: process.env.HOST || 'localhost'})
  .then((address) => {
    app.log.info(`server listening on ${address}`);
  })
  .catch((err) => {
    app.log.error(err);
    process.exit(1);
  });
