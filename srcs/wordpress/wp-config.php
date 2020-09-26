<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', '1234');

/** MySQL hostname */
define('DB_HOST', 'mariadb');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'yvAZP+IH:mb~@`kJN_yToibx;1wS#xAh+j=jKBTKxAd+65x+OIuz]7x zo6%GcHh');
define('SECURE_AUTH_KEY',  '+EV}goaXi-3*ee++^No,A#9Kg;1-;b|4{m-1K,n]61H2kYHm4ZM+IY^;b|LP-O{h');
define('LOGGED_IN_KEY',    'E|$iq$.h}mvsDVr@PW:Kt~?**O8tVB*kMo{$pGLE*zc}e-H?S84Tq#jcK[{9!eRk');
define('NONCE_KEY',        '}r&zOw2B7t>v~D#|cWp7t+V=$P:}s) XB:d#&jlsx+jnrxTGmqZ%wn];f&H9WaTv');
define('AUTH_SALT',        '-HTBf*k)s~[`|P2I6Yz92gH R/d_5<mHfDc0KW~%>B5D5tn1 5-w7|=a>%Cmwp{/');
define('SECURE_AUTH_SALT', ';~:)5#O}`$CpuhD1A/T+7?_uR-eHIcvf62D#8#sGf:WL: ,%4*!97Rc+SvM5pYB+');
define('LOGGED_IN_SALT',   '&y0nyHE@.u3yEebJJk&54@l7AX3|S%V|g=b24@$MQj$ WFB6b#Z,~B%Fq/+u0ujg');
define('NONCE_SALT',       ';R?:6)=%Q))##*O=D4uoM:{/ 4(O9] =[t-eR1B=7aPnqO]V#R^xo?Zp70JY{)h`');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');