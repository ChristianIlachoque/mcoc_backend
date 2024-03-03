/*
  Warnings:

  - You are about to drop the `Clan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ClanMember` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `clanMemberId` on the `AssignmentDefense` table. All the data in the column will be lost.
  - You are about to drop the column `clanMemberId` on the `AssignmentAttack` table. All the data in the column will be lost.
  - Added the required column `allianceMemberId` to the `AssignmentDefense` table without a default value. This is not possible if the table is not empty.
  - Added the required column `allianceMemberId` to the `AssignmentAttack` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "ClanMember_userId_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Clan";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "ClanMember";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "AllianceMember" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rol" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "allianceId" INTEGER NOT NULL,
    CONSTRAINT "AllianceMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AllianceMember_allianceId_fkey" FOREIGN KEY ("allianceId") REFERENCES "Alliance" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Alliance" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "prestige" INTEGER NOT NULL,
    "minimun_prestige" INTEGER NOT NULL,
    "number_members" INTEGER NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_AssignmentDefense" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rosterUserChampionId" INTEGER NOT NULL,
    "allianceMemberId" INTEGER NOT NULL,
    "groupWarId" INTEGER NOT NULL,
    CONSTRAINT "AssignmentDefense_rosterUserChampionId_fkey" FOREIGN KEY ("rosterUserChampionId") REFERENCES "RosterUserChampion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentDefense_allianceMemberId_fkey" FOREIGN KEY ("allianceMemberId") REFERENCES "AllianceMember" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentDefense_groupWarId_fkey" FOREIGN KEY ("groupWarId") REFERENCES "GroupWar" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AssignmentDefense" ("createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId") SELECT "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId" FROM "AssignmentDefense";
DROP TABLE "AssignmentDefense";
ALTER TABLE "new_AssignmentDefense" RENAME TO "AssignmentDefense";
CREATE UNIQUE INDEX "AssignmentDefense_rosterUserChampionId_key" ON "AssignmentDefense"("rosterUserChampionId");
CREATE TABLE "new_AssignmentAttack" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rosterUserChampionId" INTEGER NOT NULL,
    "allianceMemberId" INTEGER NOT NULL,
    "groupWarId" INTEGER NOT NULL,
    CONSTRAINT "AssignmentAttack_rosterUserChampionId_fkey" FOREIGN KEY ("rosterUserChampionId") REFERENCES "RosterUserChampion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentAttack_allianceMemberId_fkey" FOREIGN KEY ("allianceMemberId") REFERENCES "AllianceMember" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentAttack_groupWarId_fkey" FOREIGN KEY ("groupWarId") REFERENCES "GroupWar" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AssignmentAttack" ("createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId") SELECT "createdAt", "groupWarId", "id", "isActive", "rosterUserChampionId" FROM "AssignmentAttack";
DROP TABLE "AssignmentAttack";
ALTER TABLE "new_AssignmentAttack" RENAME TO "AssignmentAttack";
CREATE UNIQUE INDEX "AssignmentAttack_rosterUserChampionId_key" ON "AssignmentAttack"("rosterUserChampionId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "AllianceMember_userId_key" ON "AllianceMember"("userId");
