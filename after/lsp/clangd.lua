local clangd_path = os.getenv("CLANGD")
if not clangd_path then
    clangd_path = "clangd"
end

return {
    cmd = {
        clangd_path, '--header-insertion=never', '--function-arg-placeholders=0'
    }
}
