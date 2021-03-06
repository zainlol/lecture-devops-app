const path = require( 'path' );

const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const dbClientInstance_ = require('./db/mongo.js');
const todoRoutes = require('./routes/todo');
const userRoutes = require('./routes/user');
const errorRoutes = require('./routes/error');
let cookieParser = require('cookie-parser');

const app = express();
const port = process.env.PORT || 5000;

const corsOptions = {
    origin: `http://localhost:${ port }`,
    credentials: true
};

app.use(express.json());
app.use(cors(corsOptions));

app.use(cookieParser());

app.use(helmet());
app.use(helmet.contentSecurityPolicy({
    directives: {
        defaultSrc: ["'self'"],
        styleSrc: ["'self' 'unsafe-inline'"],
        scriptSrc: ["'self' 'unsafe-inline' 'unsafe-eval'"]
    }
}));

app.use(todoRoutes);
app.use(userRoutes);
app.use('/', express.static(path.resolve(__dirname, `./public`)));
app.use(errorRoutes);


(async function main(){
    try{
        await new Promise( (__ful, rej__ )=>{
            app.listen(port, function(){
                console.log( `ToDo server is up on port ${ port }`);
                __ful();
            }).on( 'error', rej__);
        });
    }catch( err ){
        console.error( err );
        process.exit( 1 );
    }
})();
