const mongoose = require('mongoose');


const mongooseInstance_ = mongoose.connect(
    process.env.MONGODB_URL,
    {
        useNewUrlParser: true,
        useCreateIndex: true,
        useFindAndModify: false,
        useUnifiedTopology: true,

        // NOTE: as of the docs `connectTimeoutMS` should be used when `useUnifiedTopology: true`,
        // but apparently it has no impact what so ever. Instead, the following works ¯\_(ツ)_/¯
        serverSelectionTimeoutMS: 10000  // 10 sec
    },
    function( err ){
        if( typeof err !== 'undefined' && err !== null ){
            console.error( new Error( `Cannot connect to database: ${ process.env.MONGODB_URL }` ) );
        }else{
            console.log( `Connect established to database: ${ process.env.MONGODB_URL }` );
        }
    }
);

process.on( 'exit', async ()=>{
    const dbClient = await mongooseInstance_;
    dbClient.disconnect();
});


module.exports = mongooseInstance_;
