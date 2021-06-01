module.exports = {
    purge: ['./pages/**/*.js', './components/**/*.js'],
    //darkMode: 'media',
    theme: {
        extend: {
            colors: {
                gray: {
                    darkest: '#171717',
                    dark: '#1c1c1c',
                    lightdark: '#262626',
                    DEFAULT: '#c0ccda',
                    light: '#e0e6ed',
                    lightest: '#f9fafc',
                }
            }
        },
    },
    variants: {
        extend: {},
    },
    plugins: [],
}
