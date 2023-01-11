# Install Flask on the computer

package { 'flask':
  ensure   => 'installed',
  provider => pip,
}
