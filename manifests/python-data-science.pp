package {['pandas',
          'numpy',
          'scipy',
          'scikit-learn',
          'matplotlib']:
    ensure   => present,
    provider => 'pip3',
}
