import express from 'express'
import allianceRoutes from './routes/alliance.routes.js';
import allianceMemberRoutes from './routes/allianceMember.routes.js';
import assignmentAttackRoutes from './routes/assignmentAttack.routes.js';
import assignmentDefenseRoutes from './routes/assignmentDefense.routes.js';
import championRoutes from './routes/champion.routes.js';
import championLabelRoutes from './routes/championLabel.routes.js';
import classOtherRoutes from './routes/classOther.routes.js';
import groupLabelRoutes from './routes/groupLabel.routes.js';
import groupWarRoutes from './routes/groupWar.routes.js';
import labelRoutes from './routes/label.routes.js';
import leagueRoutes from './routes/league.routes.js';
import relicRoutes from './routes/relic.routes.js';
import rosterUserChampionRoutes from './routes/rosterUserChampion.routes.js';
import rosterUserRelicRoutes from './routes/rosterUserRelic.routes.js';
import userRoutes from './routes/user.routes.js';

const app = express()

app.use(express.json())

app.use("/api", assignmentAttackRoutes)
app.use("/api", assignmentDefenseRoutes)
app.use("/api", championRoutes)
app.use("/api", championLabelRoutes)
app.use("/api", allianceRoutes)
app.use("/api", allianceMemberRoutes)
app.use("/api", classOtherRoutes)
app.use("/api", groupLabelRoutes)
app.use("/api", groupWarRoutes)
app.use("/api", labelRoutes)
app.use("/api", leagueRoutes)
app.use("/api", relicRoutes)
app.use("/api", rosterUserChampionRoutes)
app.use("/api", rosterUserRelicRoutes)
app.use("/api", userRoutes)

app.listen(3000)
console.log('SERVER on port ', 3000)