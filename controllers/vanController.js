const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class VanController {

    async create(req, res, next) {
        try {
            const {van_name, fk_type_van, fk_train_id} = req.body
            const van = adminPool.query(
                "SELECT * FROM add_van($1, $2, $3)",
                [van_name, fk_type_van, fk_train_id]
            )
            return res.json(van)
        } catch (e) {
            next(ApiError.badRequest('Не удалось создать вагон. ' + e.message))
        }
    }

    async update(req, res, next) {
        try {
            const {van_id, van_name} = req.body
            const van = adminPool.query(
                "SELECT * FROM update_van($1, $2)",
                [van_id, van_name]
            )
            return res.json(van)
        } catch (e) {
            next(ApiError.badRequest('Не удалось обновить вагон. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {van_id} = req.params
            const van = adminPool.query(
                "SELECT * FROM delete_van($1)",
                [van_id]
            )
            return res.json(van)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить вагон. ' + e.message))
        }
    }

    async getAll(req, res, next) {
        try {
            const {fc_train_id} = req.query
            let vans = userPool.query(
                "SELECT * FROM fetch_vans($1)",
                [fc_train_id]
            )
            vans = vans.rows
            return res.json(vans)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить станции. ' + e.message))
        }
    }

}

module.exports = new VanController()