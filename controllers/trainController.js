const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class TrainController {

    async create(req, res, next) {
        try {
            const {fk_train_model} = req.body
            const train = await adminPool.query(
                "SELECT * FROM add_train($1)",
                [fk_train_model]
            )
            return res.json(train)
        } catch (e) {
            next(ApiError.badRequest('Не удалось создать поезд. ' + e.message))
        }
    }

    async update(req, res, next) {
        try {
            const {train_id, fk_train_model} = req.body
            const train = await adminPool.query(
                "SELECT * FROM update_train($1, $2)",
                [train_id, fk_train_model]
            )
            return res.json(train)
        } catch (e) {
            next(ApiError.badRequest('Не удалось обновить поезд. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {train_id} = req.params
            const train = await adminPool.query(
                "SELECT * FROM delete_train($1)",
                [train_id]
            )
            return res.json(train)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить поезд. ' + e.message))
        }
    }

    async getAll(req, res, next) {
        try {
            let trains = await userPool.query(
                "SELECT * FROM fetch_train()"
            )
            trains = trains.rows
            return res.json(trains)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить поезда. ' + e.message))
        }
    }

}

module.exports = new TrainController()