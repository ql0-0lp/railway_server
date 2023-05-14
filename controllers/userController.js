const {adminPool} = require("../database/db");
const ApiError = require("../error/ApiError");
const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken");

const generateToken = (id, login, role) => {
    return jwt.sign(
        {id, login, role},
        process.env.SECRET_KEY,
        {expiresIn: '24h'}
    )
}

class UserController {

    async registration (req, res, next) {
        try {
            let {user_name, user_last_name, user_patronymic, user_document, user_date_of_birth,
                user_tel, user_email, user_login, user_password} = req.body

            user_password = await bcrypt.hash(user_password, 8)

            const user = await adminPool.query(
                "SELECT * FROM add_human($1, $2, $3, $4, $5, $6, $7, $8, $9)",
                [user_name, user_last_name, user_patronymic, user_document, user_date_of_birth, user_tel,
                    user_email, user_login, user_password]
            )

            return res.json(user)
        } catch (e) {
            next(ApiError.badRequest('Не удалось зарегестрироваться. ' + e.message))
        }
    }

    async login (req, res, next) {
        try {
            const {user_login, user_password} = req.body

            let user = await adminPool.query(
                "SELECT user_id, user_login, user_role, user_password FROM human WHERE user_login = $1 LIMIT 1;",
                [user_login]
            )
            user = user.rows[0]

            let comparePassword = bcrypt.compareSync(user_password, user.user_password)
            if (!comparePassword) {
                return next(ApiError.badRequest('Неверный логин или пароль'))
            }

            const token = generateToken(user.user_id, user.user_login, user.user_role)
            return res.json(token)
        } catch (e) {
            next(ApiError.badRequest('Не удалось войти. ' + e.message))
        }
    }

    async checkAuth (req, res, next) {
        try {
            const token = generateToken(req.user.id, req.user.login, req.user.role)
            return res.json(token)
        } catch (e) {
            return next(ApiError.badRequest(e.message))
        }
    }

}

module.exports = new UserController()