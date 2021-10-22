-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2020 at 07:52 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobshare`
--

-- --------------------------------------------------------

--
-- Table structure for table `applies`
--

CREATE TABLE `applies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seeker_id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Delivery-Product', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(2, 'Web-development', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(3, 'Data-entry', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(4, 'Web-Design', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(5, 'Electrical-Services', '2020-11-20 14:27:54', '2020-11-20 14:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `user_id`, `job_id`, `created_at`, `updated_at`) VALUES
(1, 25, 1, '2020-11-29 05:28:08', '2020-11-29 05:28:08'),
(2, 25, 2, '2020-11-29 05:28:13', '2020-11-29 05:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `last_date` date NOT NULL,
  `user_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `user_id`, `title`, `slug`, `description`, `category_id`, `type`, `address`, `status`, `last_date`, `user_phone_number`, `user_avatar`, `created_at`, `updated_at`, `salary`) VALUES
(1, 22, 'I need someone to deliver my product', 'i-need-someone-to-deliver-my-product', 'I have a product to parcel today.It should be delivered between today.If someone interested and lives around ashulia can apply for it', 1, 'offline', 'Ashulia', 1, '1990-01-12', '01861591932', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1606'),
(2, 22, 'Emergency product delivery', 'emergency-product-delivery', 'Velit veritatis rem provident ea hic sed. Sit recusandae et nisi et. Dicta et sit quas cumque. Dicta impedit temporibus voluptates enim hic. Inventore eius impedit officia deserunt. Est quas nesciunt aut incidunt voluptatem sunt vel. Accusamus deleniti sequi omnis aut aperiam. Deleniti quo unde ad voluptate quia exercitationem explicabo voluptas. Dolore incidunt sed quod reprehenderit mollitia sit. Unde laboriosam et labore sed nobis est. Ullam veritatis unde dolor voluptates voluptate porro. Molestiae voluptatem minus officiis ut expedita sunt corrupti.', 1, 'offline', 'Savar', 1, '2017-04-01', '1-681-547-2825', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1988'),
(3, 22, 'Need someone who is very skilled electrian ', 'need-somoone-who-is-very-skilled-electrian', 'Placeat voluptatem molestiae blanditiis vitae excepturi beatae repellendus. Repellendus fugiat saepe enim provident quas. Autem nesciunt est eius qui illum non. Tempora saepe fugiat et omnis quasi ipsam. Consectetur illo vitae ducimus qui aut. Optio ratione vitae molestiae reprehenderit possimus minus. Temporibus nisi reprehenderit amet in voluptatem sunt. Ut in provident quia et. Ipsum perferendis magni tempora nihil nesciunt culpa quasi. Minima explicabo et quia numquam et corporis. Ut cum consequatur qui dolorum. Commodi quia sunt quasi numquam sequi ut.', 5, 'offline', 'Uttara', 1, '1991-11-09', '1-587-540-0236', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '970'),
(4, 22, 'Please contact me as soon as possible for sharing job', 'please-contact-me-as-soon-as-possible-for-sharing-job', 'Eos eos et dignissimos ea. Vel alias quasi porro iusto. Exercitationem delectus officiis nihil aut saepe aut id. Ut et corrupti atque sunt.', 5, 'offline', 'Mirpur 1', 1, '1993-09-25', '1-332-845-9631 x161', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '315'),
(5, 22, 'Natus voluptas modi amet rerum quae ab. Nisi porro harum iure tempore. Dicta occaecati dolore et ut quo aut. Qui pariatur maiores vitae omnis ut esse quisquam.', 'natus-voluptas-modi-amet-rerum-quae-ab-nisi-porro-harum-iure-tempore-dicta-occaecati-dolore-et-ut-quo-aut-qui-pariatur-maiores-vitae-omnis-ut-esse-quisquam', 'Dignissimos quam quasi ut voluptates. Quis repellendus ipsa reprehenderit qui sint autem ut. At doloribus laudantium aut. Tempore earum eligendi minus ad quos. Ipsa quas inventore voluptas et. Odio soluta at voluptatum fugiat ipsum. Dolores iste aut nulla quos.', 2, 'online', '565 Isaac Courts\nPort Elvaberg, NC 66616', 1, '2002-04-03', '302.362.7409 x315', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1810'),
(6, 11, 'Ut perferendis fuga qui error qui unde ad. Minus delectus recusandae est corrupti.', 'ut-perferendis-fuga-qui-error-qui-unde-ad-minus-delectus-recusandae-est-corrupti', 'Laborum quo a voluptatibus similique quasi. Nam ab temporibus ab ut occaecati architecto distinctio. Quaerat voluptate non libero nulla id nam. Aut sunt ea asperiores officia ratione qui. Sed praesentium numquam sed sequi iste temporibus. Animi rerum id quidem. Ad odio autem facere sunt quam sit ratione. Autem illum odit est veniam. Sit reiciendis repudiandae minus iure. Ea eveniet omnis amet eos.', 5, 'online', '104 Nicolas Forest Apt. 926\nPort Gabrielview, NV 23220-6374', 1, '1972-10-13', '1-630-928-8786', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1966'),
(7, 2, 'Rerum dicta natus enim quis corrupti culpa atque. In aspernatur rerum molestias occaecati consequuntur voluptate. Cum sed dolorem nobis aut.', 'rerum-dicta-natus-enim-quis-corrupti-culpa-atque-in-aspernatur-rerum-molestias-occaecati-consequuntur-voluptate-cum-sed-dolorem-nobis-aut', 'Deleniti dolores nam blanditiis laborum cumque odio. Architecto quis neque consectetur saepe delectus necessitatibus. Rerum repellendus in iure incidunt. Dolor laboriosam voluptatem rem molestias. Quod veniam deleniti eligendi odio magnam alias magnam. Atque consequuntur consequuntur velit dicta dolorum cumque. Voluptatem nobis maiores voluptatem vitae animi aliquam. Officia repellendus aut doloremque ipsum tempora maxime. Sequi est explicabo fuga aut. Architecto quod ex ut quae.', 4, 'online', '86736 Simonis Motorway\nSouth Athena, SD 88440', 1, '2014-01-18', '(509) 348-2647 x29466', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '856'),
(8, 18, 'Rerum eveniet veniam quia et facilis iure. Totam culpa quod nam aperiam necessitatibus.', 'rerum-eveniet-veniam-quia-et-facilis-iure-totam-culpa-quod-nam-aperiam-necessitatibus', 'Dolores tempora at sint tenetur dolor. Eum accusantium nulla odio non.', 5, 'online', '8296 Kilback Plaza Apt. 428\nHackettburgh, SD 38853', 1, '1994-05-30', '825.577.3374', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1196'),
(9, 20, 'Voluptatem minus voluptates exercitationem ipsum qui est. Ea dicta molestias eaque odit quos consequatur. Autem ut est ratione qui dolorum nisi.', 'voluptatem-minus-voluptates-exercitationem-ipsum-qui-est-ea-dicta-molestias-eaque-odit-quos-consequatur-autem-ut-est-ratione-qui-dolorum-nisi', 'Error placeat consequatur eos. Est non animi fuga aspernatur quaerat doloribus.', 1, 'online', '3720 Korey Hollow\nNorth Skylafurt, NJ 76986-6094', 0, '1982-07-16', '+1.773.908.1524', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1487'),
(10, 13, 'Corporis totam voluptatem temporibus rerum. Quod nemo et et distinctio omnis. Labore possimus aut est sed.', 'corporis-totam-voluptatem-temporibus-rerum-quod-nemo-et-et-distinctio-omnis-labore-possimus-aut-est-sed', 'Minima exercitationem quo earum in qui. Ut qui consectetur consequatur incidunt qui. Officia sint assumenda asperiores aut consequuntur non. Dolorum ea ut cumque voluptas. Architecto ullam ea illo vitae laudantium quidem dolor. At aut quos aliquid voluptatem nam. Sed ut repellat sed sit voluptas doloribus. Sint dolorem facilis facere aperiam rerum omnis dicta. Odio quasi et accusamus voluptatem velit voluptatem autem.', 5, 'online', '7918 Emma Trail Suite 935\nCartwrighttown, KS 84384', 0, '1971-06-25', '556.851.2420 x9924', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1130'),
(11, 3, 'Est dolores omnis maxime sed ut enim praesentium. Totam officiis aliquam reiciendis.', 'est-dolores-omnis-maxime-sed-ut-enim-praesentium-totam-officiis-aliquam-reiciendis', 'Repellat natus ea hic facilis qui placeat. Praesentium accusantium officiis voluptatem libero et. Quidem quod et aperiam consequatur. Consequatur est minima deleniti molestiae sunt suscipit. Omnis quis aut et fugiat dolorem qui. Omnis voluptates explicabo perspiciatis libero qui vitae. Eos qui reiciendis optio. Earum qui dolore aperiam laborum minima. Culpa est tempore explicabo nulla qui saepe.', 4, 'online', '42078 Stanley Forest Apt. 732\nWest Millieville, WI 32731', 0, '2006-01-14', '258.347.0934', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1914'),
(12, 6, 'Nam necessitatibus omnis quia sunt. Necessitatibus ipsum eos minus explicabo provident necessitatibus. Dicta sequi veniam iusto ea reiciendis.', 'nam-necessitatibus-omnis-quia-sunt-necessitatibus-ipsum-eos-minus-explicabo-provident-necessitatibus-dicta-sequi-veniam-iusto-ea-reiciendis', 'Similique adipisci est eum assumenda omnis velit. Magnam perferendis autem iste non autem ut. Sapiente sunt dolorem asperiores numquam aut.', 2, 'online', '411 Vinnie Ranch Suite 703\nEast Jackiemouth, AZ 74859-2514', 1, '2006-05-19', '1-501-973-4372 x82336', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1099'),
(13, 13, 'Et soluta sit doloremque quia qui. Sint mollitia rerum maxime occaecati. Ut repudiandae quod similique qui. Nihil vel accusamus ipsam iure quis quia.', 'et-soluta-sit-doloremque-quia-qui-sint-mollitia-rerum-maxime-occaecati-ut-repudiandae-quod-similique-qui-nihil-vel-accusamus-ipsam-iure-quis-quia', 'Temporibus est omnis minima earum iusto. Et molestias debitis aut minima sit. Perferendis ut fugiat qui quae ea numquam fuga. Quo ea qui nobis et esse quo neque exercitationem.', 1, 'online', '16119 Larkin Wells\nMoorefort, NJ 87402', 0, '2016-10-13', '1-387-505-3291', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1484'),
(14, 12, 'Fugiat libero sit repellendus quod. Dignissimos tempore a dolorem. Deserunt quidem et ipsum.', 'fugiat-libero-sit-repellendus-quod-dignissimos-tempore-a-dolorem-deserunt-quidem-et-ipsum', 'Est et nam voluptates sequi. Occaecati porro quas eos. Labore molestiae sequi ex repudiandae. Temporibus esse laboriosam sint enim. Suscipit doloribus nam veritatis est. Voluptatem totam eveniet odio porro sapiente eos distinctio. Eius eos voluptatem eveniet libero fugiat. Neque vero nihil vel.', 2, 'online', '398 Garry Wells\nNataliehaven, KY 61441', 0, '1980-11-05', '(480) 986-6361', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '267'),
(15, 18, 'Voluptate quia expedita culpa repellat. Rem explicabo natus unde saepe possimus. Ex quas aut et autem eaque. Impedit cumque nostrum quo alias dolorum.', 'voluptate-quia-expedita-culpa-repellat-rem-explicabo-natus-unde-saepe-possimus-ex-quas-aut-et-autem-eaque-impedit-cumque-nostrum-quo-alias-dolorum', 'Excepturi inventore consequuntur quia pariatur facilis. Pariatur maxime vero est totam. Qui in a rem velit eveniet velit suscipit. Ut dicta voluptate saepe itaque.', 5, 'online', '662 Vandervort Centers Suite 343\nMaeganside, NC 90389-9524', 0, '1990-09-17', '1-469-940-8935 x1911', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1457'),
(16, 2, 'Quis reiciendis odit et in tempora perspiciatis dicta. Illo quisquam minus ad tempore amet ipsam. Dolore accusantium fuga architecto molestias dolor facere amet. Eum et similique neque.', 'quis-reiciendis-odit-et-in-tempora-perspiciatis-dicta-illo-quisquam-minus-ad-tempore-amet-ipsam-dolore-accusantium-fuga-architecto-molestias-dolor-facere-amet-eum-et-similique-neque', 'Aut ut molestiae quia officiis. Ratione aut id nisi non possimus quibusdam. Accusantium accusantium nihil ipsum quam ad.', 5, 'online', '40790 Hilpert Valleys\nWeberton, IA 94287-2080', 1, '2016-12-05', '369.495.6197', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '632'),
(17, 16, 'Recusandae quia dicta quisquam et et ut possimus voluptatem. Natus et soluta quisquam consequuntur eius sit consequuntur. Ut totam vero temporibus modi sequi. Repudiandae ad atque animi laborum et.', 'recusandae-quia-dicta-quisquam-et-et-ut-possimus-voluptatem-natus-et-soluta-quisquam-consequuntur-eius-sit-consequuntur-ut-totam-vero-temporibus-modi-sequi-repudiandae-ad-atque-animi-laborum-et', 'Eligendi vel ea et nostrum dolorem quis. Pariatur vero eum aperiam voluptatem voluptatum ut aut.', 4, 'online', '31033 Jaquan Divide\nLake Amani, GA 36124', 0, '1992-11-07', '839.792.3842', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '357'),
(18, 7, 'Accusamus dolorem perferendis et ipsa minima dolorem beatae. Magnam omnis voluptate in ea sunt consequatur. Dignissimos itaque iure quisquam.', 'accusamus-dolorem-perferendis-et-ipsa-minima-dolorem-beatae-magnam-omnis-voluptate-in-ea-sunt-consequatur-dignissimos-itaque-iure-quisquam', 'Temporibus repudiandae beatae explicabo enim numquam. Quos soluta ullam earum architecto voluptates aliquam. Quis dicta officiis animi aperiam sunt id voluptates.', 1, 'online', '38796 Delilah Islands\nBertaville, MD 44096', 1, '1987-12-07', '574-706-3684 x0990', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '940'),
(19, 4, 'Libero quos dolor corrupti error sunt omnis. Mollitia libero quia sint quis voluptatem. Beatae et pariatur similique earum similique. Dicta facere ea et minus nostrum optio.', 'libero-quos-dolor-corrupti-error-sunt-omnis-mollitia-libero-quia-sint-quis-voluptatem-beatae-et-pariatur-similique-earum-similique-dicta-facere-ea-et-minus-nostrum-optio', 'Commodi perferendis eum dicta ullam sunt. Impedit eum ut officia fugiat velit quos. Blanditiis ab assumenda et ipsa. Culpa expedita error aspernatur asperiores. Temporibus qui qui enim et voluptates temporibus. Labore amet temporibus labore vel unde. Cumque minima veritatis aut eius sint sunt.', 2, 'online', '92713 Ena Extension\nAdanton, CT 12533-3741', 1, '1980-12-29', '(761) 982-4208', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '1283'),
(20, 18, 'Illum nobis non deleniti laboriosam quod. Amet voluptatem unde et et beatae. Aut repudiandae voluptas enim eveniet nisi debitis.', 'illum-nobis-non-deleniti-laboriosam-quod-amet-voluptatem-unde-et-et-beatae-aut-repudiandae-voluptas-enim-eveniet-nisi-debitis', 'Assumenda aut pariatur omnis provident aut ab. Similique laudantium voluptatem accusantium deleniti consectetur cupiditate.', 2, 'online', '662 Treutel Orchard Apt. 348\nNorth Raegan, AL 26616-9551', 0, '1990-10-19', '1-467-231-9606 x12910', 'avatar/man.jpg', '2020-11-20 14:27:54', '2020-11-20 14:27:54', '379');

-- --------------------------------------------------------

--
-- Table structure for table `job_user`
--

CREATE TABLE `job_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_user`
--

INSERT INTO `job_user` (`id`, `user_id`, `job_id`, `created_at`, `updated_at`) VALUES
(2, 25, 1, '2020-11-20 14:55:38', '2020-11-20 14:55:38'),
(3, 25, 2, '2020-11-20 16:18:19', '2020-11-20 16:18:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_09_02_150619_create_profiles_table', 1),
(4, '2020_09_02_150755_create_categories_table', 1),
(5, '2020_09_02_150942_create_jobs_table', 1),
(6, '2020_09_02_151318_create_job_user_table', 1),
(7, '2020_09_02_151554_create_favourites_table', 1),
(8, '2020_10_25_185425_add_column_to_jobs', 1),
(9, '2020_11_18_125837_create_roles_table', 1),
(10, '2020_11_18_130002_create_role_user_table', 1),
(11, '2020_11_18_173833_create_posts_table', 1),
(12, '2020_11_18_201710_create_testimonials_table', 1),
(13, '2020_11_20_202553_create_applies_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `image`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'jobs are easy today', 'jobs-are-easy-today', 'rem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets', 'uploads/o07p7LFeRKoGG0yM313yc3HThrGTnRhWSFDJZkHG.jpeg', 1, NULL, '2020-11-29 11:49:59', '2020-11-29 11:49:59'),
(2, 'How to find job easily', 'how-to-find-job-easily', 'rem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets', 'uploads/WxM0eOblBdeoeQi9w1rGQReGu9CveHV4nOltqsnN.jpeg', 1, NULL, '2020-11-29 11:50:44', '2020-11-29 11:50:44'),
(3, 'Need skills for jobs', 'need-skills-for-jobs', 'rem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets', 'uploads/dsu2Vo0pAHFMIIGK0d5KN3gUyJIdFQfQPkp3tAKI.jpeg', 1, NULL, '2020-11-29 11:51:10', '2020-11-29 11:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `address`, `gender`, `dob`, `avatar`, `profession`, `bio`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 22, NULL, 'male', '1195-02-22', NULL, NULL, NULL, '01861591932', '2020-11-20 14:29:04', '2020-11-20 14:29:04'),
(2, 23, NULL, 'female', '1995-02-22', NULL, NULL, NULL, '01861591932', '2020-11-20 14:30:23', '2020-11-20 14:30:23'),
(3, 24, NULL, 'female', '1994-02-21', NULL, NULL, NULL, '01861591932', '2020-11-20 14:31:29', '2020-11-20 14:31:29'),
(4, 25, NULL, 'female', '1995-02-22', NULL, NULL, NULL, '01861591932', '2020-11-20 14:32:19', '2020-11-20 14:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-11-20 14:27:54', '2020-11-20 14:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 21, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profession` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `content`, `name`, `profession`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 'asdasdasdasdasdasdasdasdasjjdasjdaskdhkasdasdasd', 'asdasdasdasdasd', 'asdasdasdasd', 12312312, NULL, NULL),
(2, 'asdasdasdasdasdasdasdasdasjjdasjdaskdhkasdasdasd', 'asdasdasdasdasd', 'asdasdasdasd', 12312312, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `name_slug`, `user_type`, `email`, `email_verified_at`, `password`, `total_jobs`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Miss Daphne Glover', 'miss-daphne-glover', 'seeker', 'kulas.marilou@example.org', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'ouUQgMXpRh', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(2, 'Camron Upton PhD', 'camron-upton-phd', 'seeker', 'jaquelin.cummerata@example.org', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'auYYmmAFwj', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(3, 'Flossie Bruen', 'flossie-bruen', 'seeker', 'brice.barrows@example.com', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'jXZwago7kL', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(4, 'Adelia Cassin', 'adelia-cassin', 'seeker', 'gtorp@example.com', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'lo5TFzzZVR', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(5, 'Griffin Jacobi', 'griffin-jacobi', 'seeker', 'yzboncak@example.org', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'DoegJSMgkH', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(6, 'Miss Desiree Strosin PhD', 'miss-desiree-strosin-phd', 'seeker', 'flatley.letha@example.net', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'qCxweP7ACk', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(7, 'Adelia Walter', 'adelia-walter', 'seeker', 'gunner67@example.com', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Ofo6nJepVz', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(8, 'Rylan Heaney', 'rylan-heaney', 'seeker', 'collier.matteo@example.com', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'JBzdoPDz21', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(9, 'Chadrick Gleichner II', 'chadrick-gleichner-ii', 'seeker', 'martina71@example.net', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'KwpQV8enD3', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(10, 'Juvenal Cole', 'juvenal-cole', 'seeker', 'vivienne.daniel@example.org', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'ooyjlO1oXk', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(11, 'Emanuel Boyle', 'emanuel-boyle', 'seeker', 'celine.schinner@example.net', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'FZ87aKqo2R', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(12, 'Haley Russel', 'haley-russel', 'seeker', 'amir.green@example.org', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, '4lrvjRlORT', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(13, 'Prof. Kenyatta Hane I', 'prof-kenyatta-hane-i', 'seeker', 'emmet51@example.org', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'f8iUW9CEVs', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(14, 'Dr. Kacey Roob', 'dr-kacey-roob', 'seeker', 'yost.wiley@example.com', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Oe3wO7qEJL', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(15, 'Kenton Marks', 'kenton-marks', 'seeker', 'fbins@example.com', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'kcBWFlMVlt', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(16, 'Vidal Balistreri', 'vidal-balistreri', 'seeker', 'darrion31@example.com', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'dZ2SUIb6Mq', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(17, 'Joey McGlynn', 'joey-mcglynn', 'seeker', 'elyse.hill@example.org', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'bmjkBE7ofE', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(18, 'Ivory Skiles', 'ivory-skiles', 'seeker', 'chyna.wiegand@example.org', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'mds2dhCz4N', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(19, 'Kian Hauck PhD', 'kian-hauck-phd', 'seeker', 'carroll15@example.net', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'yfmCjP4qLj', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(20, 'Mrs. Tressie Lowe', 'mrs-tressie-lowe', 'seeker', 'qnicolas@example.com', '2020-11-20 14:27:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'hvs1bZ25R1', '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(21, 'admin', 'admin', 'admin', 'admin@gmail.com', '2020-11-20 14:27:54', '$2y$10$/hhizwDeiOM9PA/Oj0CKkeMAc0e35qwI.qxdo8Naay2am0GAkd7F.', 0, NULL, '2020-11-20 14:27:54', '2020-11-20 14:27:54'),
(22, 'shafayet hoosaain', 'shafayet-hoosaain', 'sharer', 'shafayethossain777@gmail.com', '2020-11-20 18:00:00', '$2y$10$SLyHk2TWbUvtB117MRFqnOvHk2hoU5C4sIDN.YSyEhB.vgJtpqrzi', 0, NULL, '2020-11-20 14:29:04', '2020-11-20 14:29:04'),
(24, 'shafayet hoosaain', 'shafayet-hoosaain', 'seeker', 'babu56tabu@gmail.com', NULL, '$2y$10$PTcMoISfUOKaJNbbyQftoembVLBEUbA69yWJRTgi8.Q5WQLU1AroO', 0, NULL, '2020-11-20 14:31:29', '2020-11-20 14:31:29'),
(25, 'shafayet hoosaain', 'shafayet-hoosaain', 'seeker', 'babu56labu@gmail.com', '2020-11-20 18:00:00', '$2y$10$eNKBRR0R6MojCm3plJ9/sOrqjJ9YMcKCuvWhXGUooVx.YWsfY4FMy', 3, NULL, '2020-11-20 14:32:19', '2020-11-20 16:18:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applies`
--
ALTER TABLE `applies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_user`
--
ALTER TABLE `job_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applies`
--
ALTER TABLE `applies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `job_user`
--
ALTER TABLE `job_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
