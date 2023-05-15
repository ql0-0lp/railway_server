const {adminPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class TypeVanController {

    async create(req, res, next) {
        try {
            const {type_van_name, seat_count} = req.body
            const typeVan = adminPool.query(
                "SELECT * FROM add_type_van($1, $2)",
                [type_van_name, seat_count]
            )
            return res.json(typeVan)
        } catch (e) {
            next(ApiError.badRequest('Не удалось создать тип вагона. ' + e.message))
        }
    }

    async update(req, res, next) {
        try {
            const {type_van_name, seat_count} = req.body
            const van = adminPool.query(
                "SELECT * FROM update_type_van($1, $2)",
                [type_van_name, seat_count]
            )
            return res.json(van)
        } catch (e) {
            next(ApiError.badRequest('Не удалось обновить тип вагона. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {type_van_name} = req.params
            const van = adminPool.query(
                "SELECT * FROM delete_type_van($1)",
                [type_van_name]
            )
            return res.json(van)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить тип вагона. ' + e.message))
        }
    }

    async getAll(req, res, next) {

    }

}

module.exports = new TypeVanController()