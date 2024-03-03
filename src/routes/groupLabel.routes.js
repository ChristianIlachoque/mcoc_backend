import { Router } from "express";
import { PrismaClient } from '@prisma/client'

const router = Router()
const prisma = new PrismaClient()

router.get('/group_labels', async (req, res) => {
    const groupLabels = await prisma.groupLabel.findMany();
    res.json(groupLabels);
})

router.post('/group_labels', async (req, res) => {
    const newGroupLabel = await prisma.groupLabel.create({
        data: req.body,
    });
    res.json(newGroupLabel);
})

export default router;