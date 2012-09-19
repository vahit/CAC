#!/bin/bash
declare -i vol;
vol=`dbus-send --print-reply --type=method_call --dest=com.nokia.mafw.renderer.Mafw-Gst-Renderer-Plugin.gstrenderer /com/nokia/mafw/renderer/gstrenderer com.nokia.mafw.extension.get_extension_property string:volume|awk '/nt/ {print $3}'`;
vol=$vol$1;
if [ $vol -le 0 ] ; then
	vol=11;
elif [ $vol -ge 100 ] ; then
	vol=99;
fi
	dbus-send --type=method_call --dest=com.nokia.mafw.renderer.Mafw-Gst-Renderer-Plugin.gstrenderer /com/nokia/mafw/renderer/gstrenderer com.nokia.mafw.extension.set_extension_property string:volume variant:uint32:$vol
        dbus-send --type=method_call --dest=org.freedesktop.Notifications /org/freedesktop/Notifications org.freedesktop.Notifications.SystemNoteInfoprint string:"Volume: $vol"
exit 0
