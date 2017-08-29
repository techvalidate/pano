# Store local time zone in cookie
tz = jstz.determine()
Cookies.set('timezone', tz.name(), {expires: 7, path: '/'})
