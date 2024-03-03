/*
  Warnings:

  - You are about to drop the column `minimun_prestige` on the `Alliance` table. All the data in the column will be lost.
  - You are about to drop the column `number_members` on the `Alliance` table. All the data in the column will be lost.
  - Added the required column `alliancePower` to the `Alliance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastLeagueId` to the `Alliance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `minimunPrestige` to the `Alliance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numberMembers` to the `Alliance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `privacity` to the `Alliance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `warPower` to the `Alliance` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "League" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "icon" TEXT NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Alliance" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "prestige" INTEGER NOT NULL,
    "minimunPrestige" INTEGER NOT NULL,
    "lastLeagueId" INTEGER NOT NULL,
    "availability" BOOLEAN NOT NULL DEFAULT true,
    "privacity" TEXT NOT NULL,
    "warPower" INTEGER NOT NULL,
    "alliancePower" INTEGER NOT NULL,
    "numberMembers" INTEGER NOT NULL,
    CONSTRAINT "Alliance_lastLeagueId_fkey" FOREIGN KEY ("lastLeagueId") REFERENCES "League" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Alliance" ("createdAt", "id", "isActive", "name", "prestige") SELECT "createdAt", "id", "isActive", "name", "prestige" FROM "Alliance";
DROP TABLE "Alliance";
ALTER TABLE "new_Alliance" RENAME TO "Alliance";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
