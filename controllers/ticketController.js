const {adminPool, userPool} = require("../database/db");
const ApiError = require("../error/ApiError");

class TicketController {

    async create(req, res, next) {
        try {
            const {fk_user_id, fk_route_id, fk_seat_id, fk_van_id} = req.body
            const ticket = await adminPool.query(
                "SELECT * FROM add_ticket($1, $2, $3, $4)",
                [fk_user_id, fk_route_id, fk_seat_id, fk_van_id]
            )
            await adminPool.query(
                "UPDATE seats SET is_seat_free = false WHERE seat_id = $1",
                [fk_seat_id]
            )
            return res.json(ticket)
        } catch (e) {
            next(ApiError.badRequest('Не удалось создать билет в вагоне. ' + e.message))
        }
    }

    async update(req, res, next) {
        try {
            const {ticket_id, fk_user_id, fk_route_id, fk_seat_id, fk_van_id} = req.body
            const ticket = await adminPool.query(
                "SELECT * FROM update_ticket($1, $2, $3, $4, $5)",
                [ticket_id, fk_user_id, fk_route_id.toString(),
                    fk_seat_id.toString(), fk_van_id.toString()]
            )
            return res.json(ticket)
        } catch (e) {
            next(ApiError.badRequest('Не удалось обновить билет в вагоне. ' + e.message))
        }
    }

    async delete(req, res, next) {
        try {
            const {ticket_id} = req.params
            const seat_id = await adminPool.query(
                "SELECT fk_seat_id FROM ticket WHERE ticket_id = $1 LIMIT 1;",
                [ticket_id]
            )
            const {rows} = seat_id
            await adminPool.query(
                "UPDATE seats SET is_seat_free = true WHERE seat_id = $1",
                [rows[0].fk_seat_id]
            )

            const ticket = await adminPool.query(
                "SELECT * FROM delete_ticket($1)",
                [ticket_id]
            )
            return res.json(ticket)
        } catch (e) {
            next(ApiError.badRequest('Не удалось удалить билет. ' + e.message))
        }
    }

    async getAll(req, res, next) {
        try {
            const {user_id} = req.query
            const tickets = await adminPool.query(
                "SELECT * FROM fetch_tickets($1)",
                [user_id]
            )
            return res.json(tickets)
        } catch (e) {
            next(ApiError.badRequest('Не удалось получить билеты. ' + e.message))
        }
    }

}

module.exports = new TicketController()