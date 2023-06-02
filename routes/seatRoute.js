const Router = require('express')
const router = new Router()
const seatController = require('../controllers/seatController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('ADMIN'), seatController.create)
router.delete('/:seat_id', checkRoleMiddleware('ADMIN'), seatController.delete)
router.post('/update', checkRoleMiddleware('ADMIN'), seatController.update)
router.get('/', seatController.getAll)

module.exports = router
