-- CreateTable
CREATE TABLE `custumer` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wallet` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `custumer` BIGINT NOT NULL,
    `amount` DOUBLE NOT NULL,

    UNIQUE INDEX `wallet_custumer_key`(`custumer`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaction_wallet` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `opertation` VARCHAR(191) NOT NULL,
    `amount` DOUBLE NOT NULL,
    `walletId` BIGINT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `assets` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assetCode` VARCHAR(191) NOT NULL,
    `currency` DOUBLE NOT NULL,
    `quantity` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transactionAssets` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `operation` VARCHAR(191) NOT NULL,
    `amount` DOUBLE NOT NULL,
    `quantity` BIGINT NOT NULL,
    `assetsId` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `wallet` ADD CONSTRAINT `wallet_custumer_fkey` FOREIGN KEY (`custumer`) REFERENCES `custumer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transaction_wallet` ADD CONSTRAINT `transaction_wallet_walletId_fkey` FOREIGN KEY (`walletId`) REFERENCES `wallet`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transactionAssets` ADD CONSTRAINT `transactionAssets_assetsId_fkey` FOREIGN KEY (`assetsId`) REFERENCES `assets`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
