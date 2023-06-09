const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class SeatController {

    async create(req, res, next) {
        try {
            const {seat_num, fk_van_id} = req.body
            const seat = await adminPool.query(
                "SELECT * FROM add_seats($1, $2, true)",
                [seat_num, fk_van_id]
            )
            return res.json(seat)
        } catch (e) {
            next(ApiError.badRequest('Не удалось создать место в вагоне. ' + e.message))
        }
    }

    async update(req, res, next) {
        try {
            const {seat_id, seat_num, is_seat_free} = req.body
            const seat = await adminPool.query(
                "SELECT * FROM update_seats($1, $2, $3)",
                [seat_id, seat_num, is_seat_free]
            )
            return res.json(seat)
        } catch (e) {
            next(ApiError.badRequest('Не удалось обновить место. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {seat_id} = req.params
            const seat = await adminPool.query(
                "SELECT * FROM delete_seats($1)",
                [seat_id]
            )
            return res.json(seat)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить место. ' + e.message))
        }
    }

    async getAll(req, res, next) {
        try {
            const {fk_van_id} = req.query
            let seats = await userPool.query(
                "SELECT * FROM free_seat($1)",
                [fk_van_id]
            )
            seats = seats.rows
            return res.json(seats)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить места в вагоне. ' + e.message))
        }
    }

}

module.exports = new SeatController()