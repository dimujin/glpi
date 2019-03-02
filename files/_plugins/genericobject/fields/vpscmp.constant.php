<?php
global $GO_FIELDS, $LANG;

$GO_FIELDS['plugin_genericobject_vps_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][0];
$GO_FIELDS['plugin_genericobject_vps_id']['field']      = 'vps';
$GO_FIELDS['plugin_genericobject_vps_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vpsmemory_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][1];
$GO_FIELDS['plugin_genericobject_vpsmemory_id']['field']      = 'vpsmemory';
$GO_FIELDS['plugin_genericobject_vpsmemory_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vpscpu_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][2];
$GO_FIELDS['plugin_genericobject_vpscpu_id']['input_type'] = 'integer';
$GO_FIELDS['plugin_genericobject_vpscpu_id']['min']        = 1; //not mandatory, by default 0
$GO_FIELDS['plugin_genericobject_vpscpu_id']['max']        = 100; //not mandatory, by default 100
$GO_FIELDS['plugin_genericobject_vpscpu_id']['step']       = 1; //not mandatory, by default 1

$GO_FIELDS['plugin_genericobject_vpshdd_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][3];
$GO_FIELDS['plugin_genericobject_vpshdd_id']['field']      = 'vpshdd';
$GO_FIELDS['plugin_genericobject_vpshdd_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vpsemail_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][4];
$GO_FIELDS['plugin_genericobject_vpsemail_id']['field']      = 'vpsemail';
$GO_FIELDS['plugin_genericobject_vpsemail_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vpslogin_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][5];
$GO_FIELDS['plugin_genericobject_vpslogin_id']['field']      = 'vpslogin';
$GO_FIELDS['plugin_genericobject_vpslogin_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vpspassword_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][6];
$GO_FIELDS['plugin_genericobject_vpspassword_id']['field']      = 'vpspassword';
$GO_FIELDS['plugin_genericobject_vpspassword_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vpsos_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][7];
$GO_FIELDS['plugin_genericobject_vpsos_id']['field']      = 'vpsos';
$GO_FIELDS['plugin_genericobject_vpsos_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vpssrv_id']['name']     = $LANG['genericobject']['PluginGenericobjectVpscmp'][8];
$GO_FIELDS['plugin_genericobject_vpssrv_id']['field']    = 'vpssrv';
$GO_FIELDS['plugin_genericobject_vpssrv_id']['input_type'] = 'dropdown';

?>

