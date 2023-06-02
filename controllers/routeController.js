const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class RouteController {

    async create(req, res, next) {
        try {
            const {date_of_departure, date_of_arrival, fk_departure_station,
                fk_arrival_station, fk_train_id} = req.body
            const route = await adminPool.query(
                "SELECT * FROM add_route($1, $2, $3, $4, $5)",
                [date_of_departure, date_of_arrival, fk_departure_station,
                    fk_arrival_station, fk_train_id]
            )
            return res.json(route)
        } catch (e) {
            next(ApiError.badRequest('Не удалось создать рейс. ' + e.message))
        }
    }

    async update(req, res, next) {
        try {
            const {route_id, date_of_departure, date_of_arrival, fk_departure_station,
                fk_arrival_station, fk_train_id} = req.body
            const route = await adminPool.query(
                "SELECT * FROM update_route($1, $2, $3, $4, $5, $6)",
                [route_id, date_of_departure, date_of_arrival, fk_departure_station,
                    fk_arrival_station, fk_train_id]
            )
            return res.json(route)
        } catch (e) {
            next(ApiError.badRequest('Не удалось бновить рейс. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {route_id} = req.params

            const city = await adminPool.query(
                "SELECT * FROM delete_route($1)",
                [route_id]
            )
            return res.json(city)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить маршрут. ' + e.message))
        }
    }

    async getAll(req, res, next) {
        try {
            const {route_id, city_departure, city_arrival, date_of_departure} = req.query
            let routes

            if (route_id)
                routes = await adminPool.query(
                    "SELECT * FROM fetch_id_route($1)",
                    [route_id]
                )
            else if (city_departure && city_arrival && date_of_departure)
                routes = await adminPool.query(
                    "SELECT * FROM fetch_routes_by_data($1, $2, $3)",
                    [city_departure, city_arrival, date_of_departure]
                )
            else
                routes = await adminPool.query(
                    "SELECT * FROM fetch_routes()"
                )
            return res.json(routes)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить маршруты. ' + e.message))
        }
    }

    async getAllToday(req, res, next) {
        try {
            const routes = await adminPool.query(
                "SELECT * FROM fetch_routes_today()"
            )
            return res.json(routes)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить маршруты. ' + e.message))
        }
    }

}

module.exports = new RouteController()