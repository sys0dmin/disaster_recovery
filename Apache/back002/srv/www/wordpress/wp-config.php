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
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_db_1' );

/** Database username */
define( 'DB_USER', 'wp_user' );

/** Database password */
define( 'DB_PASSWORD', '113525' );

/** Database hostname */
define( 'DB_HOST', 'sql-master.mshome.net' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         'T0qzm:j5V(]{1t$HUtyc#PqE8k6);luJ=fv-v4A9i[f}nSL3Q3_f]AQ3{jLhA|pv' );
define( 'SECURE_AUTH_KEY',  '*rjEZOjgX))%3#i_8Mq*45EPXW+B*mXf7/otrXQvr}ckK,P_Ht`5YOsN)w/(}J0_' );
define( 'LOGGED_IN_KEY',    'rHY]WF._{;zm~JwvR_sc*{*m1^6?/qc]|p:OUpGlGFNH?rc5MF$yfNw;1;z=m2._' );
define( 'NONCE_KEY',        '2$`{O$tdHO-8#HMmx3_<P}v$h8@wiKIdML%!h@/Euu3DOpv_Ism>- VQ}1H1<5%O' );
define( 'AUTH_SALT',        '*r@6A_4,@mEc>5t*a(`{W{?u5lF7rrj-0y3o_+[i$o`-`D;JpWE,/LE)YPts!M9=' );
define( 'SECURE_AUTH_SALT', '4gsCE)2ITMzWo]%OR&NjE80*P%uA03JU[&)#(~UEpeBm=Y`27j@3RH7bXQ[9pyQI' );
define( 'LOGGED_IN_SALT',   '9YRlhw6AvV%Lm8,dy{t:<>`)~nVTbm,.UH_h}=ssncH]U$3MH`s_dV{>hYASG213' );
define( 'NONCE_SALT',       'Y^f[HLA7j{w=#]Hi!Z:xiGMgb|eHrf+6G~acpia1Hy:ljjF?elsOO1S,t$VTu-b+' );

/**#@-*/

/**
 * WordPress database table prefix.
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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
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
