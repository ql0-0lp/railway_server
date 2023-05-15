const Router = require('express')
const router = new Router()
const typeVanRoute = require('../controllers/typeVanController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('ADMIN'), typeVanRoute.create)
router.delete('/:id', checkRoleMiddleware('ADMIN'), typeVanRoute.delete)
router.post('/update', checkRoleMiddleware('ADMIN'), typeVanRoute.update)
router.get('/', typeVanRoute.getAll)

module.exports = router
