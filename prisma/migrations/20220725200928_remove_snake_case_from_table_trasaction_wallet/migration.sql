/*
  Warnings:

  - You are about to drop the `transaction_wallet` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `transaction_wallet` DROP FOREIGN KEY `transaction_wallet_walletId_fkey`;

-- DropTable
DROP TABLE `transaction_wallet`;

-- CreateTable
CREATE TABLE `transactionWallet` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `opertation` VARCHAR(191) NOT NULL,
    `amount` DOUBLE NOT NULL,
    `walletId` BIGINT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `transactionWallet` ADD CONSTRAINT `transactionWallet_walletId_fkey` FOREIGN KEY (`walletId`) REFERENCES `wallet`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
