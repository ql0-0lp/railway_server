const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class RailwayStationController {

    async create(req, res, next) {
        try {
            const {railway_station_name, fk_city_id} = req.body
            const railwayStation = await adminPool.query(
                "SELECT * FROM add_railway_station($1, $2)",
                [railway_station_name, fk_city_id]
            )
            return res.json(railwayStation)
        } catch (e) {
            next(ApiError.badRequest('Не удалось создать станцию. ' + e.message))
        }
    }

    async update(req, res, next) {
        try {
            const {railway_station_id, railway_station_name} = req.body
            const railwayStation = await adminPool.query(
                "SELECT * FROM update_railway_station($1, $2)",
                [railway_station_id, railway_station_name]
            )
            return res.json(railwayStation)
        } catch (e) {
            next(ApiError.badRequest('Не удалось обновить станцию. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {railway_station_id} = req.params
            const railwayStation = await adminPool.query(
                "SELECT * FROM delete_railway_station($1)",
                [railway_station_id]
            )
            return res.json(railwayStation)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить станцию. ' + e.message))
        }
    }

    async getAll(req, res, next) {
        try {
            const {fk_city_id} = req.query
            let cities = await userPool.query(
                "SELECT * FROM fetch_railway_station($1)",
                [fk_city_id]
            )
            cities = cities.rows
            return res.json(cities)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить станции. ' + e.message))
        }
    }

}

module.exports = new RailwayStationController()