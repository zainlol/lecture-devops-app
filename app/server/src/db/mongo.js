const mongoose = require('mongoose');


const mongooseInstance_ = mongoose.connect(process.env.MONGODB_URL, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useFindAndModify: false,
    useUnifiedTopology: true,

    // NOTE: as of the docs `connectTimeoutMS` should be used when `useUnifiedTopology: true`,
    // but apparently it has no impact what so ever. Instead, the following works ¯\_(ツ)_/¯
    serverSelectionTimeoutMS: 7000  // 7 sec
});


module.exports = mongooseInstance_;
