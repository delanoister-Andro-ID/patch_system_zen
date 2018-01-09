#!/bin/bash
ADB=`type -p adb`
if ! [[ "$ADB" ]]; then
    echo "ERROR: ADB is required"
    exit 1
fi

rm -f stock/SystemUI.apk
rm -f stock/framework-res.apk
rm -f stock/build.prop
mkdir -p stock

echo "ADB Pulling..."
$ADB pull /system/priv-app/SystemUI/SystemUI.apk stock/ &>/dev/null
$ADB pull /system/framework/framework-res.apk stock/ &>/dev/null
$ADB pull /system/build.prop stock/ &>/dev/null

if ( [ -f "stock/SystemUI.apk" ] && [ -f "stock/framework-res.apk" ] && [ -f "stock/build.prop" ] ); then
    echo "Pulling succesful"
else
    echo "ERROR: Failed to pull files"
    echo "Check USB debugging settings"
    exit 1
fi