package SnomMonitor::Snom;
use Mojo::Base 'Mojolicious::Controller';
 use Desktop::Notify;



sub ring {
  my $self = shift;

  my $number = $self->param('number');
  my $display_remote = $self->param('display_remote') || 'Unknown';

  if ($number) {

      # Open a connection to the notification daemon
      my $notify = Desktop::Notify->new();

      my $message = sprintf('Incoming Call from %s (%s)', $display_remote,
          $number); 

      my $notification = $notify->create(summary => 'SnomMonitor',
          body => $message,
          timeout => 5000);

      # Display the notification
      $notification->show();

      # Close the notification
      $notification->close();

      $self->render(
        text => "Number $number received");

  } else {
      $self->render(
          text => "Usage: _url_?number=phonenumber_of_caller");
  }
}

1;
