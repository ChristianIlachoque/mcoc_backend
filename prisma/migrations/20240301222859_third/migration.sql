-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Champion" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "classId" INTEGER NOT NULL,
    CONSTRAINT "Champion_classId_fkey" FOREIGN KEY ("classId") REFERENCES "ClassOther" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Champion" ("classId", "createdAt", "id", "image", "isActive", "name") SELECT "classId", "createdAt", "id", "image", "isActive", "name" FROM "Champion";
DROP TABLE "Champion";
ALTER TABLE "new_Champion" RENAME TO "Champion";
CREATE TABLE "new_GroupLabel" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL
);
INSERT INTO "new_GroupLabel" ("createdAt", "id", "isActive", "name") SELECT "createdAt", "id", "isActive", "name" FROM "GroupLabel";
DROP TABLE "GroupLabel";
ALTER TABLE "new_GroupLabel" RENAME TO "GroupLabel";
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "nickName" TEXT NOT NULL,
    "prestige" INTEGER NOT NULL
);
INSERT INTO "new_User" ("createdAt", "email", "id", "isActive", "nickName", "password", "prestige", "userName") SELECT "createdAt", "email", "id", "isActive", "nickName", "password", "prestige", "userName" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
CREATE TABLE "new_AssignmentDefense" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rosterUserChampionId" INTEGER NOT NULL,
    "clanMemberId" INTEGER NOT NULL,
    "groupWarId" INTEGER NOT NULL,
    CONSTRAINT "AssignmentDefense_rosterUserChampionId_fkey" FOREIGN KEY ("rosterUserChampionId") REFERENCES "RosterUserChampion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentDefense_clanMemberId_fkey" FOREIGN KEY ("clanMemberId") REFERENCES "ClanMember" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentDefense_groupWarId_fkey" FOREIGN KEY ("groupWarId") REFERENCES "GroupWar" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AssignmentDefense" ("clanMemberId", "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId") SELECT "clanMemberId", "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId" FROM "AssignmentDefense";
DROP TABLE "AssignmentDefense";
ALTER TABLE "new_AssignmentDefense" RENAME TO "AssignmentDefense";
CREATE UNIQUE INDEX "AssignmentDefense_rosterUserChampionId_key" ON "AssignmentDefense"("rosterUserChampionId");
CREATE TABLE "new_AssignmentAttack" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rosterUserChampionId" INTEGER NOT NULL,
    "clanMemberId" INTEGER NOT NULL,
    "groupWarId" INTEGER NOT NULL,
    CONSTRAINT "AssignmentAttack_rosterUserChampionId_fkey" FOREIGN KEY ("rosterUserChampionId") REFERENCES "RosterUserChampion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentAttack_clanMemberId_fkey" FOREIGN KEY ("clanMemberId") REFERENCES "ClanMember" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentAttack_groupWarId_fkey" FOREIGN KEY ("groupWarId") REFERENCES "GroupWar" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AssignmentAttack" ("clanMemberId", "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId") SELECT "clanMemberId", "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId" FROM "AssignmentAttack";
DROP TABLE "AssignmentAttack";
ALTER TABLE "new_AssignmentAttack" RENAME TO "AssignmentAttack";
CREATE UNIQUE INDEX "AssignmentAttack_rosterUserChampionId_key" ON "AssignmentAttack"("rosterUserChampionId");
CREATE TABLE "new_ChampionLabel" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "championId" INTEGER NOT NULL,
    "labelId" INTEGER NOT NULL,
    CONSTRAINT "ChampionLabel_championId_fkey" FOREIGN KEY ("championId") REFERENCES "Champion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ChampionLabel_labelId_fkey" FOREIGN KEY ("labelId") REFERENCES "Label" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ChampionLabel" ("championId", "createdAt", "id", "isActive", "labelId") SELECT "championId", "createdAt", "id", "isActive", "labelId" FROM "ChampionLabel";
DROP TABLE "ChampionLabel";
ALTER TABLE "new_ChampionLabel" RENAME TO "ChampionLabel";
CREATE TABLE "new_Clan" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "prestige" INTEGER NOT NULL,
    "minimun_prestige" INTEGER NOT NULL,
    "number_members" INTEGER NOT NULL
);
INSERT INTO "new_Clan" ("createdAt", "id", "isActive", "minimun_prestige", "name", "number_members", "prestige") SELECT "createdAt", "id", "isActive", "minimun_prestige", "name", "number_members", "prestige" FROM "Clan";
DROP TABLE "Clan";
ALTER TABLE "new_Clan" RENAME TO "Clan";
CREATE TABLE "new_Label" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "groupLabelId" INTEGER NOT NULL,
    CONSTRAINT "Label_groupLabelId_fkey" FOREIGN KEY ("groupLabelId") REFERENCES "GroupLabel" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Label" ("createdAt", "groupLabelId", "id", "isActive", "name") SELECT "createdAt", "groupLabelId", "id", "isActive", "name" FROM "Label";
