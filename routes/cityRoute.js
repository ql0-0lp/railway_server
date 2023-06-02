const Router = require('express')
const router = new Router()
const citiesController = require('../controllers/citiesController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('ADMIN'), citiesController.create)
router.delete('/:city_name', checkRoleMiddleware('ADMIN'), citiesController.delete)
router.get('/', citiesController.getAll)

module.exports = router
