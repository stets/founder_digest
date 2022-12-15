const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: { // custom color palette for branding
        'primary': 'rgb(79, 70, 229)',
        'brand-blue': '#18327a',
        'brand-blue-dark': '#142962',
        'brand-orange': '#ee9343',
        'brand-orange-dark': '#c47937',
        'primary-hover': {
          '700': '#a4411c',
          '500': '#EA9A72',
        }, 
        'accent': '#FF5733', 
        'accent-hover': '#D2482A'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
