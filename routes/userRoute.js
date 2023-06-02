const Router = require('express')
const router = new Router()
const userController = require('../controllers/userController')
const authMiddleware = require('../middleware/authMiddleware')
const checkRoleMiddleware = require("../middleware/checkRoleMiddleware");

router.post('/registration', userController.registration)
router.post('/login', userController.login)
router.get('/auth', authMiddleware, userController.checkAuth)
router.post('/update', checkRoleMiddleware('USER ADMIN'), userController.update)
router.post('/admin-update', checkRoleMiddleware('ADMIN'), userController.adminUpdate)
router.delete('/:human_id', checkRoleMiddleware('ADMIN'), userController.delete)

module.exports = router
