const Pool = require('pg').Pool

const adminPool = new Pool( {
    user: process.env.DB_ADMIN,
    password: process.env.DB_ADMIN_PASSWORD,
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    database: process.env.DB_NAME
})

const userPool = new Pool( {
    user: process.env.DB_USER,
    password: process.env.DB_USER_PASSWORD,
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    database: process.env.DB_NAME
})

module.exports = {
    adminPool,
    userPool
}