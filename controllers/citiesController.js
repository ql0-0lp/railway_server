const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class CitiesController {

    async create(req, res, next) {
        try {
            const {city_name} = req.body
            const city = adminPool.query(
                "SELECT * FROM add_cities($1)",
                [city_name]

            )
            return res.json(city)
        } catch (e) {
            next(ApiError.badRequest('Не удалось создать город. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {city_id} = req.params
            const city = adminPool.query(
                "SELECT * FROM delete_cities($1)",
                [city_id]
            )
            return res.json(city)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить город. ' + e.message))
        }
    }

    async getAll(req, res, next) {
        try {
            let cities = userPool.query("SELECT * FROM fetch_city()")
            cities = cities.rows
            return res.json(cities)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить города. ' + e.message))
        }
    }

}

module.exports = new CitiesController()