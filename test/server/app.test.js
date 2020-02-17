const buildFastify = require('../../server/app')

test('GET `/` route', () => {

  const fastify = buildFastify()

  fastify.inject({
    method: 'GET',
    url: '/'
  }, (err, response) => {
    expect(response.statusCode).toBe(200)
    expect(response.json()).toStrictEqual({ hello: 'world' })
  })
})