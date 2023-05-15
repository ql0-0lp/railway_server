const {adminPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class TicketController {

    async create(req, res, next) {

    }

    async update(req, res, next) {

    }

    async delete(req, res, next) {
        try {
            const {ticket_id} = req.params
            const seat = adminPool.query(
                "SELECT * FROM delete_ticket($1)",
                [ticket_id]
            )
            return res.json(seat)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить место. ' + e.message))
        }
    }

    async getAll(req, res, next) {

    }

}

module.exports = new TicketController()