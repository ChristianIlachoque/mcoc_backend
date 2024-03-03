import { Router } from "express";

const router = Router()

router.get('/champions', (req, res) => {
    res.send('champions')
})
export default router;