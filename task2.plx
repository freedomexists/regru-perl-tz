#!/usr/bin/perl


package Animal; {
    use strict;
    
    sub new {
        my($class) = @_;
        my $self = {
            name => 'Animal',
            age => 42,
            status => "Alive"
        };
        bless $self, $class;
    }
    
    sub get_age {
        my($self) = @_;
        return $self->{age}
    }
    
    sub to_die {
        my($self) = @_;
        $self->{status} = 'Dead';
    }
}

package Cat; {
    use base Animal;
    use strict;
    
    sub new {
        my($class) = @_;
        my $self = Animal::new($class);
        $self->{name} = "Cat";
        $self->{lives} = 9;
        bless $self, $class;
    }
    
    sub get_age {
        my($self) = @_;
        return $self->{age}
    }
    
    sub to_die {
        my($self) = @_;
        $self->{lives}--;
        if ($self->{lives} == 0) {
            $self->SUPER::to_die()
        }
    }
    sub get_lives{
        my($self) = @_;
        return $self->{lives}
    }
    sub get_status {
        my($self) = @_;
        return $self->{status}
    }
}



use strict;
my $cat = Cat->new();
while ($cat->get_status() eq "Alive") {
    $cat->to_die();
    print $cat->get_lives()." lives left. Cat is ".$cat->get_status()."\n";
}


