package = 'tarantool-rust-crud'
version = 'scm-1'
source  = {
    url = '/dev/null',
}
-- Put any modules your app depends on here
dependencies = {
    'tarantool',
    'lua >= 5.1',
    'cartridge == 2.7.4-1',
}
build = {
    type = 'none';
}
