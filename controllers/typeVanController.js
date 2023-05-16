const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class TypeVanController {

    async create(req, res, next) {
        try {
            const {type_van_name, seat_count} = req.body
            const typeVan = await adminPool.query(
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
            const typeVan = await adminPool.query(
                "SELECT * FROM update_type_van($1, $2)",
                [type_van_name, seat_count]
            )
            return res.json(typeVan)
        } catch (e) {
            next(ApiError.badRequest('Не удалось обновить тип вагона. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {type_van_name} = req.params
            const typeVan = await adminPool.query(
                "SELECT * FROM delete_type_van($1)",
                [type_van_name]
            )
            return res.json(typeVan)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить тип вагона. ' + e.message))
        }
    }

    async getAll(req, res, next) {
        try {
            let typesVan = await userPool.query(
                "SELECT * FROM fetch_type_van()"
            )
            typesVan = typesVan.rows
            return res.json(typesVan)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить типы вагонов. ' + e.message))
        }
    }

}

module.exports = new TypeVanController()