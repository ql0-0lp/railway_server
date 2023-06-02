const Router = require('express')
const router = new Router()
const trainController = require('../controllers/trainController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('ADMIN'), trainController.create)
router.delete('/:train_id', checkRoleMiddleware('ADMIN'), trainController.delete)
router.post('/update', checkRoleMiddleware('ADMIN'), trainController.update)
router.get('/', trainController.getAll)

module.exports = router
