const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class TrainModelController {

    async create(req, res, next) {
        try {
            const {train_model_name, max_van} = req.body
            const trainModel = await adminPool.query(
                "SELECT * FROM add_train_model($1, $2)",
                [train_model_name, max_van]
            )
            return res.json(trainModel)
        } catch (e) {
            next(ApiError.badRequest('Не удалось создать модель поезда. ' + e.message))
        }
    }

    async update(req, res, next) {
        try {
            const {train_model_id, train_model_name, max_van} = req.body
            const trainModel = await adminPool.query(
                "SELECT * FROM update_train_model($1, $2, $3)",
                [train_model_id, train_model_name, max_van]
            )
            return res.json(trainModel)
        } catch (e) {
            next(ApiError.badRequest('Не удалось обновить модель поезда. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {train_model_id} = req.params
            const trainModel = await adminPool.query(
                "SELECT * FROM delete_train_model($1)",
                [train_model_id]
            )
            return res.json(trainModel)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить модель поезда. ' + e.message))
        }
    }

    async getAll(req, res, next) {
        try {
            let trainModels = await userPool.query(
                "SELECT * FROM fetch_train_model()"
            )
            trainModels = trainModels.rows
            return res.json(trainModels)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить места в вагоне. ' + e.message))
        }
    }

}

module.exports = new TrainModelController()