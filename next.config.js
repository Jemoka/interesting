module.exports = {
    webpack: (config) => {
        config.module.rules.push(
            {
                test: /\.md$/,
                use: 'raw-loader'
            }
        )

        config.module.rules.push(
            {
                test: /\.html$/,
                use: 'raw-loader'
            }
        )

        return config
    },
}

