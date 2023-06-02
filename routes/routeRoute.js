const Router = require('express')
const router = new Router()
const routeController = require('../controllers/routeController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('ADMIN'), routeController.create)
router.delete('/:route_id', checkRoleMiddleware('ADMIN'), routeController.delete)
router.post('/update', checkRoleMiddleware('ADMIN'), routeController.update)
router.get('/', routeController.getAll)
router.get('/today', routeController.getAllToday)

module.exports = router
