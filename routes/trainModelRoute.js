const Router = require('express')
const router = new Router()
const trainModelController = require('../controllers/trainModelController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('ADMIN'), trainModelController.create)
router.delete('/:id', checkRoleMiddleware('ADMIN'), trainModelController.delete)
router.post('/update', checkRoleMiddleware('ADMIN'), trainModelController.update)
router.get('/', trainModelController.getAll)

module.exports = router
