-- CreateTable
CREATE TABLE "GroupWar" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "AssignmentDefense" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "rosterUserChampionId" INTEGER NOT NULL,
    "clanMemberId" INTEGER NOT NULL,
    "groupWarId" INTEGER NOT NULL,
    CONSTRAINT "AssignmentDefense_rosterUserChampionId_fkey" FOREIGN KEY ("rosterUserChampionId") REFERENCES "RosterUserChampion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentDefense_clanMemberId_fkey" FOREIGN KEY ("clanMemberId") REFERENCES "ClanMember" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentDefense_groupWarId_fkey" FOREIGN KEY ("groupWarId") REFERENCES "GroupWar" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "AssignmentAttack" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "rosterUserChampionId" INTEGER NOT NULL,
    "clanMemberId" INTEGER NOT NULL,
    "groupWarId" INTEGER NOT NULL,
    CONSTRAINT "AssignmentAttack_rosterUserChampionId_fkey" FOREIGN KEY ("rosterUserChampionId") REFERENCES "RosterUserChampion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentAttack_clanMemberId_fkey" FOREIGN KEY ("clanMemberId") REFERENCES "ClanMember" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AssignmentAttack_groupWarId_fkey" FOREIGN KEY ("groupWarId") REFERENCES "GroupWar" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ClanMember" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "rol" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "clanId" INTEGER NOT NULL,
    CONSTRAINT "ClanMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ClanMember_clanId_fkey" FOREIGN KEY ("clanId") REFERENCES "Clan" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Clan" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "prestige" INTEGER NOT NULL,
    "minimun_prestige" INTEGER NOT NULL,
    "number_members" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "RosterUserChampion" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
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

-- CreateTable
CREATE TABLE "RosterUserRelic" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
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

-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "nickName" TEXT NOT NULL,
    "prestige" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "ChampionLabel" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "championId" INTEGER NOT NULL,
    "labelId" INTEGER NOT NULL,
    CONSTRAINT "ChampionLabel_championId_fkey" FOREIGN KEY ("championId") REFERENCES "Champion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ChampionLabel_labelId_fkey" FOREIGN KEY ("labelId") REFERENCES "Label" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Champion" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "classId" INTEGER NOT NULL,
    CONSTRAINT "Champion_classId_fkey" FOREIGN KEY ("classId") REFERENCES "ClassOther" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Relic" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "classId" INTEGER NOT NULL,
    CONSTRAINT "Relic_classId_fkey" FOREIGN KEY ("classId") REFERENCES "ClassOther" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ClassOther" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "icon" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Label" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "groupLabelId" INTEGER NOT NULL,
    CONSTRAINT "Label_groupLabelId_fkey" FOREIGN KEY ("groupLabelId") REFERENCES "GroupLabel" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "GroupLabel" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "AssignmentDefense_rosterUserChampionId_key" ON "AssignmentDefense"("rosterUserChampionId");

-- CreateIndex
CREATE UNIQUE INDEX "AssignmentAttack_rosterUserChampionId_key" ON "AssignmentAttack"("rosterUserChampionId");

-- CreateIndex
CREATE UNIQUE INDEX "ClanMember_userId_key" ON "ClanMember"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
