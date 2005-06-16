<?php
//
// Definition of Basket_cleanup class
//
// Created on: <14-Jun-2005 14:44:49 amos>
//
// Copyright (C) 1999-2005 eZ systems as. All rights reserved.
//
// This source file is part of the eZ publish (tm) Open Source Content
// Management System.
//
// This file may be distributed and/or modified under the terms of the
// "GNU General Public License" version 2 as published by the Free
// Software Foundation and appearing in the file LICENSE included in
// the packaging of this file.
//
// Licencees holding a valid "eZ publish professional licence" version 2
// may use this file in accordance with the "eZ publish professional licence"
// version 2 Agreement provided with the Software.
//
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING
// THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE.
//
// The "eZ publish professional licence" version 2 is available at
// http://ez.no/ez_publish/licences/professional/ and in the file
// PROFESSIONAL_LICENCE included in the packaging of this file.
// For pricing of this licence please contact us via e-mail to licence@ez.no.
// Further contact information is available at http://ez.no/company/contact/.
//
// The "GNU General Public License" (GPL) is available at
// http://www.gnu.org/copyleft/gpl.html.
//
// Contact licence@ez.no if any conditions of this licencing isn't clear to
// you.
//

/*! \file basket_cleanup.php
*/

include_once( 'lib/ezutils/classes/ezini.php' );

$ini =& eZINI::instance();

// Check if this should be run in a cronjob
$useCronjob = $ini->variable( 'Session', 'BasketCleanup' ) == 'cronjob';
if ( !$useCronjob )
    return;

// Only do basket cleanup once in a while
$freq = $ini->variable( 'Session', 'BasketCleanupAverageFrequency' );
if ( mt_rand( 1, max( $freq, 1 ) ) != 1 )
    return;

include_once( 'kernel/classes/ezbasket.php' );
include_once( 'kernel/classes/ezdbgarbagecollector.php' );

$maxTime = $ini->variable( 'Session', 'BasketCleanupTime' );
$idleTime = $ini->variable( 'Session', 'BasketCleanupIdleTime' );
$fetchLimit = $ini->variable( 'Session', 'BasketCleanupFetchLimit' );

if ( !$isQuiet )
    $cli->output( "Cleaning up expired baskets" );
eZDBGarbageCollector::collectBaskets( $maxTime, $idleTime, $fetchLimit );

?>
