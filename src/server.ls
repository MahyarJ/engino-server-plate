require! {
  'when': wn
  'express'
  'http'
  'socket.io'
  './namespaces'
  './lib'
  './core/init': initCorePromise
}

<- initCorePromise.then

app = express()
server = http.createServer app
io = socket server

io.on 'connection', (socket) ->
  socket.emit \message,
    title: '-- Hello Dude --'

  socket.on \message, (data) ->
    console.log '---------------------'
    console.log 'Name:', data.name
    console.log 'Message:', data.body

  socket.on \callee, (data) ->
    namespaces[data.fn](data.params)
    .then (result) ->
      console.log result

server.listen 3000, ->
  app.get \*, (req, res) ->
    params = req.query
    fn = req.path.substring(1)
    if namespaces[fn]?
      namespaces[fn](params)
      .then (result) ->
        res.json result
    else
      res.json {success: false, msg: "404"}
  console.log 'Server is online - 3000'
