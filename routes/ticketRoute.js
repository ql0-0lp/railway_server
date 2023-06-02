const Router = require('express')
const router = new Router()
const ticketController = require('../controllers/ticketController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('USER ADMIN'), ticketController.create)
router.delete('/:ticket_id', checkRoleMiddleware('USER ADMIN'), ticketController.delete)
router.post('/update', checkRoleMiddleware('ADMIN'), ticketController.update)
router.get('/', ticketController.getAll)

module.exports = router
