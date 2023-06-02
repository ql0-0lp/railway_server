const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");
const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken");
const {decode} = require("jsonwebtoken");
const Console = require("console");

const generateToken = (user_id, user_login, user_role) => {
    return jwt.sign(
        {user_id, user_login, user_role},
        process.env.SECRET_KEY,
        {expiresIn: '24h'}
    )
}

class UserController {

    async registration(req, res, next) {
        try {
            let {user_name, user_last_name, user_patronymic,
                user_document, user_date_of_birth, user_tel,
                user_email, user_login, user_password} = req.body

            user_password = await bcrypt.hash(user_password, 8)

            let user = await adminPool.query(
                "SELECT * FROM add_human('USER', $1, $2, $3, $4, $5, $6, $7, $8, $9)",
                [user_name, user_last_name, user_patronymic, user_document,
                    user_date_of_birth, user_tel, user_email, user_login, user_password]
            )
            user = await adminPool.query(
                "SELECT user_id, user_login, user_role FROM human WHERE user_login = $1 LIMIT 1;",
                [user_login]
            )
            const {rows} = user
            const token = generateToken(rows[0].user_id, rows[0].user_login, rows[0].user_role)
            return res.json(token)
        } catch (e) {
            next(ApiError.badRequest('Не удалось зарегестрироваться. ' + e.message))
        }
    }

    async login(req, res, next) {
        try {
            const {user_login, user_password} = req.body

            let user = await adminPool.query(
                "SELECT user_id, user_login, user_role, user_password FROM human WHERE user_login = $1 LIMIT 1;",
                [user_login]
            )
            const {rows} = user

            let comparePassword = bcrypt.compareSync(user_password, rows[0].user_password)
            if (!comparePassword) {
                return next(ApiError.badRequest('Неверный логин или пароль'))
            }
            const token = generateToken(rows[0].user_id, rows[0].user_login, rows[0].user_role)
            return res.json(token)
        } catch (e) {
            next(ApiError.badRequest('Не удалось войти. ' + e.message))
        }
    }

    async checkAuth(req, res, next) {
        try {
            const token = generateToken(req.user.user_id, req.user.user_login, req.user.user_role)
            return res.json(token)
        } catch (e) {
            return next(ApiError.badRequest(e.message))
        }
    }

    async update(req, res, next) {
        try {
            let {user_name, user_last_name, user_patronymic,
                user_document, user_date_of_birth, user_tel,
                user_email, user_login, user_password} = req.body

            let user_id = await adminPool.query(
                "SELECT user_id FROM human WHERE user_login = $1 ;",
                [user_login]
            )

            user_id = user_id.rows[0].user_id

            user_password = await bcrypt.hash(user_password, 8)

            let user = await userPool.query(
                "SELECT * FROM update_human($1, $2, $3, $4, $5, $6, $7, $8, $9)",
                [user_id, user_name, user_last_name, user_patronymic, user_document,
                    user_date_of_birth, user_tel, user_email, user_password]
            )

            return res.json(user)
        } catch (e) {
            return next(ApiError.badRequest('Не удалось изменить информацию. ' + e.message))
        }
    }

    async adminUpdate(req, res, next) {
        try {
            let {user_id, user_name, user_last_name, user_patronymic,
                user_document, user_date_of_birth, user_tel,
                user_email, user_password} = req.body

            user_password = await bcrypt.hash(user_password, 8)

            let user = await adminPool.query(
                "SELECT * FROM update_human($1, $2, $3, $4, $5, $6, $7, $8, $9)",
                [user_id, user_name, user_last_name, user_patronymic, user_document,
                    user_date_of_birth, user_tel, user_email, user_password]
            )

            return res.json(user)
        } catch (e) {
            return next(ApiError.badRequest('Не удалось изменить информацию. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            console.log(req.params)
            let user = await adminPool.query(
                "SELECT * FROM delete_human($1)",
                [user_id]
            )

            return res.json(user)
        } catch (e) {
            return next(ApiError.badRequest('Не удалось удалить пользователя. ' + e.message))
        }
    }

}

module.exports = new UserController()