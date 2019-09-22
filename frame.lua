--press "shift + p" --> set_frame()
--press "p" --> seek_frame()

function get_info()
    local fr = mp.get_property("estimated-frame-number") + 1
    local to = mp.get_property("estimated-frame-count")
    return string.format(
        "%s / %s",
        fr,
        to
    )
end

function render_info()
    mp.osd_message(get_info())
end

timeff = 0
setff = 1
function set_msg()
    setff = mp.get_property("estimated-frame-number") + 1 
    return string.format(
        "Frame set: %s",
        setff
    )
end

function seek_msg() 
    return string.format(
        "Frame seek: %s",
        setff
    )
end

function set_time()
    mp.osd_message(set_msg())
    timeff = mp.get_property_native("time-pos")
end

function seek_time()
    mp.set_property_native("time-pos",timeff)
    mp.osd_message(seek_msg())
end

mp.add_key_binding("f", "get_info", render_info)
mp.add_key_binding("Shift+p", "set_time", set_time)
mp.add_key_binding("p", "seek_time", seek_time)