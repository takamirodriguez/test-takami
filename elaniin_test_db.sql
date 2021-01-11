/*
 Navicat Premium Data Transfer

 Source Server         : Localhost_WAMPP
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : test_db

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 08/01/2021 11:54:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2021_01_07_015543_create_products_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_01_08_032502_change_products_table', 2);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SKU` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_sku_unique`(`SKU`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Product 1', 'PRD1', 1, '25.20', 'Product description 1', '/storage/1610078949__descarga.jpg', '2021-01-08 04:09:09', '2021-01-08 04:09:09');
INSERT INTO `products` VALUES (2, 'Product 2', 'PRD2', 1, NULL, NULL, '/storage/1610079040__descarga.jpg', '2021-01-08 04:10:40', '2021-01-08 04:10:40');
INSERT INTO `products` VALUES (3, 'Product 3', 'PRD3', 1, NULL, NULL, '/storage/1610079158__descarga.jpg', '2021-01-08 04:12:38', '2021-01-08 04:12:38');
INSERT INTO `products` VALUES (4, 'Product 4_modified_2', 'PRD4_modified_2', 1, '25.20', 'Product description 1', '/storage/1610082277_sony-playstation-5.png', '2021-01-08 04:14:28', '2021-01-08 05:04:37');
INSERT INTO `products` VALUES (6, 'Lehner-Wisoky', 'Quo iste.', 7, '1.608558', 'Perspiciatis ut in earum et.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (7, 'Gibson, Lubowitz and Vandervort', 'Veritatis.', 0, '7361720.228788', 'Quibusdam molestias ut earum nihil ab natus velit pariatur.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (8, 'Berge, Bahringer and Metz', 'Ad.', 6, '1730667', 'Et fugit nihil atque odit est.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (9, 'Hintz and Sons', 'Dolor.', 5, '52010.2', 'Occaecati similique non et ut culpa.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (10, 'Russel Ltd', 'Est vel.', 4, '305', 'Officia ea minus vero debitis temporibus ab enim.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (11, 'Sipes-Ratke', 'Ut dolor.', 0, '61.6816346', 'Et sunt dolor porro blanditiis eaque voluptatum illum.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (12, 'Gerhold, Dickens and Mosciski', 'Beatae.', 9, '11612020.705808', 'Quia voluptas repellat mollitia nobis.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (13, 'Koch, Rowe and Skiles', 'Autem qui.', 8, '255711324.82047', 'Quia repellat quibusdam est enim omnis voluptatem nisi.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (14, 'Flatley-Weimann', 'Harum.', 2, '3623.4988', 'Cumque asperiores dolore occaecati harum consequatur quam ut.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (15, 'Harris LLC', 'Est non.', 8, '29104.5', 'Voluptatibus eum fugit qui.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (16, 'Schamberger, Kautzer and Towne', 'Voluptas.', 7, '5192.12', 'Voluptas eos vitae qui officiis.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (17, 'Pouros, Huels and Lueilwitz', 'Officia.', 9, '1.077195053', 'Qui earum quia sint et tempora facilis ullam.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (18, 'Beer, Hegmann and Kohler', 'Tempora.', 3, '0.14611', 'Repudiandae officia harum tenetur optio laudantium.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (19, 'Tremblay PLC', 'Error.', 2, '200315.9036606', 'Vero cumque quia et ab.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (20, 'Witting, Nolan and Renner', 'Non rerum.', 1, '551.3415442', 'Dignissimos corporis porro incidunt et.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (21, 'Schaefer-Buckridge', 'Doloribus.', 3, '309791.1647788', 'Voluptatem modi ut pariatur qui architecto.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (22, 'Legros-Dietrich', 'Qui atque.', 9, '149059788.53387', 'Distinctio dignissimos quas quia.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (23, 'Macejkovic, Zemlak and Dicki', 'Enim quia.', 6, '2229075.626', 'Ut consequatur pariatur voluptatem aliquid maiores accusantium est.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (24, 'Labadie-Heidenreich', 'Excepturi.', 5, '7386.9835529', 'In eaque exercitationem fugit ab velit omnis.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (25, 'Ruecker Ltd', 'Eum.', 3, '355', 'Unde voluptas hic voluptatibus est iste.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (26, 'Gusikowski PLC', 'Repellat.', 6, '402722.091157', 'Qui quae pariatur officiis quis nostrum aut sint.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (27, 'Eichmann, Cole and Green', 'Rerum.', 0, '0.61', 'Excepturi impedit modi ullam consectetur consequuntur officia autem.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (28, 'Padberg Ltd', 'Ea.', 8, '51908516', 'Odio totam nihil labore ad.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (29, 'Abshire-Schoen', 'Ratione.', 8, '1432.52', 'Necessitatibus tempora voluptatibus iusto.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (30, 'Corwin-Conn', 'Cumque.', 2, '51504901', 'Laborum dolor dolores distinctio consectetur.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (31, 'Auer-Bayer', 'Nemo sed.', 9, '210.34264', 'Eos voluptas dolorem similique sunt autem.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (32, 'Nader, Reynolds and Schmitt', 'Et itaque.', 8, '10478896', 'Voluptate blanditiis hic est.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (33, 'Kunze-Schulist', 'Aut nulla.', 3, '2.18174', 'Et distinctio perspiciatis dicta animi sunt maiores.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (34, 'Runolfsson, Bednar and Oberbrunner', 'Facere.', 3, '527199.56085823', 'Quis et architecto voluptates iste et.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (35, 'Heller, Ankunding and Nikolaus', 'Harum aut.', 8, '154577871.859', 'Maiores quaerat minima et quia ab minima.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (36, 'Brown-Pagac', 'Quia.', 3, '393788.06000742', 'Quo eum rerum maiores sit voluptatem.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (37, 'Beier-Breitenberg', 'Expedita.', 8, '1333790.21', 'Neque sit repellat vel.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (38, 'Glover Group', 'Nulla vel.', 9, '32208.69479', 'Harum veniam nisi dolor qui ut soluta.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (39, 'White-Wisoky', 'Nihil.', 3, '2541884.8', 'Doloribus itaque officiis laudantium ut harum.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (40, 'Barrows-Feeney', 'Alias.', 4, '117.0898452', 'Enim ut fugiat quia modi aut dolor.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (41, 'Reinger-Jones', 'Quo vitae.', 3, '12990232.28', 'Ducimus veniam expedita voluptatem veritatis.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (42, 'Rippin Ltd', 'Aliquam.', 1, '426185.159', 'Optio in accusamus neque nihil.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (43, 'Kreiger, Wisoky and Mayer', 'Esse.', 2, '189258774.35089', 'Id recusandae vero repellendus velit.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (44, 'Erdman, Langworth and Kautzer', 'Aut iste.', 2, '434125.88', 'Omnis accusantium sunt quia et impedit illum.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (45, 'Strosin LLC', 'Et autem.', 5, '795571215.2547', 'Est qui in iure iste.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (46, 'Pfannerstill-Eichmann', 'Id.', 9, '67.7', 'Repudiandae rem maxime praesentium assumenda voluptatem et.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (47, 'Brakus Ltd', 'Molestiae.', 6, '69289155.393303', 'Ipsam unde similique officia qui.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (48, 'Erdman, Nicolas and Veum', 'Similique.', 0, '48423.96023', 'Nihil est quasi consequatur id esse numquam.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (49, 'Torp, Zboncak and Satterfield', 'Minus.', 8, '1.839', 'Excepturi nobis et eveniet ex placeat commodi molestiae.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (50, 'Bednar and Sons', 'Et ut.', 0, '526.4158', 'Natus nihil repellat corporis natus repellendus.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (51, 'Mayert-Hill', 'Qui autem.', 1, '12.4107453', 'Ipsam saepe molestias quasi ipsam minima.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (52, 'Lang PLC', 'Dicta.', 1, '22581698.351307', 'Aut eos est sed rerum sint.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (53, 'Stanton, Bechtelar and Pagac', 'Cum.', 4, '17648.3', 'Eligendi suscipit eum minima eligendi facere iste.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (54, 'Legros Group', 'Sint.', 6, '1772.826', 'Rerum sunt error esse rem veritatis.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');
INSERT INTO `products` VALUES (55, 'Halvorson-Brekke', 'Esse eius.', 9, '790.15375', 'Aut tenetur quibusdam voluptatem eum ut.', NULL, '2021-01-08 05:45:05', '2021-01-08 05:45:05');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'takami rodriguez kimura', 'takami', 'takami.rodriguez@gmail.com', '61569559', '1993-10-27', NULL, '$2y$10$aaut41W0wczMUrMqIv2OmepiIiqI6QuRdVdRH/nZULmh9qbEqjD.6', NULL, '2021-01-07 05:38:04', '2021-01-08 02:48:35');
INSERT INTO `users` VALUES (2, 'Juan Perez', 'user 1', 'user1@gmail.com', '61569552', '1993-09-27', NULL, '$2y$10$pv19B0GjkCBs3Pf8S33v1O9NVE/Me7.7UtSOTYZiJt0B/97cn1qAe', NULL, '2021-01-08 05:11:09', '2021-01-08 06:51:55');
INSERT INTO `users` VALUES (8, 'Hailee Jaskolski DDS', 'easton.morar', 'smarks@example.org', '(776) 869-9564', '2009-03-27', '2021-01-08 05:31:57', '$2y$10$JI15Ve/dQ0GFvTC28X6tMOEaFG9Wm4Eu1ZiTCp6VkFYeiy473juKy', 'tjEF2b9g9W', '2021-01-08 05:31:58', '2021-01-08 05:31:58');
INSERT INTO `users` VALUES (9, 'Danielle McDermott', 'bkoepp', 'jerome.runolfsson@example.net', '614-991-3422', '2010-01-07', '2021-01-08 05:31:57', '$2y$10$LIV0wS0LBOsxkggfIWjzue9xMfgFfdm64LCBd6ji.yax1RZr5aZ0q', 'lGYBfAIxzI', '2021-01-08 05:31:58', '2021-01-08 05:31:58');
INSERT INTO `users` VALUES (10, 'Joesph Kautzer', 'dominique01', 'lauriane.lubowitz@example.net', '560-583-2333', '2002-09-07', '2021-01-08 05:31:57', '$2y$10$9vSiGAJXSttfBeKHytilBu8TvekFh6vI3h9tWcNhKBPJGsHYELMDm', 'iF3NfmYozv', '2021-01-08 05:31:58', '2021-01-08 05:31:58');
INSERT INTO `users` VALUES (11, 'Prof. Caterina Dickens', 'vmitchell', 'collins.jalen@example.net', '+14653075807', '2006-05-29', '2021-01-08 05:31:57', '$2y$10$ZEohx1RFCU/jpZAkjxikeeXtlnIzJ9Ul7rCFys0sDmvULGInLY9JS', '0DOhl5lKew', '2021-01-08 05:31:58', '2021-01-08 05:31:58');
INSERT INTO `users` VALUES (12, 'Jarod Schiller', 'derek47', 'whitney.jast@example.com', '401-567-1571', '2020-10-24', '2021-01-08 05:31:57', '$2y$10$a189IQmXFB0SRelZ3oRJNeQtvhsT9O9cOzl.QVwCG/w3C.drYHUJi', 'QBhyhAloS6', '2021-01-08 05:31:58', '2021-01-08 05:31:58');

SET FOREIGN_KEY_CHECKS = 1;
