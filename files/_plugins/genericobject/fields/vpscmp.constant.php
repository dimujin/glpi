<?php
global $GO_FIELDS, $LANG;

$GO_FIELDS['plugin_genericobject_virtualmachine_id']['name']     = $LANG['genericobject']['PluginGenericobjectVpscmp'][0];
$GO_FIELDS['plugin_genericobject_virtualmachine_id']['field']    = 'classeelec';
$GO_FIELDS['plugin_genericobject_virtualmachine_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vps_memory_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][1];
$GO_FIELDS['plugin_genericobject_vps_memory_id']['field']      = 'vps_memory';
$GO_FIELDS['plugin_genericobject_vps_memory_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vps_cpu_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][2];
$GO_FIELDS['plugin_genericobject_vps_cpu_id']['input_type'] = 'integer';
$GO_FIELDS['plugin_genericobject_vps_cpu_id']['min']        = 1; //not mandatory, by default 0
$GO_FIELDS['plugin_genericobject_vps_cpu_id']['max']        = 100; //not mandatory, by default 100
$GO_FIELDS['plugin_genericobject_vps_cpu_id']['step']       = 1; //not mandatory, by default 1

$GO_FIELDS['plugin_genericobject_vps_hdd_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][3];
$GO_FIELDS['plugin_genericobject_vps_hdd_id']['field']      = 'vps_hdd';
$GO_FIELDS['plugin_genericobject_vps_hdd_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vps_email_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][4];
$GO_FIELDS['plugin_genericobject_vps_email_id']['field']      = 'vps_email';
$GO_FIELDS['plugin_genericobject_vps_email_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vps_login_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][5];
$GO_FIELDS['plugin_genericobject_vps_login_id']['field']      = 'vps_login';
$GO_FIELDS['plugin_genericobject_vps_login_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vps_password_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][6];
$GO_FIELDS['plugin_genericobject_vps_password_id']['field']      = 'vps_password';
$GO_FIELDS['plugin_genericobject_vps_password_id']['input_type'] = 'dropdown';

$GO_FIELDS['plugin_genericobject_vps_os_id']['name']       = $LANG['genericobject']['PluginGenericobjectVpscmp'][7];
$GO_FIELDS['plugin_genericobject_vps_os_id']['field']      = 'vps_os';
$GO_FIELDS['plugin_genericobject_vps_os_id']['input_type'] = 'dropdown';

?>

