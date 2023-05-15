const Router = require('express')
const router = new Router()
const typeVanController = require('../controllers/typeVanController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('ADMIN'), typeVanController.create)
router.delete('/:id', checkRoleMiddleware('ADMIN'), typeVanController.delete)
router.post('/update', checkRoleMiddleware('ADMIN'), typeVanController.update)
router.get('/', typeVanController.getAll)

module.exports = router
