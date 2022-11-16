<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'DATABASE_NAME' );

/** Database username */
define( 'DB_USER', "DATABASE_USER" );

/** Database password */
define( 'DB_PASSWORD', "DATABASE_PASS" );

/** Database hostname */
define( 'DB_HOST', 'mysql' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         's(?-Lqh5X&I1w&lcG-soL-P+_<pY}A,=VTJ029+H]U<-r9$@Wr,-?Q(y-=~$;:*W');
define('SECURE_AUTH_KEY',  'KNw`aV}9< cwlXUUVzDNtt|+ki!}Y%>~$cOfUr9)DdC!(h~fX}69@eKqyUewS!n4');
define('LOGGED_IN_KEY',    '>|QLn~Je_+muY>K&b_|jC`ENT=V#cZ}f0qL]O9dMM#&ceG:<opH,P09Z-kMK_UC`');
define('NONCE_KEY',        '`q@Nr;M*bJ(yOC>)6W{TW)=Tl<%6aPYR{4q-7|U|rX|L<AX1>3i7}NfD0b)av9T:');
define('AUTH_SALT',        'ig8.(Z6d>W92yb{9jMvj:fyF}u95]Nx#*u-4$0-Z0aGT?E4M|us0]Gan+A3b,#QC');
define('SECURE_AUTH_SALT', '[m/R&qx~F:$8|D75V:PoyfY@Sc<lFtis*GN*jf-d%B2,F2B+L|G_28piamVnF?9@');
define('LOGGED_IN_SALT',   'Bgqlq9i9!f^Mi[MU.,R<Z1-uS4AUI{kk:Y[A66v?hWlf*Iq;]JkBL].r^F|P{Vbb');
define('NONCE_SALT',       'c}&(!1|h0ABhxc:%#V%CvE?#|0.U.kx7rk7Y+s[k7l|Sd3Fdu{+:2j$pn73vt%sN');


/**#@-*/
/* insert keys here */

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
