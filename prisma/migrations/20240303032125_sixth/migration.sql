/*
  Warnings:

  - The primary key for the `RosterUserRelic` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `GroupWar` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Champion` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `AssignmentDefense` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Label` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ClassOther` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `RosterUserChampion` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ChampionLabel` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `AllianceMember` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `AssignmentAttack` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `League` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `GroupLabel` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Relic` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Alliance` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_RosterUserRelic" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "tier" INTEGER NOT NULL,
    "rank" INTEGER NOT NULL,
    "isDuplicate" BOOLEAN NOT NULL,
    "sing" INTEGER NOT NULL,
    "prestige" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "relicId" TEXT NOT NULL,
    CONSTRAINT "RosterUserRelic_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "RosterUserRelic_relicId_fkey" FOREIGN KEY ("relicId") REFERENCES "Relic" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_RosterUserRelic" ("createdAt", "id", "isActive", "isDuplicate", "prestige", "rank", "relicId", "sing", "tier", "userId") SELECT "createdAt", "id", "isActive", "isDuplicate", "prestige", "rank", "relicId", "sing", "tier", "userId" FROM "RosterUserRelic";
DROP TABLE "RosterUserRelic";
ALTER TABLE "new_RosterUserRelic" RENAME TO "RosterUserRelic";
CREATE TABLE "new_GroupWar" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL
);
INSERT INTO "new_GroupWar" ("createdAt", "id", "isActive", "name") SELECT "createdAt", "id", "isActive", "name" FROM "GroupWar";
DROP TABLE "GroupWar";
ALTER TABLE "new_GroupWar" RENAME TO "GroupWar";
CREATE TABLE "new_Champion" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "classId" TEXT NOT NULL,
    CONSTRAINT "Champion_classId_fkey" FOREIGN KEY ("classId") REFERENCES "ClassOther" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Champion" ("classId", "createdAt", "id", "image", "isActive", "name") SELECT "classId", "createdAt", "id", "image", "isActive", "name" FROM "Champion";
DROP TABLE "Champion";
ALTER TABLE "new_Champion" RENAME TO "Champion";
CREATE TABLE "new_AssignmentDefense" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rosterUserChampionId" TEXT NOT NULL,
    "allianceMemberId" TEXT NOT NULL,
    "groupWarId" TEXT NOT NULL,
    CONSTRAINT "AssignmentDefense_rosterUserChampionId_fkey" FOREIGN KEY ("rosterUserChampionId") REFERENCES "RosterUserChampion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentDefense_allianceMemberId_fkey" FOREIGN KEY ("allianceMemberId") REFERENCES "AllianceMember" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentDefense_groupWarId_fkey" FOREIGN KEY ("groupWarId") REFERENCES "GroupWar" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AssignmentDefense" ("allianceMemberId", "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId") SELECT "allianceMemberId", "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId" FROM "AssignmentDefense";
DROP TABLE "AssignmentDefense";
ALTER TABLE "new_AssignmentDefense" RENAME TO "AssignmentDefense";
CREATE UNIQUE INDEX "AssignmentDefense_rosterUserChampionId_key" ON "AssignmentDefense"("rosterUserChampionId");
CREATE TABLE "new_Label" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "groupLabelId" TEXT NOT NULL,
    CONSTRAINT "Label_groupLabelId_fkey" FOREIGN KEY ("groupLabelId") REFERENCES "GroupLabel" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Label" ("createdAt", "groupLabelId", "id", "isActive", "name") SELECT "createdAt", "groupLabelId", "id", "isActive", "name" FROM "Label";
DROP TABLE "Label";
ALTER TABLE "new_Label" RENAME TO "Label";
CREATE TABLE "new_ClassOther" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "icon" TEXT NOT NULL
);
INSERT INTO "new_ClassOther" ("createdAt", "icon", "id", "isActive", "name") SELECT "createdAt", "icon", "id", "isActive", "name" FROM "ClassOther";
DROP TABLE "ClassOther";
ALTER TABLE "new_ClassOther" RENAME TO "ClassOther";
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
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
CREATE TABLE "new_RosterUserChampion" (
    "id" TEXT NOT NULL PRIMARY KEY,
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
    "userId" TEXT NOT NULL,
    "championId" TEXT NOT NULL,
    CONSTRAINT "RosterUserChampion_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "RosterUserChampion_championId_fkey" FOREIGN KEY ("championId") REFERENCES "Champion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_RosterUserChampion" ("championId", "createdAt", "id", "isActive", "isAscendite", "isAttack", "isDefense", "isDuplicate", "prestige", "rank", "sing", "tier", "userId") SELECT "championId", "createdAt", "id", "isActive", "isAscendite", "isAttack", "isDefense", "isDuplicate", "prestige", "rank", "sing", "tier", "userId" FROM "RosterUserChampion";
DROP TABLE "RosterUserChampion";
ALTER TABLE "new_RosterUserChampion" RENAME TO "RosterUserChampion";
CREATE TABLE "new_ChampionLabel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "championId" TEXT NOT NULL,
    "labelId" TEXT NOT NULL,
    CONSTRAINT "ChampionLabel_championId_fkey" FOREIGN KEY ("championId") REFERENCES "Champion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ChampionLabel_labelId_fkey" FOREIGN KEY ("labelId") REFERENCES "Label" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ChampionLabel" ("championId", "createdAt", "id", "isActive", "labelId") SELECT "championId", "createdAt", "id", "isActive", "labelId" FROM "ChampionLabel";
DROP TABLE "ChampionLabel";
ALTER TABLE "new_ChampionLabel" RENAME TO "ChampionLabel";
CREATE TABLE "new_AllianceMember" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rol" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "allianceId" TEXT NOT NULL,
    CONSTRAINT "AllianceMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AllianceMember_allianceId_fkey" FOREIGN KEY ("allianceId") REFERENCES "Alliance" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AllianceMember" ("allianceId", "createdAt", "id", "isActive", "rol", "userId") SELECT "allianceId", "createdAt", "id", "isActive", "rol", "userId" FROM "AllianceMember";
DROP TABLE "AllianceMember";
ALTER TABLE "new_AllianceMember" RENAME TO "AllianceMember";
CREATE UNIQUE INDEX "AllianceMember_userId_key" ON "AllianceMember"("userId");
CREATE TABLE "new_AssignmentAttack" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rosterUserChampionId" TEXT NOT NULL,
    "allianceMemberId" TEXT NOT NULL,
    "groupWarId" TEXT NOT NULL,
    CONSTRAINT "AssignmentAttack_rosterUserChampionId_fkey" FOREIGN KEY ("rosterUserChampionId") REFERENCES "RosterUserChampion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentAttack_allianceMemberId_fkey" FOREIGN KEY ("allianceMemberId") REFERENCES "AllianceMember" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentAttack_groupWarId_fkey" FOREIGN KEY ("groupWarId") REFERENCES "GroupWar" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AssignmentAttack" ("allianceMemberId", "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId") SELECT "allianceMemberId", "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId" FROM "AssignmentAttack";
DROP TABLE "AssignmentAttack";
ALTER TABLE "new_AssignmentAttack" RENAME TO "AssignmentAttack";
CREATE UNIQUE INDEX "AssignmentAttack_rosterUserChampionId_key" ON "AssignmentAttack"("rosterUserChampionId");
CREATE TABLE "new_League" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "icon" TEXT NOT NULL
);
INSERT INTO "new_League" ("createdAt", "icon", "id", "isActive", "name") SELECT "createdAt", "icon", "id", "isActive", "name" FROM "League";
DROP TABLE "League";
ALTER TABLE "new_League" RENAME TO "League";
CREATE TABLE "new_GroupLabel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL
);
INSERT INTO "new_GroupLabel" ("createdAt", "id", "isActive", "name") SELECT "createdAt", "id", "isActive", "name" FROM "GroupLabel";
DROP TABLE "GroupLabel";
ALTER TABLE "new_GroupLabel" RENAME TO "GroupLabel";
CREATE TABLE "new_Relic" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "classId" TEXT NOT NULL,
    CONSTRAINT "Relic_classId_fkey" FOREIGN KEY ("classId") REFERENCES "ClassOther" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Relic" ("classId", "createdAt", "id", "image", "isActive", "name") SELECT "classId", "createdAt", "id", "image", "isActive", "name" FROM "Relic";
DROP TABLE "Relic";
ALTER TABLE "new_Relic" RENAME TO "Relic";
CREATE TABLE "new_Alliance" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "prestige" INTEGER NOT NULL,
    "minimunPrestige" INTEGER NOT NULL,
    "lastLeagueId" TEXT NOT NULL,
    "availability" BOOLEAN NOT NULL DEFAULT true,
    "privacity" TEXT NOT NULL,
    "warPower" INTEGER NOT NULL,
    "alliancePower" INTEGER NOT NULL,
    "numberMembers" INTEGER NOT NULL,
    CONSTRAINT "Alliance_lastLeagueId_fkey" FOREIGN KEY ("lastLeagueId") REFERENCES "League" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Alliance" ("alliancePower", "availability", "createdAt", "id", "isActive", "lastLeagueId", "minimunPrestige", "name", "numberMembers", "prestige", "privacity", "warPower") SELECT "alliancePower", "availability", "createdAt", "id", "isActive", "lastLeagueId", "minimunPrestige", "name", "numberMembers", "prestige", "privacity", "warPower" FROM "Alliance";
DROP TABLE "Alliance";
ALTER TABLE "new_Alliance" RENAME TO "Alliance";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
