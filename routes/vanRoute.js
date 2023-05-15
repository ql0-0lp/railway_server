const Router = require('express')
const router = new Router()
const vanController = require('../controllers/vanController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('ADMIN'), vanController.create)
router.delete('/:id', checkRoleMiddleware('ADMIN'), vanController.delete)
router.post('/update', checkRoleMiddleware('ADMIN'), vanController.update)
router.get('/', vanController.getAll)

module.exports = router
