<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
$routes->setAutoRoute(true);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->get('/akun1', 'Akun1::index');
$routes->post('/akun1', 'Akun1::store'); 
$routes->put('/akun1/edit/(:any)', 'Akun1::update/$1');
$routes->delete('/akun1/(:any)', 'Akun1::destroy/$1');

$routes->get('/akun2/new', 'Akun2::new');
$routes->put('/akun2/(:segment)/edit', 'Akun2::edit/$1');
$routes->post('/akun2/(:any)', 'Akun2::delete/$1');

$routes->get('/akun3/new', 'Akun3::new');
$routes->post('/akun3/new', 'Akun3::create');
$routes->get('/akun3/(:segment)/edit', 'Akun3::edit/$1');
// $routes->post('/akun2/(:any)', 'Akun3::delete/$1');

$routes->get('/transaksi', 'Transaksi::index');
$routes->get('/transaksi/new', 'Transaksi::new');
$routes->post('/transaksi', 'Transaksi::create');
$routes->get('/transaksi/(:segment)/edit', 'Transaksi::edit/$1');
$routes->get('/transaksi/(:any)', 'Transaksi::show/$1');

$routes->get('/penyesuaian', 'Penyesuaian::index');
$routes->get('/penyesuaian/new', 'Penyesuaian::new');
$routes->post('/penyesuaian/(:any)', 'Penyesuaian::delete/$1');
$routes->get('/penyesuaian/(:segment)/edit', 'Penyesuaian::edit/$1');
$routes->get('/penyesuaian/(:any)', 'Penyesuaian::show/$1');

$routes->post('/jurnalumum', 'JurnalUmum::index');

$routes->get('/admin', 'Admin::index', ['filter' => 'role:admin']);
$routes->get('/admin/index', 'Admin::index', ['filter' => 'role:admin']);
$routes->get('/admin/(:any)', 'Admin::detail/$1',['filter' => 'role:admin']);


$routes->resource('akun2');
$routes->resource('akun3');
$routes->resource('transaksi');
$routes->resource('penyesuaian');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
