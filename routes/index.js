const Router = require('express')
const router = new Router()
const userRoute = require('./userRoute')
const cityRoute = require('./cityRoute')
const railwayStationRoute = require('./railwayStationRoute')
const seatRoute = require('./seatRoute')

router.use('/user', userRoute)
router.use('/city', cityRoute)
router.use('/railway-station', railwayStationRoute)
router.use('/seat', seatRoute)

module.exports = router