DROP TABLE "Label";
ALTER TABLE "new_Label" RENAME TO "Label";
CREATE TABLE "new_GroupWar" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL
);
INSERT INTO "new_GroupWar" ("createdAt", "id", "isActive", "name") SELECT "createdAt", "id", "isActive", "name" FROM "GroupWar";
DROP TABLE "GroupWar";
ALTER TABLE "new_GroupWar" RENAME TO "GroupWar";
CREATE TABLE "new_ClassOther" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "icon" TEXT NOT NULL
);
INSERT INTO "new_ClassOther" ("createdAt", "icon", "id", "isActive", "name") SELECT "createdAt", "icon", "id", "isActive", "name" FROM "ClassOther";
DROP TABLE "ClassOther";
ALTER TABLE "new_ClassOther" RENAME TO "ClassOther";
CREATE TABLE "new_RosterUserChampion" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "tier" INTEGER NOT NULL,
    "rank" INTEGER NOT NULL,
    "isDuplicate" BOOLEAN NOT NULL,
    "sing" INTEGER NOT NULL,
    "isAscendite" BOOLEAN NOT NULL,
    "prestige" INTEGER NOT NULL,
    "isDefense" BOOLEAN NOT NULL,
    "isAttack" BOOLEAN NOT NULL,
    "userId" INTEGER NOT NULL,
    "championId" INTEGER NOT NULL,
    CONSTRAINT "RosterUserChampion_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "RosterUserChampion_championId_fkey" FOREIGN KEY ("championId") REFERENCES "Champion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_RosterUserChampion" ("championId", "createdAt", "id", "isActive", "isAscendite", "isAttack", "isDefense", "isDuplicate", "prestige", "rank", "sing", "tier", "userId") SELECT "championId", "createdAt", "id", "isActive", "isAscendite", "isAttack", "isDefense", "isDuplicate", "prestige", "rank", "sing", "tier", "userId" FROM "RosterUserChampion";
DROP TABLE "RosterUserChampion";
ALTER TABLE "new_RosterUserChampion" RENAME TO "RosterUserChampion";
CREATE TABLE "new_ClanMember" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rol" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "clanId" INTEGER NOT NULL,
    CONSTRAINT "ClanMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ClanMember_clanId_fkey" FOREIGN KEY ("clanId") REFERENCES "Clan" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ClanMember" ("clanId", "createdAt", "id", "isActive", "rol", "userId") SELECT "clanId", "createdAt", "id", "isActive", "rol", "userId" FROM "ClanMember";
DROP TABLE "ClanMember";
ALTER TABLE "new_ClanMember" RENAME TO "ClanMember";
CREATE UNIQUE INDEX "ClanMember_userId_key" ON "ClanMember"("userId");
CREATE TABLE "new_Relic" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "classId" INTEGER NOT NULL,
    CONSTRAINT "Relic_classId_fkey" FOREIGN KEY ("classId") REFERENCES "ClassOther" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Relic" ("classId", "createdAt", "id", "image", "isActive", "name") SELECT "classId", "createdAt", "id", "image", "isActive", "name" FROM "Relic";
DROP TABLE "Relic";
ALTER TABLE "new_Relic" RENAME TO "Relic";
CREATE TABLE "new_RosterUserRelic" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "tier" INTEGER NOT NULL,
    "rank" INTEGER NOT NULL,
    "isDuplicate" BOOLEAN NOT NULL,
    "sing" INTEGER NOT NULL,
    "prestige" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "relicId" INTEGER NOT NULL,
    CONSTRAINT "RosterUserRelic_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "RosterUserRelic_relicId_fkey" FOREIGN KEY ("relicId") REFERENCES "Relic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_RosterUserRelic" ("createdAt", "id", "isActive", "isDuplicate", "prestige", "rank", "relicId", "sing", "tier", "userId") SELECT "createdAt", "id", "isActive", "isDuplicate", "prestige", "rank", "relicId", "sing", "tier", "userId" FROM "RosterUserRelic";
DROP TABLE "RosterUserRelic";
ALTER TABLE "new_RosterUserRelic" RENAME TO "RosterUserRelic";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
