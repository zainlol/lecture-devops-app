const path = require( 'path' );

const express = require('express')
const cors = require('cors')
const helmet = require('helmet')
require('./db/mongoose')
const todoRoutes = require('./routes/todo-routes')
const userRoutes = require('./routes/user-routes')
const errorRoutes = require('./routes/error-routes')
let cookieParser = require('cookie-parser')

const app = express()
const port = process.env.PORT || 5000

const corsOptions = {
    origin: `http://localhost:${ port }`,
    credentials: true
}

app.use(express.json())
app.use(cors(corsOptions))

app.use(cookieParser())

app.use(helmet())
app.use(helmet.contentSecurityPolicy({
    directives: {
        defaultSrc: ["'self'"],
        styleSrc: ["'self' 'unsafe-inline'"],
        scriptSrc: ["'self' 'unsafe-inline' 'unsafe-eval'"]
    }
}))

app.use(todoRoutes)
app.use(userRoutes)
app.use('/', express.static(path.join(__dirname,`./../../client/build`)));
app.use(errorRoutes)

app.listen(port, () => {
    console.log('ToDo server is up on port ' + port)
})

