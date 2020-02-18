const buildFastify = require('./server/app')

const fastify = buildFastify()

fastify.listen(3000, '0.0.0.0', function (err, address) {
    if (err) {
      console.log(err)
      process.exit(1)
    }
    console.log(`server listening on ${address}`)
  })