const Router = require('express')
const router = new Router()
const railwayStationController = require('../controllers/railwayStationController')
const checkRoleMiddleware = require('../middleware/checkRoleMiddleware')

router.post('/', checkRoleMiddleware('ADMIN'), railwayStationController.create)
router.delete('/:railway_station_id', checkRoleMiddleware('ADMIN'), railwayStationController.delete)
router.post('/update', checkRoleMiddleware('ADMIN'), railwayStationController.update)
router.get('/', railwayStationController.getAll)

module.exports = router
