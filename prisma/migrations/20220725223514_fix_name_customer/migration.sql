/*
  Warnings:

  - You are about to drop the column `custumer` on the `wallet` table. All the data in the column will be lost.
  - You are about to drop the `custumer` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[customer]` on the table `wallet` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `customer` to the `wallet` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `wallet` DROP FOREIGN KEY `wallet_custumer_fkey`;

-- AlterTable
ALTER TABLE `wallet` DROP COLUMN `custumer`,
    ADD COLUMN `customer` BIGINT NOT NULL;

-- DropTable
DROP TABLE `custumer`;

-- CreateTable
CREATE TABLE `customer` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `wallet_customer_key` ON `wallet`(`customer`);

-- AddForeignKey
ALTER TABLE `wallet` ADD CONSTRAINT `wallet_customer_fkey` FOREIGN KEY (`customer`) REFERENCES `customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
