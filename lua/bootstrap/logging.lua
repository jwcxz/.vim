-- simple logging utility for debugging configuration

CFG_LOG_NONE  = 0
CFG_LOG_ERROR = 1
CFG_LOG_WARN  = 2
CFG_LOG_INFO  = 3
CFG_LOG_DEBUG = 4

CFG_LOG_LOWEST  = CFG_LOG_NONE
CFG_LOG_HIGHEST = CFG_LOG_DEBUG


cfg_log_level = CFG_LOG_INFO


function cfg_set_log_level(level)
    if level < CFG_LOG_LOWEST or level > CFG_LOG_HIGHEST then
        error(string.format("Log level must be between %d and %d (got %d)", CFG_LOG_LOWEST, CFG_LOG_HIGHEST, level))
    end

    cfg_log_level = level
end

function cfg_log(level, ...)
    if level > cfg_log_level then return end
    vim.print(...)
end

function cfg_error(...) cfg_log(CFG_LOG_ERROR, ...) end
function cfg_warn(...) cfg_log(CFG_LOG_WARN, ...) end
function cfg_info(...) cfg_log(CFG_LOG_INFO, ...) end
function cfg_debug(...) cfg_log(CFG_LOG_DEBUG, ...) end
